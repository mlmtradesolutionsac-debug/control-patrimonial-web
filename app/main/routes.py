from flask import render_template, request, redirect, url_for, flash, current_app, abort, make_response, jsonify
from flask_login import login_required, current_user
from app.main import bp
from app import db
from app.repository import RepoSQLAlchemy as Repo  # Usar ORM en lugar de SQL raw
from app.utils import validate_bien_data, log_action, get_bien_display_data
from app.decorators import require_edit_permission

@bp.route('/')
@login_required
def dashboard():
    repo = Repo()
    page = request.args.get('page', 1, type=int)

    # Filtros
    filtros = {
        'q': request.args.get('q', ''),
        'sede': request.args.get('sede', ''),
        'dependencia': request.args.get('dependencia', ''),
        'estado': request.args.get('estado', ''),
        'verificacion': request.args.get('verificacion', ''),
        'inventariador': request.args.get('inventariador', '')
    }

    # Paginación
    limit = 15
    offset = (page - 1) * limit

    try:
        try:
            bienes = repo.listar_bienes(filtros, limit, offset)
            total_bienes = repo.contar_bienes(filtros)
            bienes_con_cal_2025 = repo.contar_bienes_con_cal_2025(filtros)
            bienes_sin_cal_2025 = total_bienes - bienes_con_cal_2025
            total_pages = (total_bienes + limit - 1) // limit
        except Exception as e:
            current_app.logger.error(f"Error al listar bienes con filtros {filtros}: {str(e)}")
            # Si hay error, mostrar sin filtro verificación
            filtros['verificacion'] = ''
            bienes = repo.listar_bienes(filtros, limit, offset)
            total_bienes = repo.contar_bienes(filtros)
            bienes_con_cal_2025 = repo.contar_bienes_con_cal_2025(filtros)
            bienes_sin_cal_2025 = total_bienes - bienes_con_cal_2025
            total_pages = (total_bienes + limit - 1) // limit
            flash('Hubo un error con el filtro de verificación. Mostrando todos los bienes.', 'warning')

        sedes = repo.obtener_sedes()
        dependencias = repo.obtener_unidades()
        inventariadores = repo.obtener_inventariadores_activos()

        response = make_response(render_template('main/dashboard.html',
                             bienes=bienes,
                             filtros=filtros,
                             page=page,
                             total_pages=total_pages,
                             sedes=sedes,
                             dependencias=dependencias,
                             inventariadores=inventariadores,
                             total_bienes=total_bienes if total_bienes else 0,
                             bienes_con_cal_2025=bienes_con_cal_2025 if bienes_con_cal_2025 else 0,
                             bienes_sin_cal_2025=bienes_sin_cal_2025 if bienes_sin_cal_2025 else 0))
        response.headers['Cache-Control'] = 'no-cache, no-store, must-revalidate'
        response.headers['Pragma'] = 'no-cache'
        response.headers['Expires'] = '0'
        return response
    except Exception as e:
        current_app.logger.error(f"Error crítico en dashboard: {str(e)}", exc_info=True)
        flash('Error en la base de datos. Por favor, intenta más tarde.', 'danger')
        return redirect(url_for('main.estadisticas'))

@bp.route('/estadisticas')
@login_required
def estadisticas():
    repo = Repo()
    stats = repo.obtener_resumen_completo()
    return render_template('main/estadisticas.html', stats=stats)

