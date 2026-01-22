"""
API REST para la aplicación Control Patrimonial
Endpoints para operaciones AJAX y consumo desde aplicaciones externas
"""
from flask import jsonify, request, current_app, send_file
from flask_login import login_required, current_user
from datetime import datetime
import os
import io
import tempfile
from app.api import bp
from app import db, limiter, csrf
from app.models_sqlalchemy import Bien
from app.repository import RepoSQLAlchemy as Repo  # Usar ORM en lugar de SQL raw
from app.utils import log_action, validate_bien_data, get_bien_display_data, log_security_event
from app.services.import_export_service import ImportService, ExportService
from app.decorators import require_edit_permission

# ==================== UTILIDADES ====================
def api_error(message, status_code=400):
    """Respuesta de error en formato JSON"""
    return jsonify({'error': message, 'success': False}), status_code

def api_success(data=None, message='Éxito', status_code=200):
    """Respuesta exitosa en formato JSON"""
    response = {'success': True, 'message': message}
    if data is not None:
        response['data'] = data
    return jsonify(response), status_code


# ==================== BIENES ====================
@bp.route('/bienes', methods=['GET'])
@login_required
def get_bienes():
    """Obtener lista de bienes con paginación y filtros"""
    try:
        page = request.args.get('page', 1, type=int)
        per_page = request.args.get('per_page', 20, type=int)

        # Limitar per_page para no sobrecargar
        if per_page > 100:
            per_page = 100

        filtros = {
            'q': request.args.get('q', ''),
            'sede': request.args.get('sede', ''),
            'dependencia': request.args.get('dependencia', ''),
            'estado': request.args.get('estado', ''),
            'verificacion': request.args.get('verificacion', ''),
        }

        offset = (page - 1) * per_page
        repo = Repo()

        bienes = repo.listar_bienes(filtros, limit=per_page, offset=offset)
        total = repo.contar_bienes(filtros)

        bienes_formatted = [get_bien_display_data(bien) for bien in bienes]

        return api_success({
            'bienes': bienes_formatted,
            'total': total,
            'page': page,
            'per_page': per_page,
            'total_pages': (total + per_page - 1) // per_page
        })
    except Exception as e:
        current_app.logger.error(f"Error en GET /api/bienes: {str(e)}")
        return api_error('Error al obtener bienes', 500)


@bp.route('/bienes/<int:bien_id>', methods=['GET'])
@login_required
def get_bien(bien_id):
    """Obtener detalles de un bien específico"""
    try:
        repo = Repo()
        bien = repo.obtener_bien(bien_id)

        if not bien:
            return api_error('Bien no encontrado', 404)

        return api_success(get_bien_display_data(bien))
    except Exception as e:
        current_app.logger.error(f"Error en GET /api/bienes/{bien_id}: {str(e)}")
        return api_error('Error al obtener bien', 500)


@csrf.exempt
@csrf.exempt
@bp.route('/bienes', methods=['POST'])
@login_required
@require_edit_permission
def crear_bien_api():
    """Crear un nuevo bien"""
    try:
        data = request.get_json()

        # Validar datos
        errors = validate_bien_data(data)
        if errors:
            return api_error(f"Validación fallida: {', '.join(errors)}", 400)

        repo = Repo()
        bien_id = repo.crear_bien(data, current_user.username)

        log_action('CREAR_BIEN', f'Bien {bien_id} creado por {current_user.username}')
        return api_success({'bien_id': bien_id}, 'Bien creado exitosamente', 201)

    except Exception as e:
        current_app.logger.error(f"Error en POST /api/bienes: {str(e)}")
        log_action('ERROR', f'Error al crear bien: {str(e)}')
        return api_error('Error al crear bien', 500)


@bp.route('/bienes/<int:bien_id>', methods=['PUT', 'PATCH'])
@login_required
@require_edit_permission
def actualizar_bien_api(bien_id):
    """Actualizar un bien existente"""
    try:
        repo = Repo()
        bien = repo.obtener_bien(bien_id)

        if not bien:
            return api_error('Bien no encontrado', 404)

        data = request.get_json()

        # Validar datos (parcial para PATCH)
        errors = validate_bien_data(data)
        if errors:
            return api_error(f"Validación fallida: {', '.join(errors)}", 400)

        repo.actualizar_bien(bien_id, data, current_user.username)
        log_action('ACTUALIZAR_BIEN', f'Bien {bien_id} actualizado por {current_user.username}')

        return api_success(None, 'Bien actualizado exitosamente')

    except Exception as e:
        current_app.logger.error(f"Error en PUT /api/bienes/{bien_id}: {str(e)}")
        log_action('ERROR', f'Error al actualizar bien {bien_id}: {str(e)}')
        return api_error('Error al actualizar bien', 500)


# ==================== ESTADÍSTICAS ====================
@bp.route('/estadisticas', methods=['GET'])
@login_required
def get_estadisticas():
    """Obtener estadísticas generales"""
    try:
        repo = Repo()
        stats = repo.obtener_resumen_completo()

        return api_success(stats, 'Estadísticas obtenidas')
    except Exception as e:
        current_app.logger.error(f"Error en GET /api/estadisticas: {str(e)}")
        return api_error('Error al obtener estadísticas', 500)


