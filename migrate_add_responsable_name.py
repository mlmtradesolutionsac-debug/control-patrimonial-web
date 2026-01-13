#!/usr/bin/env python
"""Script para agregar columna responsable_name a fichas_levantamiento si no existe"""

import os
from dotenv import load_dotenv
from sqlalchemy import text

# Cargar variables de entorno
basedir = os.path.abspath(os.path.dirname(__file__))
load_dotenv(os.path.join(basedir, '.env'))

from config import Config
from app.models_sqlalchemy import db
from flask import Flask

print("=" * 60)
print("MIGRACIÓN: Agregar columna responsable_name")
print("=" * 60)

# Crear app
app = Flask(__name__)
app.config.from_object(Config)

# Asegurar que SQLALCHEMY_DATABASE_URI esté configurado
if not app.config.get('SQLALCHEMY_DATABASE_URI'):
    app.config['SQLALCHEMY_DATABASE_URI'] = os.environ.get('DATABASE_URL')
    print(f"   DATABASE_URL desde env: {app.config['SQLALCHEMY_DATABASE_URI'][:50]}...")

db.init_app(app)

with app.app_context():
    try:
        # Verificar si la columna ya existe
        result = db.session.execute(text("""
            SELECT column_name FROM information_schema.columns
            WHERE table_name = 'fichas_levantamiento' AND column_name = 'responsable_name'
        """)).fetchone()

        if result:
            print("✓ Columna 'responsable_name' ya existe")
        else:
            print("! Columna 'responsable_name' NO existe. Creando...")

            # Agregar la columna
            db.session.execute(text("""
                ALTER TABLE fichas_levantamiento
                ADD COLUMN responsable_name VARCHAR(150)
            """))

            # Crear índice
            db.session.execute(text("""
                CREATE INDEX idx_ficha_responsable ON fichas_levantamiento(responsable_name)
            """))

            db.session.commit()
            print("✓ Columna 'responsable_name' creada exitosamente")
            print("✓ Índice creado")

        # Agregar columna bienes_codigos si no existe
        result2 = db.session.execute(text("""
            SELECT column_name FROM information_schema.columns
            WHERE table_name = 'fichas_levantamiento' AND column_name = 'bienes_codigos'
        """)).fetchone()

        if result2:
            print("✓ Columna 'bienes_codigos' ya existe")
        else:
            print("! Columna 'bienes_codigos' NO existe. Creando...")

            db.session.execute(text("""
                ALTER TABLE fichas_levantamiento
                ADD COLUMN bienes_codigos TEXT
            """))

            db.session.commit()
            print("✓ Columna 'bienes_codigos' creada exitosamente")

        # Eliminar Foreign Key constraint de usuario_levantamiento si existe
        print("\n! Verificando Foreign Key en usuario_levantamiento...")
        try:
            # Obtener el nombre de la constraint
            constraint_query = db.session.execute(text("""
                SELECT constraint_name
                FROM information_schema.table_constraints
                WHERE table_name = 'fichas_levantamiento'
                AND constraint_type = 'FOREIGN KEY'
                AND constraint_name LIKE '%usuario_levantamiento%'
            """)).fetchone()

            if constraint_query:
                constraint_name = constraint_query[0]
                print(f"! Eliminando Foreign Key: {constraint_name}...")
                db.session.execute(text(f"""
                    ALTER TABLE fichas_levantamiento
                    DROP CONSTRAINT {constraint_name}
                """))
                db.session.commit()
                print(f"✓ Foreign Key eliminada exitosamente")
            else:
                print("✓ No hay Foreign Key que eliminar")
        except Exception as fk_error:
            print(f"⚠️  No se pudo eliminar FK (puede que no exista): {str(fk_error)}")

        print("\n" + "=" * 60)
        print("MIGRACIÓN COMPLETADA EXITOSAMENTE")
        print("=" * 60)

    except Exception as e:
        print(f"\n❌ ERROR: {str(e)}")
        import traceback
        traceback.print_exc()
        import sys
        sys.exit(1)
