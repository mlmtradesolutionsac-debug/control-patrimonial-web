#!/usr/bin/env python3
"""
Script para ejecutar migraciones en Cloud SQL
Se ejecuta directamente desde Cloud Run
"""

import os
import sys
from pathlib import Path

# Agregar el directorio al path para importar la aplicación
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

# Configurar variables de entorno
os.environ['FLASK_ENV'] = 'production'

def run_migrations():
    """Ejecutar migraciones de Alembic"""

    print("=" * 80)
    print("EJECUTAR MIGRACIONES EN CLOUD SQL")
    print("=" * 80)

    try:
        # Importar la aplicación
        from app import create_app, db
        from flask_migrate import upgrade

        # Crear contexto de aplicación
        app = create_app()

        with app.app_context():
            print("\n[1/2] Verificando conexión a PostgreSQL en Cloud SQL...")

            # Verificar conexión
            try:
                result = db.session.execute(db.text('SELECT version();'))
                version = result.fetchone()
                print("[OK] Conectado a PostgreSQL")
                print(f"  Versión: {version[0][:70]}...\n")
            except Exception as e:
                print(f"[ERROR] Error de conexión: {e}")
                return False

            # Ejecutar migraciones
            print("[2/2] Ejecutando migraciones de Alembic...")
            try:
                upgrade(directory='migrations')
                print("[OK] Migraciones ejecutadas exitosamente")
            except Exception as e:
                print(f"[ERROR] Error al ejecutar migraciones: {e}")
                return False

        print("\n" + "=" * 80)
        print("MIGRACIONES COMPLETADAS")
        print("=" * 80)
        return True

    except Exception as e:
        print(f"\n[ERROR] Error crítico: {e}")
        import traceback
        traceback.print_exc()
        return False

if __name__ == '__main__':
    success = run_migrations()
    sys.exit(0 if success else 1)