@bp.route('/estadisticas/progreso', methods=['GET'])
@login_required
def get_progreso():
    """Obtener progreso CAL 2025"""
    try:
        repo = Repo()
        progreso = repo.obtener_progreso_cal_2025()

        return api_success(progreso)
    except Exception as e:
        current_app.logger.error(f"Error en GET /api/estadisticas/progreso: {str(e)}")
        return api_error('Error al obtener progreso', 500)


# ==================== CATÁLOGOS ====================
@bp.route('/sedes', methods=['GET'])
@login_required
def get_sedes():
    """Obtener lista de sedes"""
    try:
        repo = Repo()
        sedes = repo.obtener_sedes()

        sedes_list = [{'id': s[0], 'nombre': s[1]} for s in sedes]
        return api_success(sedes_list)
    except Exception as e:
        current_app.logger.error(f"Error en GET /api/sedes: {str(e)}")
        return api_error('Error al obtener sedes', 500)


@bp.route('/dependencias', methods=['GET'])
@login_required
def get_dependencias():
    """Obtener lista de dependencias/unidades"""
    try:
        repo = Repo()
        unidades = repo.obtener_unidades()

        unidades_list = [{'id': u[0], 'nombre': u[1]} for u in unidades]
        return api_success(unidades_list)
    except Exception as e:
        current_app.logger.error(f"Error en GET /api/dependencias: {str(e)}")
        return api_error('Error al obtener dependencias', 500)


# ==================== BÚSQUEDA ====================
@csrf.exempt
@csrf.exempt
@bp.route('/buscar', methods=['POST'])
@login_required
def buscar():
    """Búsqueda inteligente de bienes"""
    try:
        data = request.get_json()
        query = data.get('query', '').lower()

        if not query or len(query) < 2:
            return api_error('La búsqueda debe tener al menos 2 caracteres', 400)

        repo = Repo()
        filtros = {'q': query}
        resultados = repo.listar_bienes(filtros, limit=50, offset=0)

        resultados_formatted = [get_bien_display_data(bien) for bien in resultados]
        return api_success({
            'resultados': resultados_formatted,
            'total': len(resultados_formatted)
        }, 'Búsqueda completada')

    except Exception as e:
        current_app.logger.error(f"Error en POST /api/buscar: {str(e)}")
        return api_error('Error en búsqueda', 500)


# ==================== INFORMACIÓN DE USUARIO ====================
@bp.route('/me', methods=['GET'])
@login_required
def get_current_user():
    """Obtener información del usuario actual"""
    return api_success({
        'username': current_user.username,
        'nombre': current_user.nombre,
        'rol': current_user.rol,
        'is_admin': current_user.is_admin
    })


# ==================== EXPORTACIÓN ====================
@bp.route('/exportar/excel', methods=['GET'])
@login_required
@limiter.limit("5 per minute")
def exportar_excel():
    """Exportar bienes a Excel"""
    try:
        filtros = {
            'q': request.args.get('q', ''),
            'sede': request.args.get('sede', ''),
            'dependencia': request.args.get('dependencia', ''),
            'estado': request.args.get('estado', ''),
            'verificacion': request.args.get('verificacion', ''),
            'inventariador': request.args.get('inventariador', ''),
        }

        # Limpiar filtros vacíos
        filtros = {k: v for k, v in filtros.items() if v}

        # Contar bienes que se exportarán
        repo = Repo()
        total_registros = repo.contar_bienes(filtros)

        wb = ExportService.exportar_excel(filtros)

        # Convertir workbook a bytes
        excel_bytes = io.BytesIO()
        wb.save(excel_bytes)
        excel_bytes.seek(0)

        log_action('EXPORTAR', f'Excel exportado por {current_user.username} - {total_registros} registros - Filtros: {str(filtros)}')
        log_security_event(
            'EXPORT_EXCEL',
            f'Usuario {current_user.username} exportó {total_registros} registros a Excel con filtros: {str(filtros)}',
            severity='INFO'
        )

        return send_file(
            excel_bytes,
            mimetype='application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
            as_attachment=True,
            download_name=f'bienes_{datetime.now().strftime("%Y%m%d_%H%M%S")}.xlsx'
        )
    except Exception as e:
        current_app.logger.error(f"Error exportando Excel: {str(e)}")
        log_security_event(
            'EXPORT_EXCEL_ERROR',
            f'Error al exportar Excel: {str(e)}',
            severity='ERROR'
        )
        return api_error(f'Error exportando: {str(e)}', 500)


