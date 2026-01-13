"""Rutas para gestión de Fichas de Levantamiento"""

from flask import render_template, request, redirect, url_for, flash, current_app, abort, jsonify, send_file
from flask_login import login_required, current_user
from app.fichas import bp
from app.models_sqlalchemy import db, FichaLevantamiento, UsuarioApp
from app.decorators import require_edit_permission
from datetime import datetime
import os
import uuid
from werkzeug.utils import secure_filename
from pytz import timezone

ALLOWED_EXTENSIONS = {'pdf'}

# Determinar carpeta de uploads
# En Cloud Run usa /tmp (efímero), en local usa app/static/uploads/fichas (persistente)
if os.environ.get('FLASK_ENV') == 'production':
    UPLOAD_FOLDER = '/tmp/fichas_uploads'
else:
    UPLOAD_FOLDER = 'app/static/uploads/fichas'

def allowed_file(filename):
    return '.' in filename and filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS


def generar_numero_siga():
    """
    Generar número SIGA único.

    Formato: SIGA-YYYYMMDD-XXXX
    Donde:
    - SIGA: Prefijo identificador
    - YYYYMMDD: Fecha actual
    - XXXX: Secuencial del día (0001, 0002, etc.)
    """
    from datetime import datetime
    hoy = datetime.now().strftime('%Y%m%d')

    # Contar fichas creadas hoy
    fichas_hoy = db.session.query(FichaLevantamiento).filter(
        FichaLevantamiento.fecha_creacion >= datetime.strptime(hoy, '%Y%m%d')
    ).count()

    secuencial = str(fichas_hoy + 1).zfill(4)
    numero_siga = f"SIGA-{hoy}-{secuencial}"

    # Verificar que sea único (aunque muy improbable)
    while db.session.query(FichaLevantamiento).filter_by(numero_siga=numero_siga).first():
        fichas_hoy += 1
        secuencial = str(fichas_hoy).zfill(4)
        numero_siga = f"SIGA-{hoy}-{secuencial}"

    return numero_siga


@bp.route('/')
@login_required
def listar_fichas():
    """Listar fichas de levantamiento"""
    try:
        # Todos ven todas las fichas (admin y operadores)
        fichas = db.session.query(FichaLevantamiento).order_by(
            FichaLevantamiento.fecha_creacion.desc()
        ).all()

        return render_template('fichas/listar.html', fichas=fichas)
    except Exception as e:
        current_app.logger.error(f"Error al listar fichas: {str(e)}")
        flash('Error al cargar fichas', 'danger')
        return redirect(url_for('main.dashboard'))


@bp.route('/subir', methods=['GET', 'POST'])
@login_required
@require_edit_permission
def subir_ficha():
    """Subir nueva ficha de levantamiento"""
    if request.method == 'POST':
        try:
            # Verificar que se adjuntó archivo
            if 'archivo' not in request.files:
                flash('No se seleccionó archivo', 'danger')
                return redirect(request.url)

            archivo = request.files['archivo']

            if archivo.filename == '':
                flash('Archivo vacío', 'danger')
                return redirect(request.url)

            if not allowed_file(archivo.filename):
                flash('Solo se permiten archivos PDF', 'danger')
                return redirect(request.url)

            # Crear carpeta de destino si no existe
            os.makedirs(UPLOAD_FOLDER, exist_ok=True)

            # Generar nombre único para el archivo
            nombre_original = secure_filename(archivo.filename)
            nombre_unico = f"{uuid.uuid4()}_{nombre_original}"
            ruta_destino = os.path.join(UPLOAD_FOLDER, nombre_unico)

            # Guardar archivo
            archivo.save(ruta_destino)

            # Generar número SIGA
            numero_siga = generar_numero_siga()

            # Obtener datos del formulario
            responsable_name = request.form.get('responsable_name', '').strip()
            observaciones = request.form.get('observaciones', '')

            # Validar responsable_name
            if not responsable_name:
                flash('Debe especificar el nombre del responsable', 'danger')
                return redirect(request.url)

            # Crear registro en BD
            ficha = FichaLevantamiento(
                numero_siga=numero_siga,
                usuario_levantamiento=current_user.username,
                responsable_name=responsable_name,
                archivo_pdf=nombre_unico,
                estado='PENDIENTE',
                observaciones=observaciones
            )

            db.session.add(ficha)
            db.session.commit()

            flash(f'Ficha subida exitosamente. SIGA: {numero_siga}', 'success')
            return redirect(url_for('fichas.listar_fichas'))

        except Exception as e:
            db.session.rollback()
            current_app.logger.error(f"Error al subir ficha: {str(e)}")
            flash('Error al subir ficha', 'danger')
            return redirect(request.url)

    return render_template('fichas/subir.html')