@bp.route('/bien/nuevo', methods=['GET', 'POST'])
@login_required
@require_edit_permission
def nuevo_bien():
    try:
        repo = Repo()
        if request.method == 'POST':
            # PASO 1: Validar datos antes de guardar
            errors = validate_bien_data(request.form.to_dict())
            if errors:
                flash(f'Errores en el formulario: {"; ".join(errors)}', 'danger')
                try:
                    sedes = repo.obtener_sedes()
                    dependencias = repo.obtener_unidades()
                except Exception as e:
                    current_app.logger.error(f"Error al obtener sedes/dependencias: {str(e)}")
                    sedes = []
                    dependencias = []
                return render_template('main/form_bien.html',
                                     title="Creación de Usuario",
                                     sedes=sedes,
                                     dependencias=dependencias,
                                     errors=errors,
                                     form_data=request.form.to_dict(),
                                     is_admin=current_user.is_admin)

            # PASO 2: Solo si válido, guardar
            try:
                bien_id = repo.crear_bien(request.form.to_dict(), current_user.username)
                log_action('CREAR_BIEN', f'Bien {bien_id} creado por {current_user.username}')
                flash('Bien creado exitosamente', 'success')
                return redirect(url_for('main.dashboard'))
            except ValueError as e:
                # Error de validación (ej: código duplicado)
                current_app.logger.warning(f"Error de validación al crear bien: {str(e)}")
                flash(f'Error: {str(e)}', 'danger')
                db.session.rollback()  # Limpiar sesión después del error
            except Exception as e:
                current_app.logger.error(f"Error al crear bien: {str(e)}")
                flash('Error al crear bien. Contacta al administrador', 'danger')
                db.session.rollback()  # Limpiar sesión después del error

        try:
            sedes = repo.obtener_sedes()
            dependencias = repo.obtener_unidades()
            responsables = repo.obtener_responsables()
        except Exception as e:
            current_app.logger.error(f"Error al cargar datos para nuevo bien: {str(e)}", exc_info=True)
            sedes = []
            dependencias = []
            responsables = []
            flash('Error al cargar los datos del formulario. Por favor, intenta más tarde.', 'warning')

        return render_template('main/form_bien.html', title="Creación de Usuario", sedes=sedes, dependencias=dependencias, responsables=responsables, errors=[], is_admin=current_user.is_admin)
    except Exception as e:
        current_app.logger.error(f"Error crítico en nuevo_bien: {str(e)}", exc_info=True)
        flash('Error al acceder al formulario. Por favor, intenta más tarde.', 'danger')
        return redirect(url_for('main.dashboard'))

@bp.route('/bien/editar/<int:id>', methods=['GET', 'POST'])
@login_required
@require_edit_permission
def editar_bien(id):
    try:
        repo = Repo()
        bien = repo.obtener_bien(id)

        if not bien:
            flash('Bien no encontrado', 'danger')
            return redirect(url_for('main.dashboard'))

        if request.method == 'POST':
            # PASO 1: Validar datos antes de guardar
            try:
                errors = validate_bien_data(request.form.to_dict(), bien_id=id)
            except Exception as e:
                current_app.logger.error(f"Error en validación: {str(e)}")
                flash(f'Error interno al validar: {str(e)}', 'danger')
                # Recargar formulario con datos actuales para no perder cambios
                try:
                    sedes = repo.obtener_sedes()
                    dependencias = repo.obtener_unidades()
                    responsables = repo.obtener_responsables()
                except Exception as e:
                    current_app.logger.error(f"Error al cargar datos: {str(e)}")
                    sedes = []
                    dependencias = []
                    responsables = []
                return render_template('main/form_bien.html',
                                     title="Editar Bien",
                                     bien=bien,
                                     sedes=sedes,
                                     dependencias=dependencias,
                                     responsables=responsables,
                                     errors=[f"Error crítico: {str(e)}"],
                                     form_data=request.form.to_dict(),
                                     is_admin=current_user.is_admin)

            if errors:
                flash(f'Errores en el formulario: {"; ".join(errors)}', 'danger')
                try:
                    sedes = repo.obtener_sedes()
                    dependencias = repo.obtener_unidades()
                    responsables = repo.obtener_responsables()
                except Exception as e:
                    current_app.logger.error(f"Error al cargar datos: {str(e)}")
                    sedes = []
                    dependencias = []
                    responsables = []
                return render_template('main/form_bien.html',
                                     title="Editar Bien",
                                     bien=bien,
                                     sedes=sedes,
                                     dependencias=dependencias,
                                     responsables=responsables,
                                     errors=errors,
                                     form_data=request.form.to_dict(),
                                     is_admin=current_user.is_admin)

            # PASO 2: Solo si válido, guardar
            try:
                repo.actualizar_bien(id, request.form.to_dict(), current_user.username)
                log_action('EDITAR_BIEN', f'Bien {id} actualizado por {current_user.username}')
                flash('Bien actualizado exitosamente', 'success')
                return redirect(url_for('main.dashboard'))
            except Exception as e:
                current_app.logger.error(f"Error al actualizar bien: {str(e)}")
                flash('Error al actualizar bien. Contacta al administrador', 'danger')

        try:
            sedes = repo.obtener_sedes()
            dependencias = repo.obtener_unidades()
            responsables = repo.obtener_responsables()
        except Exception as e:
            current_app.logger.error(f"Error al cargar datos para editar bien: {str(e)}", exc_info=True)
            sedes = []
            dependencias = []
            responsables = []
            flash('Error al cargar los datos del formulario. Por favor, intenta más tarde.', 'warning')

        return render_template('main/form_bien.html', title="Editar Bien", bien=bien, sedes=sedes, dependencias=dependencias, responsables=responsables, errors=[], is_admin=current_user.is_admin)
    except Exception as e:
        current_app.logger.error(f"Error crítico en editar_bien: {str(e)}", exc_info=True)
        flash('Error al acceder al formulario. Por favor, intenta más tarde.', 'danger')
        return redirect(url_for('main.dashboard'))