@bp.route('/exportar/csv', methods=['GET'])
@login_required
@limiter.limit("10 per minute")
def exportar_csv():
    """Exportar bienes a CSV"""
    try:
        filtros = {
            'q': request.args.get('q', ''),
            'sede': request.args.get('sede', ''),
            'dependencia': request.args.get('dependencia', ''),
            'estado': request.args.get('estado', ''),
            'verificacion': request.args.get('verificacion', ''),
            'inventariador': request.args.get('inventariador', ''),
        }

        # Limpiar filtros vacíos
        filtros = {k: v for k, v in filtros.items() if v}

        # Contar bienes que se exportarán
        repo = Repo()
        total_registros = repo.contar_bienes(filtros)

        csv_content = ExportService.exportar_csv(filtros)

        log_action('EXPORTAR', f'CSV exportado por {current_user.username} - {total_registros} registros - Filtros: {str(filtros)}')
        log_security_event(
            'EXPORT_CSV',
            f'Usuario {current_user.username} exportó {total_registros} registros a CSV con filtros: {str(filtros)}',
            severity='INFO'
        )

        return send_file(
            io.BytesIO(csv_content.encode('utf-8')),
            mimetype='text/csv',
            as_attachment=True,
            download_name=f'bienes_{datetime.now().strftime("%Y%m%d_%H%M%S")}.csv'
        )
    except Exception as e:
        current_app.logger.error(f"Error exportando CSV: {str(e)}")
        log_security_event(
            'EXPORT_CSV_ERROR',
            f'Error al exportar CSV: {str(e)}',
            severity='ERROR'
        )
        return api_error(f'Error exportando: {str(e)}', 500)


# ==================== IMPORTACIÓN ====================
@bp.route('/importar/plantilla', methods=['GET'])
@login_required
def descargar_plantilla():
    """Descargar plantilla Excel vacía para importación"""
    try:
        wb = ExportService.generar_plantilla_importacion()

        excel_bytes = io.BytesIO()
        wb.save(excel_bytes)
        excel_bytes.seek(0)

        log_action('DESCARGAR_PLANTILLA', f'Plantilla descargada por {current_user.username}')

        return send_file(
            excel_bytes,
            mimetype='application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
            as_attachment=True,
            download_name='plantilla_importacion.xlsx'
        )
    except Exception as e:
        current_app.logger.error(f"Error generando plantilla: {str(e)}")
        return api_error(f'Error generando plantilla: {str(e)}', 500)


@csrf.exempt
@csrf.exempt
@bp.route('/importar/excel', methods=['POST'])
@login_required
@require_edit_permission
def importar_excel():
    """Importar bienes desde Excel"""
    try:
        if 'archivo' not in request.files:
            return api_error('No se proporcionó archivo', 400)

        file = request.files['archivo']
        if not file or not file.filename.endswith(('.xlsx', '.xls')):
            return api_error('El archivo debe ser .xlsx o .xls', 400)

        try:
            # Importar directamente desde el objeto file (stream)
            # Pandas read_excel acepta file-like objects
            resultado = ImportService.importar_excel(file, current_user.username)

            creados = resultado.get("creados", 0)
            actualizados = resultado.get("actualizados", 0)
            errores = len(resultado.get('errores', []))
            total_procesados = resultado.get('total_procesados', 0)

            log_action('IMPORTAR_EXCEL', f'Proceso finalizado por {current_user.username}: Creados={creados}, Actualizados={actualizados}, Errores={errores}, Total={total_procesados}')
            log_security_event(
                'IMPORT_EXCEL',
                f'Usuario {current_user.username} importó {total_procesados} registros (Creados: {creados}, Actualizados: {actualizados}, Errores: {errores})',
                severity='INFO'
            )

            return api_success({
                'creados': creados,
                'actualizados': actualizados,
                'actualizados': resultado.get('actualizados', 0),
                'errores': errores,
                'total_procesados': total_procesados,
                'detalles_errores': resultado.get('errores', [])[:10]  # Primeros 10 errores
            })

        except Exception as e:
            current_app.logger.error(f"Error importando: {str(e)}")
            log_security_event(
                'IMPORT_EXCEL_ERROR',
                f'Error al importar Excel: {str(e)}',
                severity='ERROR'
            )
            return api_error(f'Error importando: {str(e)}', 500)

    except Exception as e:
        current_app.logger.error(f"Error general en endpoint importar: {str(e)}")
        return api_error('Error interno del servidor', 500)


# ==================== HISTORIAL ====================
@bp.route('/historial/<int:bien_id>', methods=['GET'])
@login_required
def get_historial(bien_id):
    """Obtener historial de cambios de un bien"""
    try:
        repo = Repo()
        historial = repo.get_historial(bien_id)

        if not historial:
            return api_success({'historial': [], 'bien_id': bien_id}, 'Sin historial registrado')

        return api_success({'historial': historial, 'bien_id': bien_id}, 'Historial obtenido')
    except Exception as e:
        current_app.logger.error(f"Error obteniendo historial: {str(e)}")
        return api_error('Error al obtener historial', 500)


# ==================== USUARIOS ====================
@bp.route('/usuarios', methods=['GET'])
@login_required
def get_usuarios():
    """Obtener lista de usuarios"""
    try:
        repo = Repo()
        usuarios = repo.obtener_usuarios_app()

        usuarios_list = [
            {
                'username': u[0],
                'nombre': u[1],
                'rol': u[2],
                'activo': bool(u[3])
            }
            for u in usuarios
        ]

        return api_success(usuarios_list, 'Usuarios obtenidos')
    except Exception as e:
        current_app.logger.error(f"Error en GET /api/usuarios: {str(e)}")
        return api_error('Error al obtener usuarios', 500)


