#!/usr/bin/env python
"""
Script de ejecución para Control Patrimonial Web
Uso: python run.py
"""
import os
import sys
from dotenv import load_dotenv

# Cargar variables de entorno
load_dotenv()

from app import create_app
from config import DevelopmentConfig, ProductionConfig, TestingConfig

# Crear aplicación
flask_env = os.environ.get('FLASK_ENV', 'development')

if flask_env == 'production':
    app = create_app(ProductionConfig)
elif flask_env == 'testing':
    app = create_app(TestingConfig)
else:
    app = create_app(DevelopmentConfig)

if __name__ == '__main__':
    port = int(os.environ.get('PORT', 5000))
    host = os.environ.get('HOST', '0.0.0.0')
    debug = app.debug

    print("=" * 50)
    print("Control Patrimonial Web")
    print("Distrito Fiscal del Callao")
    print("=" * 50)
    print(f"Ambiente: {flask_env.upper()}")
    print(f"URL: http://{host}:{port}")
    print(f"Debug: {'Activo' if debug else 'Inactivo'}")
    print("=" * 50)
    print("")

    try:
        app.run(debug=debug, host=host, port=port)
    except KeyboardInterrupt:
        print("\n\nServidor detenido correctamente.")
        sys.exit(0)