@bp.route('/descargar/<int:ficha_id>')
@login_required
def descargar_ficha(ficha_id):
    """Descargar o mostrar PDF de ficha de levantamiento"""
    try:
        ficha = db.session.query(FichaLevantamiento).get(ficha_id)

        if not ficha:
            abort(404)

        # Verificar permisos (admin o propietario)
        if not current_user.is_admin and ficha.usuario_levantamiento != current_user.username:
            abort(403)

        ruta_archivo = os.path.join(UPLOAD_FOLDER, ficha.archivo_pdf)

        if not os.path.exists(ruta_archivo):
            current_app.logger.error(f"Archivo no encontrado: {ruta_archivo}")
            abort(404)

        # Verificar si se solicita descarga (query param) o preview
        descargar = request.args.get('download', False)

        return send_file(
            ruta_archivo,
            mimetype='application/pdf',
            as_attachment=bool(descargar),
            download_name=f"{ficha.numero_siga}.pdf" if descargar else None
        )

    except Exception as e:
        current_app.logger.error(f"Error en descargar_ficha: {str(e)}")
        abort(500)


@bp.route('/<int:ficha_id>/verificar', methods=['POST'])
@login_required
def verificar_ficha(ficha_id):
    """Verificar ficha (solo admin)"""
    try:
        if not current_user.is_admin:
            abort(403)

        ficha = db.session.query(FichaLevantamiento).get(ficha_id)
        if not ficha:
            abort(404)

        # Cambiar estado a verificado
        ficha.estado = 'VERIFICADA'
        ficha.fecha_verificacion = datetime.now()
        ficha.verificado_por = current_user.username

        # Obtener observaciones del formulario si las hay
        observaciones = request.form.get('observaciones', '')
        if observaciones:
            ficha.observaciones = observaciones

        db.session.commit()

        flash(f'Ficha {ficha.numero_siga} verificada', 'success')
        return redirect(url_for('fichas.listar_fichas'))

    except Exception as e:
        db.session.rollback()
        current_app.logger.error(f"Error al verificar ficha: {str(e)}")
        flash('Error al verificar ficha', 'danger')
        return redirect(url_for('fichas.listar_fichas'))


@bp.route('/<int:ficha_id>/detalles')
@login_required
def detalles_ficha(ficha_id):
    """Ver detalles de una ficha"""
    try:
        ficha = db.session.query(FichaLevantamiento).get(ficha_id)

        if not ficha:
            abort(404)

        # Todos (admin y operadores) pueden ver detalles de cualquier ficha

        # Convertir fecha_creacion de UTC a zona horaria local (America/Lima)
        if ficha.fecha_creacion:
            # Si es naive (sin zona horaria), asumir que es UTC
            if ficha.fecha_creacion.tzinfo is None:
                utc = timezone('UTC')
                ficha.fecha_creacion = utc.localize(ficha.fecha_creacion)

            # Convertir a zona horaria local
            lima_tz = timezone('America/Lima')
            ficha.fecha_creacion = ficha.fecha_creacion.astimezone(lima_tz)

        return render_template('fichas/detalles.html', ficha=ficha, now=datetime.now())

    except Exception as e:
        current_app.logger.error(f"Error al obtener detalles: {str(e)}")
        abort(500)