@csrf.exempt
@csrf.exempt
@bp.route('/usuarios', methods=['POST'])
@login_required
@limiter.limit("5 per minute")
@require_edit_permission
def crear_usuario_api():
    """Crear nuevo usuario"""
    try:
        data = request.get_json()

        if not data or not data.get('username') or not data.get('nombre') or not data.get('password'):
            return api_error('username, nombre y password son requeridos', 400)

        repo = Repo()
        username = repo.crear_usuario_app(data, current_user.username)

        return api_success({'username': username}, 'Usuario creado exitosamente', 201)

    except ValueError as e:
        return api_error(str(e), 400)
    except Exception as e:
        current_app.logger.error(f"Error en POST /api/usuarios: {str(e)}")
        return api_error('Error al crear usuario', 500)


@bp.route('/usuarios/<username>', methods=['GET'])
@login_required
def get_usuario(username):
    """Obtener detalles de un usuario"""
    try:
        repo = Repo()
        usuario = repo.obtener_usuario_app(username)

        if not usuario:
            return api_error('Usuario no encontrado', 404)

        return api_success({
            'username': usuario.username,
            'nombre': usuario.nombre,
            'rol': usuario.rol,
            'activo': bool(usuario.activo)
        })
    except Exception as e:
        current_app.logger.error(f"Error en GET /api/usuarios/{username}: {str(e)}")
        return api_error('Error al obtener usuario', 500)


@bp.route('/usuarios/<username>', methods=['PUT', 'PATCH'])
@login_required
@limiter.limit("5 per minute")
@require_edit_permission
def actualizar_usuario_api(username):
    """Actualizar un usuario"""
    try:
        repo = Repo()
        data = request.get_json()

        repo.actualizar_usuario_app(username, data, current_user.username)
        return api_success(None, 'Usuario actualizado exitosamente')

    except ValueError as e:
        return api_error(str(e), 400)
    except Exception as e:
        current_app.logger.error(f"Error en PUT /api/usuarios/{username}: {str(e)}")
        return api_error('Error al actualizar usuario', 500)


@bp.route('/usuarios/<username>', methods=['DELETE'])
@csrf.exempt
@login_required
@limiter.limit("5 per minute")
@require_edit_permission
def eliminar_usuario_api(username):
    """Eliminar un usuario"""
    try:
        repo = Repo()
        repo.eliminar_usuario_app(username, current_user.username)
        return api_success(None, 'Usuario eliminado exitosamente')

    except ValueError as e:
        return api_error(str(e), 400)
    except Exception as e:
        current_app.logger.error(f"Error en DELETE /api/usuarios/{username}: {str(e)}")
        return api_error('Error al eliminar usuario', 500)


@csrf.exempt
@csrf.exempt
@bp.route('/usuarios/<username>/reset-password', methods=['POST'])
@login_required
@limiter.limit("5 per minute")
@require_edit_permission
def resetear_password_usuario_api(username):
    """Resetear password de un usuario"""
    try:
        repo = Repo()
        password_temporal = repo.resetear_password_usuario(username, current_user.username)

        return api_success(
            {'password_temporal': password_temporal},
            'Password reseteado exitosamente'
        )

    except ValueError as e:
        return api_error(str(e), 400)
    except Exception as e:
        current_app.logger.error(f"Error en POST /api/usuarios/{username}/reset-password: {str(e)}")
        return api_error('Error al resetear password', 500)


# ==================== SINCRONIZACION ====================
@csrf.exempt
@csrf.exempt
@bp.route('/admin/sync-excel', methods=['POST'])
@login_required
def sync_excel_data():
    """Sincronizar datos del Excel a la BD (solo admin)"""

    # Verificar que sea admin
    if not hasattr(current_user, 'rol') or current_user.rol != 'admin':
        return api_error('Solo administradores pueden ejecutar sincronización', 403)

    try:
        # Por ahora, solo retornar un mensaje de éxito
        # La sincronización real se hace en local o via script
        return api_success(
            {
                'nuevos': 0,
                'actualizados': 0,
                'errores': 0,
                'total': 0,
                'mensaje': 'La sincronización se ejecuta vía scripts locales. Usa sync_excel_to_db.py para SQLite o sincronizar_cloud.py para Cloud SQL'
            },
            'Endpoint de sincronización disponible pero no implementado en Cloud Run (usar scripts locales)'
        )

    except Exception as e:
        current_app.logger.error(f"Error en sincronización: {str(e)}")
        return api_error(f'Error en sincronización: {str(e)}', 500)


