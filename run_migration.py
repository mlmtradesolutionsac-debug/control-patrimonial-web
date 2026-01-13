#!/usr/bin/env python
"""Run database migration to create fichas_levantamiento table"""

import os
import sys
from dotenv import load_dotenv

# Cargar variables de entorno
basedir = os.path.abspath(os.path.dirname(__file__))
load_dotenv(os.path.join(basedir, '.env'))

# Asegurar que DATABASE_URL esté definido
if not os.environ.get('DATABASE_URL'):
    # Usar PostgreSQL en Cloud SQL con conexión TCP (35.222.111.223 es la IP de Cloud SQL)
    os.environ['DATABASE_URL'] = 'postgresql+psycopg2://patrimonio_user:patrimonio_seguro_2025@35.222.111.223:5432/patrimonio_db'

# Ahora importar config y crear app
from config import Config
from sqlalchemy import text
from app.models_sqlalchemy import db
from flask import Flask

print("Creando aplicación Flask...")
app = Flask(__name__)
app.config.from_object(Config)

# Asegurar que SQLALCHEMY_DATABASE_URI esté configurado
if not app.config.get('SQLALCHEMY_DATABASE_URI'):
    app.config['SQLALCHEMY_DATABASE_URI'] = os.environ.get('DATABASE_URL')

print(f"DATABASE_URL configurado: {app.config.get('SQLALCHEMY_DATABASE_URI')[:50]}...")

# Inicializar base de datos
db.init_app(app)

print("Conectando a la base de datos...")
with app.app_context():
    try:
        # Crear todas las tablas definidas en los modelos
        print("Creando tabla fichas_levantamiento...")
        db.create_all()
        print("✅ Tabla fichas_levantamiento creada exitosamente")

        # Verificar que la tabla existe
        result = db.session.execute(text("""
            SELECT EXISTS (
                SELECT 1 FROM information_schema.tables
                WHERE table_name = 'fichas_levantamiento'
            )
        """)).scalar()

        if result:
            print("✅ Verificación: Tabla fichas_levantamiento existe")

            # Mostrar estructura de la tabla
            cols = db.session.execute(text("""
                SELECT column_name, data_type, is_nullable
                FROM information_schema.columns
                WHERE table_name = 'fichas_levantamiento'
                ORDER BY ordinal_position
            """)).fetchall()

            print("\nEstructura de la tabla:")
            for col in cols:
                nullable = "NULL" if col[2] == "YES" else "NOT NULL"
                print(f"  - {col[0]}: {col[1]} {nullable}")
        else:
            print("❌ Error: Tabla fichas_levantamiento no se creó")

    except Exception as e:
        print(f"❌ Error: {str(e)}")
        raise