@bp.route('/bien/<int:id>/eliminar', methods=['POST'])
@login_required
def eliminar_bien(id):
    try:
        from app.models_sqlalchemy import Bien

        # Solo administradores pueden eliminar
        if not current_user.is_admin:
            return jsonify({
                'success': False,
                'error': 'Solo los administradores pueden eliminar bienes'
            }), 403

        # Obtener el objeto Bien directamente de la base de datos
        bien = Bien.query.get(id)

        if not bien:
            return jsonify({'success': False, 'error': 'Bien no encontrado'}), 404

        # Guardar información para el log
        bien_info = {
            'id': bien.id,
            'codigo_patrimonial': bien.codigo_patrimonial,
            'cod_barras': bien.cod_barras,
            'denominacion': bien.denominacion
        }

        denominacion = bien.denominacion

        # Eliminar el bien
        db.session.delete(bien)
        db.session.commit()

        # Registrar la acción
        log_action('DELETE_BIEN', f'Bien eliminado: {bien_info}')

        return jsonify({
            'success': True,
            'message': f'Bien "{denominacion}" eliminado correctamente'
        })

    except Exception as e:
        db.session.rollback()
        current_app.logger.error(f"Error eliminando bien: {str(e)}", exc_info=True)
        return jsonify({
            'success': False,
            'error': f'Error al eliminar: {str(e)}'
        }), 500

@bp.route('/usuarios')
@login_required
def usuarios():
    if not current_user.is_admin:
        abort(403)
    repo = Repo()
    usuarios = repo.obtener_usuarios_app()
    return render_template('main/usuarios.html', usuarios=usuarios)

@bp.route('/mi-cuenta')
@login_required
def mi_cuenta():
    """Mostrar información de la cuenta del usuario actual"""
    return render_template('main/mi_cuenta.html', usuario=current_user)

@bp.route('/chat')
@login_required
def chat():
    return render_template('main/chat.html')

@bp.route('/chat/search', methods=['POST'])
@login_required
def chat_search():
    from flask import jsonify
    data = request.get_json()
    query = data.get('query', '').lower()
    
    repo = Repo()
    
    # Búsqueda inteligente: buscar en múltiples campos
    filtros = {'q': query}
    resultados = repo.listar_bienes(filtros, limit=50, offset=0)
    
    # Convertir resultados a diccionarios
    results_list = []
    for bien in resultados:
        results_list.append({
            'codigo_patrimonial': bien['codigo_patrimonial'],
            'denominacion': bien['denominacion'],
            'marca': bien['marca'],
            'sede': bien['sede'],
            'estado': bien['estado']
        })
    
    # Si no hay resultados, ofrecer estadísticas generales
    stats = None
    if len(results_list) == 0:
        total = repo.contar_bienes({})
        stats = {
            'total': total,
            'message': f'No encontré bienes con "{query}". Hay {total} bienes en total en el sistema.'
        }
    
    return jsonify({
        'results': results_list,
        'stats': stats
    })