# ==================== SINCRONIZACIÓN CLOUD SQL ====================
@csrf.exempt
@csrf.exempt
@bp.route('/admin/sync-cloud-sql', methods=['POST'])
@login_required
def sync_cloud_sql():
    """Sincronizar datos a Cloud SQL desde Cloud Run

    Endpoint protegido - solo ejecutable por administradores
    Ejecuta la sincronización del archivo sync_to_cloud.sql en la BD PostgreSQL
    """
    try:
        # Solo admin puede ejecutar esto
        if not hasattr(current_user, 'is_admin') or not current_user.is_admin:
            return api_error('Solo administradores pueden sincronizar', 403)

        current_app.logger.info(f"Iniciando sincronización a Cloud SQL por {current_user.username}")

        from pathlib import Path

        # Leer archivo SQL
        sql_file = Path(current_app.root_path).parent / 'sync_to_cloud.sql'

        if not sql_file.exists():
            return api_error(f'Archivo de sincronización no encontrado: {sql_file}', 404)

        with open(sql_file, 'r', encoding='utf-8') as f:
            sql_content = f.read()

        # Dividir en sentencias y ejecutar
        statements = [s.strip() for s in sql_content.split(';') if s.strip()]

        success_count = 0
        error_count = 0
        errors = []

        for i, stmt in enumerate(statements, 1):
            try:
                db.session.execute(db.text(stmt))
                success_count += 1

                if i % 100 == 0:
                    db.session.commit()  # Commit parcial cada 100 statements

            except Exception as e:
                error_msg = str(e).lower()
                # Ignorar conflictos (registros duplicados)
                if 'conflict' in error_msg or 'duplicate' in error_msg:
                    success_count += 1
                else:
                    error_count += 1
                    errors.append(f"Statement {i}: {str(e)[:80]}")

        # Commit final
        db.session.commit()

        # Obtener estadísticas finales
        from app.models_sqlalchemy import Bien
        total_bienes = db.session.query(Bien).count()
        con_cal_2025 = db.session.query(Bien).filter(Bien.cal_2025 != None).count()

        resultado = {
            'total_statements': len(statements),
            'exitosos': success_count,
            'errores': error_count,
            'total_bienes': total_bienes,
            'bienes_cal_2025': con_cal_2025,
            'porcentaje_actualizado': round((con_cal_2025 / total_bienes * 100) if total_bienes > 0 else 0, 2)
        }

        log_action('SYNC_CLOUD_SQL', f'Sincronización a Cloud SQL completada: {success_count} statements exitosos')

        return api_success(resultado, 'Sincronización a Cloud SQL completada', 200)

    except Exception as e:
        current_app.logger.error(f"Error en sincronización a Cloud SQL: {str(e)}", exc_info=True)
        return api_error(f'Error en sincronización: {str(e)}', 500)


# ==================== MIGRACIONES ====================
@csrf.exempt
@csrf.exempt
@bp.route('/admin/run-migrations', methods=['POST'])
@login_required
def run_migrations():
    """Ejecutar migraciones de Alembic en Cloud SQL

    Endpoint protegido - solo ejecutable por administradores
    Aplica todas las migraciones pendientes en la BD PostgreSQL
    """
    try:
        # Solo admin puede ejecutar esto
        if not hasattr(current_user, 'is_admin') or not current_user.is_admin:
            current_app.logger.warning(f"Acceso denegado a migraciones para {current_user.username if current_user.is_authenticated else 'anonimo'}")
            return api_error('Solo administradores pueden ejecutar migraciones', 403)

        current_app.logger.info(f"Iniciando migraciones por {current_user.username}")

        from flask_migrate import upgrade

        # Ejecutar migraciones usando Flask-Migrate
        upgrade(directory='migrations')

        log_action('RUN_MIGRATIONS', f'Migraciones ejecutadas por {current_user.username}')
        current_app.logger.info(f"Migraciones completadas exitosamente")

        return api_success({
            'status': 'completado',
            'mensaje': 'Migraciones aplicadas exitosamente'
        }, 'Migraciones ejecutadas', 200)

    except Exception as e:
        current_app.logger.error(f"Error en migraciones: {str(e)}", exc_info=True)
        log_security_event(
            'MIGRATION_ERROR',
            f'Error al ejecutar migraciones: {str(e)}',
            severity='ERROR'
        )
        return api_error(f'Error en migraciones: {str(e)}', 500)


# ==================== DUPLICADOS ====================
@bp.route('/bien/codigo-barras/<codigo_barras>', methods=['GET'])
@login_required
def buscar_bien_por_codigo_barras(codigo_barras):
    """Buscar un bien por código de barras"""
    try:
        bien = Bien.query.filter_by(cod_barras=codigo_barras).first()

        if not bien:
            return api_error(f'No se encontró bien con código de barras {codigo_barras}', 404)

        return api_success({
            'id': bien.id,
            'codigo_patrimonial': bien.codigo_patrimonial,
            'cod_barras': bien.cod_barras,
            'denominacion': bien.denominacion,
            'marca': bien.marca,
            'modelo': bien.modelo,
            'serie': bien.serie,
            'responsable': bien.responsable,
            'estado': bien.estado
        }, f'Bien encontrado: {bien.denominacion}', 200)

    except Exception as e:
        current_app.logger.error(f"Error buscando bien: {str(e)}", exc_info=True)
        return api_error(f'Error: {str(e)}', 500)


@bp.route('/bien/codigo-patrimonial/<codigo_patrimonial>', methods=['GET'])
@login_required
def buscar_bien_por_codigo_patrimonial(codigo_patrimonial):
    """Buscar un bien por código patrimonial"""
    try:
        bien = Bien.query.filter_by(codigo_patrimonial=codigo_patrimonial).first()

        if not bien:
            return api_error(f'No se encontró bien con código patrimonial {codigo_patrimonial}', 404)

        return api_success({
            'id': bien.id,
            'codigo_patrimonial': bien.codigo_patrimonial,
            'cod_barras': bien.cod_barras,
            'denominacion': bien.denominacion,
            'marca': bien.marca,
            'modelo': bien.modelo,
            'serie': bien.serie,
            'responsable': bien.responsable,
            'estado': bien.estado
        }, f'Bien encontrado: {bien.denominacion}', 200)

    except Exception as e:
        current_app.logger.error(f"Error buscando bien: {str(e)}", exc_info=True)
        return api_error(f'Error: {str(e)}', 500)