@bp.route('/<int:ficha_id>/reemplazar', methods=['POST'])
@login_required
@require_edit_permission
def reemplazar_pdf(ficha_id):
    """Reemplazar PDF de una ficha sin cambiar el SIGA"""
    try:
        ficha = db.session.query(FichaLevantamiento).get(ficha_id)

        if not ficha:
            abort(404)

        # Verificar permisos (solo admin o propietario)
        if not current_user.is_admin and ficha.usuario_levantamiento != current_user.username:
            abort(403)

        # Verificar que se adjuntó archivo
        if 'archivo' not in request.files:
            flash('No se seleccionó archivo', 'danger')
            return redirect(url_for('fichas.detalles_ficha', ficha_id=ficha_id))

        archivo = request.files['archivo']

        if archivo.filename == '':
            flash('Archivo vacío', 'danger')
            return redirect(url_for('fichas.detalles_ficha', ficha_id=ficha_id))

        if not allowed_file(archivo.filename):
            flash('Solo se permiten archivos PDF', 'danger')
            return redirect(url_for('fichas.detalles_ficha', ficha_id=ficha_id))

        # Crear carpeta si no existe
        os.makedirs(UPLOAD_FOLDER, exist_ok=True)

        # Eliminar archivo anterior si existe
        ruta_anterior = os.path.join(UPLOAD_FOLDER, ficha.archivo_pdf)
        if os.path.exists(ruta_anterior):
            try:
                os.remove(ruta_anterior)
            except:
                pass

        # Guardar nuevo archivo
        nombre_original = secure_filename(archivo.filename)
        nombre_unico = f"{uuid.uuid4()}_{nombre_original}"
        ruta_destino = os.path.join(UPLOAD_FOLDER, nombre_unico)
        archivo.save(ruta_destino)

        # Actualizar ficha con nuevo nombre de archivo
        ficha.archivo_pdf = nombre_unico
        db.session.commit()

        flash(f'PDF reemplazado exitosamente. SIGA: {ficha.numero_siga}', 'success')
        return redirect(url_for('fichas.detalles_ficha', ficha_id=ficha_id))

    except Exception as e:
        db.session.rollback()
        current_app.logger.error(f"Error al reemplazar PDF: {str(e)}")
        flash('Error al reemplazar PDF', 'danger')
        return redirect(url_for('fichas.detalles_ficha', ficha_id=ficha_id))


@bp.route('/<int:ficha_id>/eliminar', methods=['POST'])
@login_required
@require_edit_permission
def eliminar_ficha(ficha_id):
    """Eliminar una ficha completamente"""
    try:
        ficha = db.session.query(FichaLevantamiento).get(ficha_id)

        if not ficha:
            abort(404)

        # Verificar permisos (solo admin o propietario)
        if not current_user.is_admin and ficha.usuario_levantamiento != current_user.username:
            abort(403)

        numero_siga = ficha.numero_siga

        # Eliminar archivo PDF si existe
        ruta_archivo = os.path.join(UPLOAD_FOLDER, ficha.archivo_pdf)
        if os.path.exists(ruta_archivo):
            try:
                os.remove(ruta_archivo)
            except:
                pass

        # Eliminar registro de BD
        db.session.delete(ficha)
        db.session.commit()

        flash(f'Ficha {numero_siga} eliminada exitosamente', 'success')
        return redirect(url_for('fichas.listar_fichas'))

    except Exception as e:
        db.session.rollback()
        current_app.logger.error(f"Error al eliminar ficha: {str(e)}")
        flash('Error al eliminar ficha', 'danger')
        return redirect(url_for('fichas.detalles_ficha', ficha_id=ficha_id))