@bp.route('/debug-db')
def debug_db():
    from app.models_sqlalchemy import Bien, db
    import os

    try:
        count = Bien.query.count()
        status = "Conectado"
    except Exception as e:
        count = -1
        status = str(e)

    return {
        "URI_CONFIG": current_app.config.get('SQLALCHEMY_DATABASE_URI'),
        "ENV_DATABASE_URL": os.environ.get('DATABASE_URL', 'NO_DEFINIDA'),
        "FLASK_ENV": os.environ.get('FLASK_ENV', 'NO_DEFINIDO'),
        "BIENES_COUNT": count,
        "STATUS": status
    }

@bp.route('/api/bienes/<int:bien_id>')
@login_required
def api_obtener_bien(bien_id):
    """API para obtener detalles de un bien (incluyendo CAL values)"""
    from flask import jsonify
    repo = Repo()
    bien = repo.obtener_bien(bien_id)

    if not bien:
        return jsonify({'success': False, 'error': 'Bien no encontrado'}), 404

    # Usar get_bien_display_data para asegurar que todos los campos CAL estén presentes
    bien_display = get_bien_display_data(bien)
    return jsonify({'success': True, 'message': 'OK', 'data': bien_display})

@bp.route('/reportes/inventario-operadores')
@login_required
def inventario_operadores():
    """Dashboard de monitoreo de progreso de inventariadores - SOLO USUARIOS DEL SISTEMA"""
    from app.models_sqlalchemy import db, UsuarioApp, Bien
    from sqlalchemy import func

    try:
        # Obtener SOLO usuarios activos creados en el sistema
        usuarios = db.session.query(UsuarioApp).filter(
            UsuarioApp.activo == 1,
            UsuarioApp.username.notin_(['admin', 'MIGRACION_SISTEMA'])
        ).order_by(UsuarioApp.nombre).all()

        stats_list = []
        for user in usuarios:
            if user.username in ['admin', 'MIGRACION_SISTEMA', 'Admin']:
                continue
            # Contar bienes registrados por este usuario
            total_registrados = db.session.query(func.count(Bien.id)).filter(
                Bien.usuario_registro == user.username
            ).scalar() or 0

            # Contar bienes inventariados (con cal_2025) por este usuario
            inventariados = db.session.query(func.count(Bien.id)).filter(
                Bien.usuario_registro == user.username,
                Bien.cal_2025.isnot(None)
            ).scalar() or 0

            # Calcular porcentaje de completado
            porcentaje = (inventariados / total_registrados * 100) if total_registrados > 0 else 0

            stats_list.append({
                'usuario_registro': user.username,
                'nombre': user.nombre,
                'rol': user.rol,
                'total_registrados': int(total_registrados),
                'inventariados': int(inventariados),
                'subidos_siga': 0,  # Placeholder - ajustar según lógica SIGA
                'pendientes_siga': int(total_registrados - inventariados),
                'porcentaje_completado': round(porcentaje, 1)
            })

        return render_template('main/inventario_operadores.html', stats=stats_list)
    except Exception as e:
        current_app.logger.error(f"Error en inventario_operadores: {str(e)}")
        flash(f'Error al cargar el reporte: {str(e)}', 'danger')
        return redirect(url_for('main.dashboard'))

@bp.route('/reportes/analisis-productividad')
@login_required
def analisis_productividad():
    """Dashboard de Análisis de Productividad - Top Inventariadores"""
    try:
        from app.repository import RepoSQLAlchemy
        repo = RepoSQLAlchemy()

        analisis = repo.obtener_analisis_productividad_inventariadores()

        return render_template('main/analisis_productividad.html', analisis=analisis)
    except Exception as e:
        current_app.logger.error(f"Error en analisis_productividad: {str(e)}")
        flash(f'Error al cargar análisis de productividad: {str(e)}', 'danger')
        return redirect(url_for('main.dashboard'))

