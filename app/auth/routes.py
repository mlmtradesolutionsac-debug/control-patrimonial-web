from flask import render_template, redirect, url_for, flash, request, current_app
from flask_login import login_user, logout_user, current_user, login_required
from app.auth import bp
from app.repository import RepoSQLAlchemy as Repo  # Usar ORM en lugar de SQL raw
from app.utils import log_action, sanitize_input, log_security_event
from app.models_sqlalchemy import Usuario, UsuarioApp
from app import limiter

# Diccionario en memoria para rastrear intentos fallidos de login
failed_login_attempts = {}

@bp.route('/login', methods=['GET', 'POST'])
@limiter.limit("5 per minute")
def login():
    if current_user.is_authenticated:
        return redirect(url_for('main.dashboard'))

    if request.method == 'POST':
        username = sanitize_input(request.form.get('username', ''))
        password = request.form.get('password', '')
        remember_me = request.form.get('remember', False)

        # Validar que no estén vacíos
        if not username or not password:
            flash('Usuario y contraseña son requeridos', 'warning')
            return render_template('auth/login.html')

        repo = Repo()
        user_data = repo.login(username, password)

        if user_data:
            # Convertir diccionario a objeto Usuario/UsuarioApp para Flask-Login
            if user_data.get('is_admin'):
                # Buscar usuario admin en BD
                user = Usuario.query.filter_by(usuario=user_data['username']).first()
            else:
                # Buscar usuario app en BD
                user = UsuarioApp.query.filter_by(username=user_data['username']).first()

            if user:
                login_user(user, remember=bool(remember_me))
                log_action('LOGIN', f'Usuario {username} inició sesión exitosamente')
                # Resetear contador de intentos fallidos al login exitoso
                failed_login_attempts.pop(username, None)

                next_page = request.args.get('next')
                # Validar que next_page sea una URL segura
                if next_page and not next_page.startswith('/'):
                    next_page = None

                flash(f'Bienvenido, {user_data["nombre"]}', 'success')
                return redirect(next_page or url_for('main.dashboard'))

        # Login fallido - registrar intento
        attempts = failed_login_attempts.get(username, 0) + 1
        failed_login_attempts[username] = attempts
        ip = request.remote_addr

        log_action('LOGIN_FALLIDO', f'Intento de login fallido para usuario {username}')

        # Registrar evento de seguridad con detalles
        if attempts >= 5:
            log_security_event(
                'BRUTE_FORCE_DETECTED',
                f'Posible ataque de fuerza bruta detectado - Intento #{attempts} para usuario {username}',
                severity='CRITICAL',
                ip_address=ip
            )
        elif attempts >= 3:
            log_security_event(
                'LOGIN_FAILED_MULTIPLE',
                f'Intento #{attempts} de login fallido para usuario {username}',
                severity='WARNING',
                ip_address=ip
            )
        else:
            log_security_event(
                'LOGIN_FAILED',
                f'Intento de login fallido para usuario {username}',
                severity='INFO',
                ip_address=ip
            )

        flash('Usuario o contraseña inválidos', 'danger')

    return render_template('auth/login.html')

@bp.route('/cambiar-contrasena', methods=['GET', 'POST'])
@login_required
@limiter.limit("3 per minute")
def cambiar_contrasena():
    if request.method == 'POST':
        from flask import jsonify

        contrasena_actual = request.form.get('contrasena_actual', '')
        contrasena_nueva = request.form.get('contrasena_nueva', '')
        contrasena_confirma = request.form.get('contrasena_confirma', '')

        current_app.logger.debug(f"[CAMBIAR_PASS] Usuario: {current_user.username}, Tipo usuario: {type(current_user).__name__}")

        # Validar que no estén vacíos
        if not contrasena_actual or not contrasena_nueva or not contrasena_confirma:
            current_app.logger.warning(f"[CAMBIAR_PASS] Campos vacíos para usuario {current_user.username}")
            response = jsonify({
                'success': False,
                'error': 'Todos los campos son requeridos'
            })
            response.status_code = 400
            return response

        # Validar que las nuevas contraseñas coincidan
        if contrasena_nueva != contrasena_confirma:
            current_app.logger.warning(f"[CAMBIAR_PASS] Contraseñas nuevas no coinciden para usuario {current_user.username}")
            response = jsonify({
                'success': False,
                'error': 'Las contraseñas nuevas no coinciden'
            })
            response.status_code = 400
            return response

        # Validar que la nueva contraseña tenga al menos 6 caracteres
        if len(contrasena_nueva) < 6:
            current_app.logger.warning(f"[CAMBIAR_PASS] Contraseña muy corta para usuario {current_user.username}")
            response = jsonify({
                'success': False,
                'error': 'La contraseña debe tener al menos 6 caracteres'
            })
            response.status_code = 400
            return response

        # Verificar que la contraseña actual sea correcta
        repo = Repo()

        try:
            # Intentar login con contraseña actual para verificar
            current_app.logger.debug(f"[CAMBIAR_PASS] Verificando contraseña actual para {current_user.username}")
            user_data = repo.login(current_user.username, contrasena_actual)
            current_app.logger.debug(f"[CAMBIAR_PASS] Resultado login: {user_data is not None}")

            if not user_data:
                current_app.logger.warning(f"[CAMBIAR_PASS] Contraseña actual incorrecta para usuario {current_user.username}")
                response = jsonify({
                    'success': False,
                    'error': 'La contraseña actual es incorrecta'
                })
                response.status_code = 401
                return response

            # Cambiar la contraseña en la base de datos
            current_app.logger.debug(f"[CAMBIAR_PASS] Llamando a cambiar_contrasena para {current_user.username}")
            result = repo.cambiar_contrasena(current_user.username, contrasena_nueva)
            current_app.logger.debug(f"[CAMBIAR_PASS] Resultado cambiar_contrasena: {result}")

            if result:
                log_action('CAMBIAR_CONTRASENA', f'Usuario {current_user.username} cambió su contraseña')
                log_security_event(
                    'PASSWORD_CHANGED',
                    f'Usuario {current_user.username} cambió su contraseña exitosamente',
                    severity='INFO'
                )
                current_app.logger.info(f"[CAMBIAR_PASS] Contraseña cambiada exitosamente para {current_user.username}")
                return jsonify({
                    'success': True,
                    'message': 'Contraseña cambiada exitosamente'
                })
            else:
                current_app.logger.error(f"[CAMBIAR_PASS] cambiar_contrasena retornó False para {current_user.username}")
                response = jsonify({
                    'success': False,
                    'error': 'No se pudo cambiar la contraseña (usuario no encontrado)'
                })
                response.status_code = 500
                return response

        except Exception as e:
            current_app.logger.error(f"[CAMBIAR_PASS] Exception al cambiar contraseña para {current_user.username}: {str(e)}", exc_info=True)
            response = jsonify({
                'success': False,
                'error': f'Error del sistema: {str(e)}'
            })
            response.status_code = 500
            return response

    return render_template('main/mi_cuenta.html', usuario=current_user)

@bp.route('/logout')
def logout():
    if current_user.is_authenticated:
        username = current_user.username
        log_action('LOGOUT', f'Usuario {username} cerró sesión')
        log_security_event(
            'LOGOUT',
            f'Usuario {username} cerró sesión',
            severity='INFO'
        )
    logout_user()
    flash('Has cerrado sesión exitosamente', 'info')
    return redirect(url_for('auth.login'))