@bp.route('/filtrar')
@login_required
def filtrar_fichas():
    """Filtrar fichas por nombre de responsable"""
    try:
        responsable_filter = request.args.get('responsable', '').strip()

        if current_user.is_admin:
            # Admins ven todas las fichas
            if responsable_filter:
                fichas = db.session.query(FichaLevantamiento).filter(
                    FichaLevantamiento.responsable_name.ilike(f'%{responsable_filter}%')
                ).order_by(FichaLevantamiento.fecha_creacion.desc()).all()
            else:
                fichas = db.session.query(FichaLevantamiento).order_by(
                    FichaLevantamiento.fecha_creacion.desc()
                ).all()
        else:
            # Operadores ven todas las fichas
            if responsable_filter:
                fichas = db.session.query(FichaLevantamiento).filter(
                    FichaLevantamiento.responsable_name.ilike(f'%{responsable_filter}%')
                ).order_by(FichaLevantamiento.fecha_creacion.desc()).all()
            else:
                fichas = db.session.query(FichaLevantamiento).order_by(
                    FichaLevantamiento.fecha_creacion.desc()).all()

        return render_template('fichas/listar.html', fichas=fichas, responsable_filter=responsable_filter)

    except Exception as e:
        current_app.logger.error(f"Error al filtrar fichas: {str(e)}")
        flash('Error al filtrar fichas', 'danger')
        return redirect(url_for('fichas.listar_fichas'))


@bp.route('/api/bien/<codigo_patrimonial>')
@login_required
def api_fichas_por_bien(codigo_patrimonial):
    """API para obtener fichas verificadas que contienen un bien específico"""
    try:
        from app.repository import RepoSQLAlchemy
        fichas = RepoSQLAlchemy.obtener_fichas_por_bien(codigo_patrimonial)

        fichas_data = []
        for ficha in fichas:
            fichas_data.append({
                'numero_siga': ficha.numero_siga,
                'responsable_name': ficha.responsable_name,
                'fecha_creacion': ficha.fecha_creacion.strftime('%d/%m/%Y') if ficha.fecha_creacion else '',
                'ficha_id': ficha.id
            })

        return jsonify({
            'codigo': codigo_patrimonial,
            'fichas': fichas_data,
            'total': len(fichas_data)
        })

    except Exception as e:
        current_app.logger.error(f"Error en API fichas por bien: {str(e)}")
        return jsonify({'error': 'Error al obtener fichas'}), 500


@bp.route('/api/estadisticas')
@login_required
def api_estadisticas_fichas():
    """API para obtener estadísticas de fichas"""
    try:
        if current_user.is_admin:
            # Estadísticas globales
            total_fichas = db.session.query(FichaLevantamiento).count()
            pendientes = db.session.query(FichaLevantamiento).filter_by(estado='PENDIENTE').count()
            verificadas = db.session.query(FichaLevantamiento).filter_by(estado='VERIFICADA').count()
        else:
            # Estadísticas del usuario actual
            total_fichas = db.session.query(FichaLevantamiento).filter_by(
                usuario_levantamiento=current_user.username
            ).count()
            pendientes = db.session.query(FichaLevantamiento).filter_by(
                usuario_levantamiento=current_user.username,
                estado='PENDIENTE'
            ).count()
            verificadas = db.session.query(FichaLevantamiento).filter_by(
                usuario_levantamiento=current_user.username,
                estado='VERIFICADA'
            ).count()

        return jsonify({
            'total_fichas': total_fichas,
            'pendientes': pendientes,
            'verificadas': verificadas,
            'archivadas': total_fichas - pendientes - verificadas
        })

    except Exception as e:
        current_app.logger.error(f"Error en API estadísticas: {str(e)}")
        return jsonify({'error': 'Error al obtener estadísticas'}), 500


