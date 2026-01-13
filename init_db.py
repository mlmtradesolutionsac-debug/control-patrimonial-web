#!/usr/bin/env python
"""Initialize database with all required tables"""

import os
import sys
from dotenv import load_dotenv

# Cargar variables de entorno
basedir = os.path.abspath(os.path.dirname(__file__))
load_dotenv(os.path.join(basedir, '.env'))

from config import Config
from app.models_sqlalchemy import db
from flask import Flask

print("=" * 50)
print("INICIALIZACIÓN DE BASE DE DATOS")
print("=" * 50)

# Crear app
print("\n1. Creando aplicación Flask...")
app = Flask(__name__)
app.config.from_object(Config)

# Asegurar que SQLALCHEMY_DATABASE_URI esté configurado
if not app.config.get('SQLALCHEMY_DATABASE_URI'):
    app.config['SQLALCHEMY_DATABASE_URI'] = os.environ.get('DATABASE_URL')
    print(f"   DATABASE_URL desde env: {app.config['SQLALCHEMY_DATABASE_URI'][:50]}...")

print("   ✓ Aplicación creada")

# Inicializar base de datos
print("\n2. Inicializando conexión a base de datos...")
db.init_app(app)
print("   ✓ Conexión inicializada")

# Crear todas las tablas
print("\n3. Creando tablas...")
with app.app_context():
    try:
        # Crear todas las tablas definidas en los modelos
        db.create_all()
        print("   ✓ Todas las tablas creadas/verificadas")

        # Verificar que fichas_levantamiento existe
        from sqlalchemy import text
        try:
            result = db.session.execute(text("""
                SELECT EXISTS (
                    SELECT 1 FROM information_schema.tables
                    WHERE table_name = 'fichas_levantamiento'
                )
            """)).scalar()

            if result:
                print("   ✓ Tabla 'fichas_levantamiento' existe")
            else:
                print("   ⚠️  Tabla 'fichas_levantamiento' no encontrada")
                print("      (Se creará en el próximo startup)")
        except Exception as e:
            print(f"   ⚠️  No se pudo verificar tablas: {str(e)}")

        print("\n" + "=" * 50)
        print("INICIALIZACIÓN COMPLETADA")
        print("=" * 50)

    except Exception as e:
        print(f"\n❌ ERROR: {str(e)}")
        print("\nDetalles del error:")
        import traceback
        traceback.print_exc()
        print("\n" + "=" * 50)
        print("INICIALIZACIÓN FALLIDA")
        print("=" * 50)
        sys.exit(1)