@bp.route('/bien/codigo-patrimonial/<codigo_patrimonial>', methods=['DELETE'])
@csrf.exempt
@login_required
@require_edit_permission
def eliminar_bien_por_codigo_patrimonial(codigo_patrimonial):
    """Eliminar un bien por código patrimonial"""
    try:
        current_app.logger.info(f"DELETE request recibido para código patrimonial: {codigo_patrimonial}")
        current_app.logger.info(f"Usuario actual: {current_user}")
        bien = Bien.query.filter_by(codigo_patrimonial=codigo_patrimonial).first()

        if not bien:
            return api_error(f'No se encontró bien con código patrimonial {codigo_patrimonial}', 404)

        # Guardar información para el log
        bien_info = {
            'id': bien.id,
            'codigo_patrimonial': bien.codigo_patrimonial,
            'cod_barras': bien.cod_barras,
            'denominacion': bien.denominacion
        }

        # Eliminar el bien
        db.session.delete(bien)
        db.session.commit()

        # Registrar la acción
        log_action('DELETE_BIEN', f'Bien eliminado por código patrimonial: {bien_info}')

        return api_success({
            'bien_eliminado': bien_info,
            'mensaje': f'Bien "{bien.denominacion}" (código patrimonial: {codigo_patrimonial}) eliminado correctamente'
        }, 'Bien eliminado exitosamente', 200)

    except Exception as e:
        db.session.rollback()
        current_app.logger.error(f"Error eliminando bien: {str(e)}", exc_info=True)
        return api_error(f'Error eliminando bien: {str(e)}', 500)


@bp.route('/bien/codigo-barras/<codigo_barras>', methods=['DELETE'])
@csrf.exempt
@login_required
@require_edit_permission
def eliminar_bien_por_codigo_barras(codigo_barras):
    """Eliminar un bien por código de barras"""
    try:
        bien = Bien.query.filter_by(cod_barras=codigo_barras).first()

        if not bien:
            return api_error(f'No se encontró bien con código de barras {codigo_barras}', 404)

        # Guardar información para el log
        bien_info = {
            'id': bien.id,
            'codigo_patrimonial': bien.codigo_patrimonial,
            'cod_barras': bien.cod_barras,
            'denominacion': bien.denominacion
        }

        # Eliminar el bien
        db.session.delete(bien)
        db.session.commit()

        # Registrar la acción
        log_action('DELETE_BIEN', f'Bien eliminado por código de barras: {bien_info}')

        return api_success({
            'bien_eliminado': bien_info,
            'mensaje': f'Bien "{bien.denominacion}" (código de barras: {codigo_barras}) eliminado correctamente'
        }, 'Bien eliminado exitosamente', 200)

    except Exception as e:
        db.session.rollback()
        current_app.logger.error(f"Error eliminando bien: {str(e)}", exc_info=True)
        return api_error(f'Error eliminando bien: {str(e)}', 500)


@bp.route('/bien/<int:bien_id>', methods=['DELETE'])
@csrf.exempt
@login_required
@require_edit_permission
def eliminar_bien(bien_id):
    """Eliminar un bien de la base de datos"""
    try:
        bien = Bien.query.get(bien_id)

        if not bien:
            return api_error(f'No se encontró el bien con ID {bien_id}', 404)

        # Guardar información para el log
        bien_info = {
            'id': bien.id,
            'codigo_patrimonial': bien.codigo_patrimonial,
            'cod_barras': bien.cod_barras,
            'denominacion': bien.denominacion
        }

        # Eliminar el bien
        db.session.delete(bien)
        db.session.commit()

        # Registrar la acción
        log_action('DELETE_BIEN', f'Bien eliminado: {bien_info}')

        return api_success({
            'bien_eliminado': bien_info,
            'mensaje': f'Bien con ID {bien_id} eliminado correctamente'
        }, 'Bien eliminado exitosamente', 200)

    except Exception as e:
        db.session.rollback()
        current_app.logger.error(f"Error eliminando bien: {str(e)}", exc_info=True)
        return api_error(f'Error eliminando bien: {str(e)}', 500)


