from flask import Flask
from flask_login import LoginManager
from flask_wtf.csrf import CSRFProtect
from flask_cors import CORS
from flask_migrate import Migrate
from flask_limiter import Limiter
from flask_limiter.util import get_remote_address
from werkzeug.proxy_fix import ProxyFix
import mimetypes
import os
from dotenv import load_dotenv

# Fix para Windows
mimetypes.add_type('application/javascript', '.js')

from config import Config
from app.utils import setup_logging
from app.models_sqlalchemy import db, Usuario, UsuarioApp
from app.decorators import is_visitor_user, can_edit

# Cargar variables de entorno
basedir = os.path.abspath(os.path.dirname(os.path.dirname(__file__)))
load_dotenv(os.path.join(basedir, '.env'))

login_manager = LoginManager()
login_manager.login_view = 'auth.login'
login_manager.login_message = 'Por favor inicie sesión para acceder a esta página.'

csrf = CSRFProtect()
migrate = Migrate()
limiter = Limiter(
    key_func=get_remote_address,
    default_limits=["10000 per day", "2000 per hour"],
    storage_uri="memory://",
    enabled=(os.environ.get('FLASK_ENV') != 'production')  # Deshabilitar en producción
)

@login_manager.user_loader
def load_user(full_user_id):
    try:
        if full_user_id.startswith("admin_"):
            user_identifier = full_user_id.replace("admin_", "")
            user = Usuario.query.filter_by(usuario=user_identifier).first()
            if user:
                return user
        elif full_user_id.startswith("app_"):
            user_identifier = full_user_id.replace("app_", "")
            user_app = UsuarioApp.query.filter_by(username=user_identifier).first()
            if user_app:
                return user_app
    except Exception as e:
        from flask import current_app
        try:
            current_app.logger.error(f"Error loading user {full_user_id}: {str(e)}")
        except:
            pass
    return None

def create_app(config_class=Config):
    app = Flask(__name__)
    app.config.from_object(config_class)

    # ProxyFix para Google Cloud Run (detrás de Load Balancer)
    # Esto le dice a Flask que confíe en los headers X-Forwarded-For, X-Forwarded-Proto, etc.
    app.wsgi_app = ProxyFix(app.wsgi_app, x_for=1, x_proto=1, x_host=1, x_port=1)

    login_manager.init_app(app)
    csrf.init_app(app)
    CORS(app, resources={r"/api/*": {"origins": "*"}})
    db.init_app(app)
    migrate.init_app(app, db)
    limiter.init_app(app)
    setup_logging(app)

    from app.auth import bp as auth_bp
    app.register_blueprint(auth_bp, url_prefix='/auth')

    from app.main import bp as main_bp
    app.register_blueprint(main_bp)

    from app.api import bp as api_bp
    app.register_blueprint(api_bp, url_prefix='/api')

    from app.fichas import bp as fichas_bp
    app.register_blueprint(fichas_bp, url_prefix='/fichas')

    from app.responsables import bp as responsables_bp
    app.register_blueprint(responsables_bp)

    import mimetypes
    mimetypes.add_type('application/javascript', '.js')
    mimetypes.add_type('text/css', '.css')

    @app.context_processor
    def inject_permissions():
        """Pasar funciones de permisos a todos los templates"""
        return dict(
            is_visitor_user=is_visitor_user,
            can_edit=can_edit
        )

    @app.context_processor
    def inject_csrf_token():
        """Inyectar función generate_csrf en todos los templates"""
        from flask_wtf.csrf import generate_csrf
        return dict(generate_csrf=generate_csrf)

    @app.after_request
    def set_security_headers(response):
        response.headers['X-Content-Type-Options'] = 'nosniff'
        response.headers['X-Frame-Options'] = 'SAMEORIGIN'
        response.headers['X-XSS-Protection'] = '1; mode=block'
        response.headers['Strict-Transport-Security'] = 'max-age=31536000; includeSubDomains'
        csp = (
            "default-src 'self'; "
            "script-src 'self' 'unsafe-inline' cdn.jsdelivr.net; "
            "style-src 'self' 'unsafe-inline' cdn.jsdelivr.net; "
            "font-src 'self' cdn.jsdelivr.net data:; "
            "img-src 'self' data: blob:; "
            "connect-src 'self' cdn.jsdelivr.net;"
        )
        response.headers['Content-Security-Policy'] = csp
        return response

    # Eliminado check_db_connection para evitar desconexiones agresivas por timeouts transitorios
    # Se confía en pool_pre_ping de SQLAlchemy configurado en config.py

    @app.errorhandler(404)
    def not_found(error):
        from flask import render_template
        return render_template('errors/404.html'), 404

    @app.errorhandler(500)
    def internal_error(error):
        from flask import render_template
        app.logger.error(f'Server error: {error}')
        return render_template('errors/500.html'), 500

    @app.errorhandler(403)
    def forbidden(error):
        from flask import render_template
        return render_template('errors/403.html'), 403

    # Health check endpoints para Cloud Run
    @app.route('/health', methods=['GET'])
    def health_check():
        """Health check endpoint para Cloud Run monitoreo"""
        try:
            from datetime import datetime
            from flask import jsonify
            # Health check simple sin BD para evitar fallos por timeout inicial
            # db.session.execute(text('SELECT 1')) 
            # db.session.commit()
            return jsonify({
                'status': 'healthy',
                'timestamp': datetime.utcnow().isoformat(),
                'version': '1.0.0'
            }), 200
        except Exception as e:
            app.logger.error(f"Health check failed: {str(e)}")
            from flask import jsonify
            return jsonify({
                'status': 'unhealthy',
                'error': str(e)
            }), 503

    @app.route('/ready', methods=['GET'])
    def readiness_check():
        """Readiness check endpoint para Cloud Run inicialización"""
        try:
            from flask import jsonify
            from sqlalchemy import text
            db.session.execute(text('SELECT 1'))
            db.session.commit()
            return jsonify({'ready': True}), 200
        except Exception as e:
            from flask import jsonify
            return jsonify({'ready': False, 'error': str(e)}), 503

    # Registrar comandos CLI
    from app.commands import init_app as init_commands
    init_commands(app)

    return app
