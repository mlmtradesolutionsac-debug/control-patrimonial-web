"""
WSGI Entry Point para Producción con Gunicorn

Este archivo es el punto de entrada para ejecutar la aplicación en producción
usando Gunicorn. NO usar para desarrollo (usar 'flask run' en su lugar).

Uso en producción:
    gunicorn --config gunicorn_config.py wsgi:app

Variables de entorno requeridas:
    FLASK_ENV: 'production'
    DATABASE_URL: URL de conexión a PostgreSQL
    SECRET_KEY: Clave secreta para sesiones (cambiar en producción)
"""

import os
import logging
from dotenv import load_dotenv

# Cargar variables de entorno desde archivo .env
load_dotenv(os.path.join(os.path.dirname(__file__), '.env'))

# Configurar modo producción
os.environ.setdefault('FLASK_ENV', 'production')

# Importar app factory
from app import create_app
from config import ProductionConfig

# Crear instancia de la aplicación con configuración de producción
app = create_app(ProductionConfig)

# Configurar logging en producción
if not app.debug:
    if not app.logger.handlers:
        # Solo agregar handler si no existe
        handler = logging.StreamHandler()
        handler.setLevel(logging.INFO)
        formatter = logging.Formatter(
            '%(asctime)s - %(name)s - %(levelname)s - %(message)s'
        )
        handler.setFormatter(formatter)
        app.logger.addHandler(handler)
        app.logger.setLevel(logging.INFO)
        app.logger.info('Control Patrimonial iniciado en modo producción')

if __name__ == '__main__':
    # Nota: No usar app.run() en producción
    # Usar gunicorn en su lugar: gunicorn wsgi:app
    app.run(debug=False, use_reloader=False)