@bp.route('/api/stats/cobertura')
@login_required
def api_stats_cobertura():
    """API para obtener estadísticas de cobertura de fichas"""
    try:
        from app.models_sqlalchemy import Bien
        from sqlalchemy import and_

        # Contar fichas totales subidas
        total_fichas = db.session.query(FichaLevantamiento).count()

        # Obtener todos los bienes con responsable asignado
        bienes_con_responsable = db.session.query(Bien).filter(
            and_(
                Bien.responsable.isnot(None),
                Bien.responsable != ''
            )
        ).all()

        # Contar responsables ÚNICOS
        responsables_unicos = set()
        for bien in bienes_con_responsable:
            if bien.responsable:
                responsables_unicos.add(bien.responsable)

        total_responsables = len(responsables_unicos)

        # Calcular porcentaje: (fichas subidas / responsables con bienes) × 100
        porcentaje = (total_fichas / total_responsables * 100.0) if total_responsables > 0 else 0

        return jsonify({
            'fichas_subidas': total_fichas,
            'responsables_activos': total_responsables,
            'porcentaje': porcentaje
        })

    except Exception as e:
        current_app.logger.error(f"Error en API cobertura: {str(e)}")
        return jsonify({'error': f'Error: {str(e)}'}), 500


@bp.route('/responsables')
@login_required
def listar_responsables():
    """Página principal de responsables con buscador"""
    try:
        # Obtener todos los responsables únicos que tienen fichas (solo verificadas)
        responsables_query = db.session.query(
            FichaLevantamiento.responsable_name
        ).filter(
            FichaLevantamiento.estado == 'VERIFICADA'
        ).distinct().order_by(FichaLevantamiento.responsable_name).all()

        responsables = [r[0] for r in responsables_query if r[0]]

        return render_template('fichas/responsables.html', responsables=responsables)

    except Exception as e:
        current_app.logger.error(f"Error al listar responsables: {str(e)}")
        flash('Error al cargar responsables', 'danger')
        return redirect(url_for('main.dashboard'))


@bp.route('/api/responsables')
@login_required
def api_responsables():
    """API para autocomplete de responsables"""
    try:
        query = request.args.get('q', '').strip().lower()

        # Obtener responsables únicos con fichas verificadas
        responsables_query = db.session.query(
            FichaLevantamiento.responsable_name
        ).filter(
            FichaLevantamiento.estado == 'VERIFICADA'
        ).distinct().all()

        responsables = [r[0] for r in responsables_query if r[0]]

        # Filtrar por query
        if query:
            responsables = [r for r in responsables if query in r.lower()]

        # Limitar a 20 resultados
        responsables = responsables[:20]

        return jsonify(responsables)

    except Exception as e:
        current_app.logger.error(f"Error en API responsables: {str(e)}")
        return jsonify({'error': 'Error al obtener responsables'}), 500


@bp.route('/api/usuarios-fichas')
@login_required
def api_usuarios_fichas():
    """API para obtener todos los usuarios únicos de fichas (sin filtrado por estado)"""
    try:
        # Obtener todos los responsables únicos sin importar el estado
        responsables_query = db.session.query(
            FichaLevantamiento.responsable_name
        ).distinct().all()

        responsables = [r[0] for r in responsables_query if r[0]]
        responsables.sort()  # Ordenar alfabéticamente

        return jsonify(responsables)

    except Exception as e:
        current_app.logger.error(f"Error en API usuarios fichas: {str(e)}")
        return jsonify({'error': 'Error al obtener usuarios'}), 500


@bp.route('/responsable/<nombre>')
@login_required
def ficha_responsable(nombre):
    """Ver todas las fichas de un responsable específico"""
    try:
        nombre_limpio = nombre.strip()

        fichas = db.session.query(FichaLevantamiento).filter(
            FichaLevantamiento.responsable_name.ilike(f'%{nombre_limpio}%'),
            FichaLevantamiento.estado == 'VERIFICADA'
        ).order_by(FichaLevantamiento.fecha_creacion.desc()).all()

        total_bienes = sum(f.cantidad_bienes for f in fichas)

        return render_template('fichas/responsable_detalle.html',
                             responsable_name=nombre_limpio,
                             fichas=fichas,
                             total_bienes=total_bienes)

    except Exception as e:
        current_app.logger.error(f"Error al obtener ficha de responsable: {str(e)}")
        flash('Error al cargar responsable', 'danger')
        return redirect(url_for('fichas.listar_responsables'))