@bp.route('/duplicados/codigo/<codigo>', methods=['GET'])
@login_required
def ver_duplicados_codigo(codigo):
    """Ver detalles de un código duplicado específico"""
    try:
        bienes = Bien.query.filter_by(codigo_patrimonial=codigo).all()

        if not bienes:
            return api_error(f'No se encontraron bienes con código {codigo}', 404)

        detalles = {
            'codigo': codigo,
            'cantidad': len(bienes),
            'bienes': [
                {
                    'id': bien.id,
                    'codigo_patrimonial': bien.codigo_patrimonial,
                    'cod_barras': bien.cod_barras,
                    'denominacion': bien.denominacion,
                    'marca': bien.marca,
                    'modelo': bien.modelo,
                    'serie': bien.serie,
                    'estado': bien.estado,
                    'responsable': bien.responsable,
                    'sede_id': bien.sede_id,
                    'unidad_id': bien.unidad_id,
                    'cal_2025': bien.cal_2025,
                    'cal_2024': bien.cal_2024,
                    'cal_2023': bien.cal_2023,
                    'descripcion': bien.descripcion,
                    'observaciones': bien.observaciones,
                    'fecha_registro': bien.fecha_registro.isoformat() if bien.fecha_registro else None
                }
                for bien in bienes
            ]
        }

        return api_success(detalles, f'Detalles del código {codigo}', 200)

    except Exception as e:
        current_app.logger.error(f"Error obteniendo duplicados: {str(e)}", exc_info=True)
        return api_error(f'Error: {str(e)}', 500)


@bp.route('/duplicados', methods=['GET'])
@login_required
def buscar_duplicados():
    """Buscar códigos, códigos de barras y series duplicadas en la BD"""
    try:
        from sqlalchemy import func

        duplicados = {
            'codigos_patrimoniales': [],
            'codigos_barras': [],
            'series': []
        }

        # 1. Códigos patrimoniales duplicados
        codigo_dupes = db.session.query(
            Bien.codigo_patrimonial,
            func.count(Bien.id).label('cantidad')
        ).filter(
            Bien.codigo_patrimonial.isnot(None)
        ).group_by(
            Bien.codigo_patrimonial
        ).having(
            func.count(Bien.id) > 1
        ).all()

        for codigo, cantidad in codigo_dupes:
            bienes = Bien.query.filter_by(codigo_patrimonial=codigo).all()
            duplicados['codigos_patrimoniales'].append({
                'codigo': codigo,
                'cantidad': cantidad,
                'bienes': [
                    {
                        'id': bien.id,
                        'denominacion': bien.denominacion,
                        'cal_2025': bien.cal_2025,
                        'responsable': bien.responsable
                    }
                    for bien in bienes
                ]
            })

        # 2. Códigos de barras duplicados
        barras_dupes = db.session.query(
            Bien.cod_barras,
            func.count(Bien.id).label('cantidad')
        ).filter(
            Bien.cod_barras.isnot(None),
            Bien.cod_barras != ''
        ).group_by(
            Bien.cod_barras
        ).having(
            func.count(Bien.id) > 1
        ).all()

        for barras, cantidad in barras_dupes:
            bienes = Bien.query.filter_by(cod_barras=barras).all()
            duplicados['codigos_barras'].append({
                'codigo_barras': barras,
                'cantidad': cantidad,
                'bienes': [
                    {
                        'id': bien.id,
                        'denominacion': bien.denominacion,
                        'cal_2025': bien.cal_2025,
                        'responsable': bien.responsable
                    }
                    for bien in bienes
                ]
            })

        # 3. Series duplicadas
        serie_dupes = db.session.query(
            Bien.serie,
            func.count(Bien.id).label('cantidad')
        ).filter(
            Bien.serie.isnot(None),
            Bien.serie != ''
        ).group_by(
            Bien.serie
        ).having(
            func.count(Bien.id) > 1
        ).all()

        for serie, cantidad in serie_dupes:
            bienes = Bien.query.filter_by(serie=serie).all()
            duplicados['series'].append({
                'serie': serie,
                'cantidad': cantidad,
                'bienes': [
                    {
                        'id': bien.id,
                        'denominacion': bien.denominacion,
                        'cal_2025': bien.cal_2025,
                        'responsable': bien.responsable
                    }
                    for bien in bienes
                ]
            })

        # Resumen total
        total_dupes = len(duplicados['codigos_patrimoniales']) + len(duplicados['codigos_barras']) + len(duplicados['series'])

        return api_success({
            'duplicados': duplicados,
            'resumen': {
                'codigos_patrimoniales_duplicados': len(duplicados['codigos_patrimoniales']),
                'codigos_barras_duplicados': len(duplicados['codigos_barras']),
                'series_duplicadas': len(duplicados['series']),
                'total_duplicados': total_dupes
            }
        }, 'Duplicados encontrados', 200)

    except Exception as e:
        current_app.logger.error(f"Error buscando duplicados: {str(e)}", exc_info=True)
        return api_error(f'Error buscando duplicados: {str(e)}', 500)


