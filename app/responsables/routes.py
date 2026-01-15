from flask import render_template, request, redirect, url_for, flash, current_app
from flask_login import login_required, current_user
from app.responsables import bp
from app import db
from app.models_sqlalchemy import Responsable, Sede, Unidad
from app.decorators import require_edit_permission

@bp.route('/')
@login_required
def listar_responsables():
    """Listar todos los responsables"""
    if not current_user.is_admin:
        flash('No tienes permiso para acceder a este módulo', 'danger')
        return redirect(url_for('main.dashboard'))

    try:
        responsables = Responsable.query.filter_by(activo=1).order_by(Responsable.nombre).all()
        return render_template('responsables/listar.html', responsables=responsables)
    except Exception as e:
        current_app.logger.error(f"Error al listar responsables: {str(e)}")
        flash('Error al cargar responsables', 'danger')
        return redirect(url_for('main.dashboard'))

@bp.route('/crear', methods=['GET', 'POST'])
@login_required
@require_edit_permission
def crear_responsable():
    """Crear nuevo responsable"""
    if not current_user.is_admin:
        flash('No tienes permiso para crear responsables', 'danger')
        return redirect(url_for('main.dashboard'))

    try:
        if request.method == 'POST':
            nombre = request.form.get('nombre', '').strip().upper()
            sede_id = request.form.get('sede_id')
            dependencia_id = request.form.get('dependencia_id')

            # Validaciones
            if not nombre:
                flash('El nombre del responsable es requerido', 'danger')
                sedes = Sede.query.all()
                unidades = Unidad.query.all()
                return render_template('responsables/form.html', sedes=sedes, unidades=unidades)

            # Verificar si ya existe
            responsable_existente = Responsable.query.filter_by(nombre=nombre).first()
            if responsable_existente:
                flash(f'El responsable "{nombre}" ya existe', 'warning')
                sedes = Sede.query.all()
                unidades = Unidad.query.all()
                return render_template('responsables/form.html', sedes=sedes, unidades=unidades)

            # Crear responsable
            responsable = Responsable(
                nombre=nombre,
                sede_id=int(sede_id) if sede_id else None,
                dependencia_id=int(dependencia_id) if dependencia_id else None,
                activo=1
            )

            db.session.add(responsable)
            db.session.commit()

            flash(f'Responsable "{nombre}" creado exitosamente', 'success')
            return redirect(url_for('responsables.listar_responsables'))

        # GET request
        sedes = Sede.query.all()
        unidades = Unidad.query.all()
        return render_template('responsables/form.html', sedes=sedes, unidades=unidades)

    except Exception as e:
        db.session.rollback()
        current_app.logger.error(f"Error al crear responsable: {str(e)}")
        flash('Error al crear responsable', 'danger')
        return redirect(url_for('responsables.listar_responsables'))

@bp.route('/editar/<int:id>', methods=['GET', 'POST'])
@login_required
@require_edit_permission
def editar_responsable(id):
    """Editar responsable existente"""
    if not current_user.is_admin:
        flash('No tienes permiso para editar responsables', 'danger')
        return redirect(url_for('main.dashboard'))

    try:
        responsable = Responsable.query.get(id)
        if not responsable:
            flash('Responsable no encontrado', 'danger')
            return redirect(url_for('responsables.listar_responsables'))

        if request.method == 'POST':
            nombre = request.form.get('nombre', '').strip().upper()
            sede_id = request.form.get('sede_id')
            dependencia_id = request.form.get('dependencia_id')

            if not nombre:
                flash('El nombre es requerido', 'danger')
                sedes = Sede.query.all()
                unidades = Unidad.query.all()
                return render_template('responsables/form.html', responsable=responsable, sedes=sedes, unidades=unidades)

            # Verificar duplicados (excluyendo el actual)
            responsable_existente = Responsable.query.filter(
                Responsable.nombre == nombre,
                Responsable.id != id
            ).first()
            if responsable_existente:
                flash(f'El responsable "{nombre}" ya existe', 'warning')
                sedes = Sede.query.all()
                unidades = Unidad.query.all()
                return render_template('responsables/form.html', responsable=responsable, sedes=sedes, unidades=unidades)

            responsable.nombre = nombre
            responsable.sede_id = int(sede_id) if sede_id else None
            responsable.dependencia_id = int(dependencia_id) if dependencia_id else None

            db.session.commit()
            flash('Responsable actualizado exitosamente', 'success')
            return redirect(url_for('responsables.listar_responsables'))

        sedes = Sede.query.all()
        unidades = Unidad.query.all()
        return render_template('responsables/form.html', responsable=responsable, sedes=sedes, unidades=unidades)

    except Exception as e:
        db.session.rollback()
        current_app.logger.error(f"Error al editar responsable: {str(e)}")
        flash('Error al editar responsable', 'danger')
        return redirect(url_for('responsables.listar_responsables'))

@bp.route('/eliminar/<int:id>', methods=['POST'])
@login_required
@require_edit_permission
def eliminar_responsable(id):
    """Eliminar (desactivar) responsable"""
    if not current_user.is_admin:
        flash('No tienes permiso para eliminar responsables', 'danger')
        return redirect(url_for('main.dashboard'))

    try:
        responsable = Responsable.query.get(id)
        if not responsable:
            flash('Responsable no encontrado', 'danger')
            return redirect(url_for('responsables.listar_responsables'))

        # Desactivar en lugar de eliminar (para mantener historial)
        responsable.activo = 0
        db.session.commit()

        flash(f'Responsable "{responsable.nombre}" desactivado', 'success')
        return redirect(url_for('responsables.listar_responsables'))

    except Exception as e:
        db.session.rollback()
        current_app.logger.error(f"Error al eliminar responsable: {str(e)}")
        flash('Error al eliminar responsable', 'danger')
        return redirect(url_for('responsables.listar_responsables'))