@bp.route('/admin/corregir-cal-2025-ejecutar', methods=['GET'])
@login_required
def corregir_cal_2025_ejecutar():
    """
    Endpoint de ejecución directa (solo para admins)
    GET simple para ejecutar la corrección sin POST/CSRF
    """
    from app.models_sqlalchemy import Bien
    from sqlalchemy import and_

    if not current_user.is_admin:
        abort(403)

    try:
        # Buscar bienes a corregir
        bienes_a_corregir = db.session.query(Bien).filter(
            and_(
                Bien.cal_2025 != None,
                Bien.cal_2025 != '',
                Bien.estado == 'm'
            )
        ).count()

        if bienes_a_corregir == 0:
            flash('No hay bienes que corregir', 'info')
            return redirect(url_for('main.corregir_cal_2025_admin'))

        # UPDATE masivo
        actualizados = db.session.query(Bien).filter(
            and_(
                Bien.cal_2025 != None,
                Bien.cal_2025 != '',
                Bien.estado == 'm'
            )
        ).update({'estado': 'r'}, synchronize_session=False)

        db.session.commit()

        # Registrar en log
        log_action(
            'CORRECCION_MASIVA_CAL_2025',
            f'Corregidos {actualizados} bienes: estado Malo -> Regular (CAL 2025 != NULL)'
        )

        flash(f'EXITO: {actualizados} bienes corregidos de Malo a Regular', 'success')
        current_app.logger.info(f'Correccion CAL 2025: {actualizados} bienes actualizados')

        return redirect(url_for('main.dashboard'))

    except Exception as e:
        db.session.rollback()
        current_app.logger.error(f"Error en corregir_cal_2025_ejecutar: {str(e)}", exc_info=True)
        flash(f'Error: {str(e)}', 'danger')
        return redirect(url_for('main.corregir_cal_2025_admin'))

@bp.route('/admin/corregir-cal-2025', methods=['GET', 'POST'])
@login_required
def corregir_cal_2025_admin():
    """
    Endpoint administrativo para corregir bienes con CAL 2025 en estado Malo -> Regular
    GET: Mostrar página de confirmación
    POST: Ejecutar la corrección
    """
    from app.models_sqlalchemy import Bien
    from sqlalchemy import and_

    if not current_user.is_admin:
        abort(403)

    # Obtener estadísticas
    total_bienes = db.session.query(Bien).count()
    bienes_con_cal = db.session.query(Bien).filter(
        and_(Bien.cal_2025 != None, Bien.cal_2025 != '')
    ).count()
    bienes_bueno = db.session.query(Bien).filter(Bien.estado == 'b').count()
    bienes_regular = db.session.query(Bien).filter(Bien.estado == 'r').count()
    bienes_malo = db.session.query(Bien).filter(Bien.estado == 'm').count()

    # Bienes a corregir
    bienes_a_corregir = db.session.query(Bien).filter(
        and_(
            Bien.cal_2025 != None,
            Bien.cal_2025 != '',
            Bien.estado == 'm'
        )
    ).count()

    # GET: Mostrar página
    if request.method == 'GET':
        return render_template('main/admin_correccion_cal.html',
                             total_bienes=total_bienes,
                             total_bienes_con_cal=bienes_con_cal,
                             total_bueno=bienes_bueno,
                             total_regular=bienes_regular,
                             total_malo=bienes_malo,
                             total_bienes_malo=bienes_a_corregir)

    # POST: Ejecutar corrección
    try:
        if bienes_a_corregir == 0:
            flash('No hay bienes que corregir', 'info')
            return redirect(url_for('main.corregir_cal_2025_admin'))

        # UPDATE masivo
        actualizados = db.session.query(Bien).filter(
            and_(
                Bien.cal_2025 != None,
                Bien.cal_2025 != '',
                Bien.estado == 'm'
            )
        ).update({'estado': 'r'}, synchronize_session=False)

        db.session.commit()

        # Registrar en log
        log_action(
            'CORRECCION_MASIVA_CAL_2025',
            f'Corregidos {actualizados} bienes: estado Malo -> Regular (CAL 2025 != NULL)'
        )

        flash(f'Correccion completada: {actualizados} bienes actualizados de Malo a Regular', 'success')
        current_app.logger.info(f'Correccion CAL 2025: {actualizados} bienes actualizados')

        return redirect(url_for('main.dashboard'))

    except Exception as e:
        db.session.rollback()
        current_app.logger.error(f"Error en corregir_cal_2025_admin: {str(e)}", exc_info=True)
        flash(f'Error al corregir: {str(e)}', 'danger')
        return redirect(url_for('main.corregir_cal_2025_admin'))