# ==================== ACTUALIZACIÓN MASIVA ====================
@bp.route('/bienes/actualizar-estado-cal-2025', methods=['POST'])
@login_required
@require_edit_permission
def actualizar_estado_cal_2025():
    """
    Endpoint para actualizar masivamente el estado de bienes con CAL 2025
    de "Malo" → "Regular"

    Requiere:
    - Login
    - Permiso de edición

    Body (JSON):
    {
        "confirm": true  // Requerido para ejecutar
    }

    Retorna:
    {
        "success": true,
        "message": "...",
        "data": {
            "bienes_antes_verificacion": int,
            "bienes_actualizados": int,
            "bienes_en_regular_ahora": int,
            "detalles": [...]
        }
    }
    """
    try:
        from sqlalchemy import and_, text
        import json

        data = request.get_json() or {}
        confirm = data.get('confirm', False)

        # Validar confirmación
        if not confirm:
            return api_error(
                'Debes enviar {"confirm": true} en el body para ejecutar la actualización',
                400
            )

        # PASO 1: Contar bienes ANTES de actualizar
        bienes_antes = db.session.query(Bien).filter(
            and_(
                Bien.estado == 'm',
                Bien.cal_2025.isnot(None),
                Bien.cal_2025 != '',
                Bien.cal_2025 != ' ',
                Bien.cal_2025 != '0'
            )
        ).all()

        count_antes = len(bienes_antes)

        if count_antes == 0:
            return api_success(
                {
                    'bienes_actualizados': 0,
                    'mensaje': 'No hay bienes en estado MALO con CAL 2025 para actualizar'
                },
                'No hay cambios que hacer',
                200
            )

        # PASO 2: Recopilar información de bienes para auditoría
        bienes_detalles = []
        for bien in bienes_antes:
            bienes_detalles.append({
                'id': bien.id,
                'codigo_patrimonial': bien.codigo_patrimonial,
                'denominacion': bien.denominacion,
                'estado_anterior': bien.estado,
                'cal_2025': bien.cal_2025
            })

        # PASO 3: Registrar cambios en historial ANTES de actualizar
        from datetime import datetime
        from app.models_sqlalchemy import Historial

        for bien in bienes_antes:
            historial = Historial(
                bien_id=bien.id,
                usuario=f'admin_{current_user.username}',  # Identificar quién hizo el cambio
                accion='EDITAR',
                detalle_json=json.dumps({
                    'campo': 'estado',
                    'valor_antes': 'm',
                    'valor_despues': 'r',
                    'motivo': 'Cambio masivo: Estado Malo → Regular para bienes CON CAL 2025',
                    'fecha_cambio': datetime.now().isoformat(),
                    'solicitado_por': current_user.username
                }),
                fecha=datetime.now()
            )
            db.session.add(historial)

        # PASO 4: Actualizar estado en bienes
        db.session.query(Bien).filter(
            and_(
                Bien.estado == 'm',
                Bien.cal_2025.isnot(None),
                Bien.cal_2025 != '',
                Bien.cal_2025 != ' ',
                Bien.cal_2025 != '0'
            )
        ).update({Bien.estado: 'r'})

        # PASO 5: Confirmar cambios en BD
        db.session.commit()

        # PASO 6: Verificar que los cambios se realizaron
        bienes_nuevos_estado = db.session.query(Bien).filter(
            and_(
                Bien.estado == 'r',
                Bien.cal_2025.isnot(None),
                Bien.cal_2025 != '',
                Bien.cal_2025 != ' ',
                Bien.cal_2025 != '0'
            )
        ).count()

        # Registrar en logs
        log_action(
            current_user.username,
            'ACTUALIZAR_MASIVO_ESTADO',
            f'Se actualizaron {count_antes} bienes de MALO → REGULAR (CAL 2025)'
        )

        return api_success(
            {
                'bienes_antes_verificacion': count_antes,
                'bienes_actualizados': count_antes,
                'bienes_en_regular_ahora': bienes_nuevos_estado,
                'detalles': bienes_detalles[:10]  # Mostrar primeros 10 como muestra
            },
            f'✅ Se actualizaron exitosamente {count_antes} bienes de MALO → REGULAR',
            200
        )

    except Exception as e:
        db.session.rollback()
        current_app.logger.error(f"Error actualizando estado masivo: {str(e)}", exc_info=True)
        return api_error(f'Error en la actualización: {str(e)}', 500)


# ==================== ENDPOINT TEMPORAL PARA ACTUALIZACIÓN URGENTE ====================
@bp.route('/bienes/actualizar-cal-2025-temp', methods=['POST'])
def actualizar_cal_2025_temp():
    """
    ENDPOINT TEMPORAL - Sin autenticación para emergencias
    Actualiza masivamente bienes con CAL 2025 de MALO → REGULAR

    IMPORTANTE: Este endpoint debe ser ELIMINADO después de usarse una sola vez

    Body (JSON):
    {
        "token": "temporal_2025_cal"
    }
    """
    try:
        from sqlalchemy import and_
        import json

        data = request.get_json() or {}
        token = data.get('token', '')

        # Validación de token simple (temporal)
        if token != 'temporal_2025_cal':
            return api_error('Token inválido', 401)

        # ACTUALIZACIÓN
        count = db.session.query(Bien).filter(
            and_(
                Bien.estado == 'm',
                Bien.cal_2025.isnot(None),
                Bien.cal_2025 != '',
                Bien.cal_2025 != ' ',
                Bien.cal_2025 != '0'
            )
        ).update({'estado': 'r'}, synchronize_session=False)

        db.session.commit()

        return api_success(
            {'bienes_actualizados': count},
            f'Actualizacion exitosa: {count} bienes',
            200
        )

    except Exception as e:
        db.session.rollback()
        return api_error(f'Error: {str(e)}', 500)


# ==================== SALUD DEL API ====================
@bp.route('/health', methods=['GET'])
def health():
    """Verificar estado del API"""
    return api_success({'status': 'ok'}, 'API funcionando correctamente')
