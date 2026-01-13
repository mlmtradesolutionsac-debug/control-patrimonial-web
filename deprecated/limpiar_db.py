#!/usr/bin/env python3
"""
Script para limpiar y recrear la BD sin UNIQUE en cal_2025
"""

import sys
import os
sys.path.insert(0, '/home/patrimonio/control_patrimonial')
os.chdir('/home/patrimonio/control_patrimonial')

from wsgi import app
from app import db

print("\n===== LIMPIEZA Y RECREACIÓN DE BD =====\n")

with app.app_context():
    try:
        print("1. Eliminando vistas existentes...")
        with db.engine.connect() as conn:
            try:
                conn.execute(db.text("DROP VIEW IF EXISTS vw_inventariadores_stats"))
                conn.execute(db.text("DROP VIEW IF EXISTS vw_resumen_inventario"))
                conn.commit()
                print("   OK - Vistas eliminadas\n")
            except Exception as e:
                print(f"   OK - Sin vistas para eliminar\n")

        print("2. Eliminando todas las tablas...")
        db.drop_all()
        print("   OK - Tablas eliminadas\n")

        print("3. Recreando tablas (con modelo actualizado)...")
        db.create_all()
        print("   OK - Tablas recreadas\n")

        print("4. Persistiendo cambios a disco...")
        # Forzar que SQLAlchemy escriba a disco
        with db.engine.connect() as conn:
            conn.execute(db.text("PRAGMA integrity_check"))
            conn.commit()
        print("   OK - Cambios persistidos\n")

        print("5. Verificando estructura...")
        from sqlalchemy import inspect
        inspector = inspect(db.engine)
        constraints = inspector.get_unique_constraints('bienes')
        print(f"   Restricciones UNIQUE: {constraints}\n")

        print("===== EXITO: BD lista para actualización =====\n")

    except Exception as e:
        print(f"\nERROR: {str(e)}")
        sys.exit(1)
