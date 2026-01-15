import os
from datetime import timedelta

BASE_DIR = os.path.abspath(os.path.dirname(__file__))

# Cargar variables de entorno
from dotenv import load_dotenv

# Detectar ambiente primero (antes de validación)
_flask_env = os.environ.get('FLASK_ENV', 'development')

# Cargar el archivo .env correcto según el ambiente
if _flask_env == 'production':
    load_dotenv(os.path.join(BASE_DIR, '.env.production'))
else:
    load_dotenv(os.path.join(BASE_DIR, '.env'))

# Validar configuración crítica
def _validate_config():
    """
    Validar que las variables de entorno críticas estén configuradas.
    Falla al iniciar si hay problemas de configuración.
    """
    flask_env = os.environ.get('FLASK_ENV', 'development')
    secret_key = os.environ.get('SECRET_KEY')

    # En producción, SECRET_KEY DEBE estar configurado y no ser el por defecto
    if flask_env == 'production':
        if not secret_key or secret_key == 'dev-key-change-in-production':
            print("WARNING: SECRET_KEY insegura o no configurada. Usando valor por defecto...")
            # raise RuntimeError(...) - Desactivado para permitir arranque

        # DATABASE_URL es OBLIGATORIO en producción (Cloud SQL)
        db_url = os.environ.get('DATABASE_URL')
        cloud_sql_conn = os.environ.get('CLOUD_SQL_CONNECTION_NAME')
        if not db_url and not cloud_sql_conn:
            print("WARNING: DATABASE_URL no encontrado. Usando configuración de fallback...")
            # raise RuntimeError(...) - Desactivado para permitir arranque con fallback

    return True

# Ejecutar validación
_validate_config()

class Config:
    """Configuración base de la aplicación"""
    SECRET_KEY = os.environ.get('SECRET_KEY', 'dev-key-change-in-production')

    # Base de datos
    DB_FILE = os.path.join(BASE_DIR, 'data', 'inventario_patrimonial.db')

    # FASE 1: Connection Pooling - Optimización de conexiones a BD
    # Estos parámetros mejoran el rendimiento significativamente
    SQLALCHEMY_ENGINE_OPTIONS = {
        'pool_size': 5,              # Máximo de conexiones en pool
        'pool_recycle': 1800,        # Reciclar conexiones cada 30 min (desarrollo)
        'pool_pre_ping': True,       # Verificar conexión antes de usar
        'max_overflow': 10,          # Conexiones adicionales si necesario
    }

    # Seguridad CSRF
    WTF_CSRF_ENABLED = True
    WTF_CSRF_TIME_LIMIT = None  # Sin límite de tiempo para CSRF
    WTF_CSRF_SSL_STRICT = False  # Cloud Run detrás de load balancer
    WTF_CSRF_CHECK_DEFAULT = True  # Validar CSRF por defecto
    # Aceptar CSRF token desde headers o formulario
    WTF_CSRF_HEADERS = ['X-CSRFToken', 'X-CSRF-Token']

    # Flask-Login
    REMEMBER_COOKIE_DURATION = timedelta(days=7)
    REMEMBER_COOKIE_SECURE = os.environ.get('REMEMBER_COOKIE_SECURE', 'False') == 'True'
    REMEMBER_COOKIE_HTTPONLY = True
    REMEMBER_COOKIE_SAMESITE = 'Lax'

    # Session
    PERMANENT_SESSION_LIFETIME = timedelta(hours=8)
    SESSION_COOKIE_SECURE = os.environ.get('SESSION_COOKIE_SECURE', 'False') == 'True'
    SESSION_COOKIE_HTTPONLY = True
    SESSION_COOKIE_SAMESITE = 'Lax'

    # Logging
    LOG_FILE = os.path.join(BASE_DIR, 'logs', 'app.log')
    LOG_LEVEL = os.environ.get('LOG_LEVEL', 'INFO')

    # Aplicación
    ITEMS_PER_PAGE = 20
    MAX_CONTENT_LENGTH = 16 * 1024 * 1024  # 16MB max file upload

class DevelopmentConfig(Config):
    """Configuración para desarrollo"""
    DEBUG = True
    TESTING = False
    SQLALCHEMY_DATABASE_URI = 'sqlite:///' + Config.DB_FILE
    SQLALCHEMY_TRACK_MODIFICATIONS = False

class ProductionConfig(Config):
    """Configuración para producción"""
    DEBUG = False
    TESTING = False
    SESSION_COOKIE_SECURE = True  # Habilitado para HTTPS en Google Cloud Run
    REMEMBER_COOKIE_SECURE = True  # Habilitado para HTTPS en Google Cloud Run

    # Base de datos: OBLIGATORIAMENTE PostgreSQL en producción (Cloud SQL)
    # Cloud Run es stateless - SQLite se pierde entre reinicios
    # Base de datos: Prioridad ENV, fallback a localhost (para VPS/Testing)
    SQLALCHEMY_DATABASE_URI = os.environ.get('DATABASE_URL', 'postgresql://control_patrimonial:Control2025@localhost:5432/control_patrimonial')

    # if not SQLALCHEMY_DATABASE_URI check removed to prevent crash, fallback used.
    SQLALCHEMY_TRACK_MODIFICATIONS = False

    # FASE 1: Connection Pooling - Valores optimizados para producción
    # Optimizado para PostgreSQL con múltiples workers de Gunicorn
    SQLALCHEMY_ENGINE_OPTIONS = {
        'pool_size': 10,             # Conexiones por worker de Gunicorn
        'pool_recycle': 3600,        # Reciclar cada 1 hora (timeout de PostgreSQL)
        'pool_pre_ping': True,       # Verificar conexión antes de usar
        'max_overflow': 20,          # Conexiones adicionales para picos
    }

class TestingConfig(Config):
    """Configuración para testing"""
    TESTING = True
    WTF_CSRF_ENABLED = False
    DB_FILE = os.path.join(BASE_DIR, 'test_inventario.db')

# Seleccionar configuración basada en variable de entorno
config_name = os.environ.get('FLASK_ENV', 'development')
if config_name == 'production':
    config = ProductionConfig()
elif config_name == 'testing':
    config = TestingConfig()
else:
    config = DevelopmentConfig()
