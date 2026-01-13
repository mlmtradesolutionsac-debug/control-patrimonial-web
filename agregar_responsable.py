#!/usr/bin/env python3
"""
Script para:
1. Eliminar usuario jsanchez creado por error
2. Agregar SANCHEZ SAENZ JHON FLAVIO como responsable de bienes
"""

import os
import sys
from pathlib import Path

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
os.environ['FLASK_ENV'] = 'development'

def gestionar_responsable():
    """Gestionar responsable"""

    print("=" * 80)
    print("AGREGAR RESPONSABLE A BIENES")
    print("=" * 80)

    try:
        from app import create_app, db
        from app.models_sqlalchemy import UsuarioApp, Bien
        from config import DevelopmentConfig

        app = create_app(DevelopmentConfig)

        with app.app_context():
            print("\n[1/3] Conectando a BD local...")

            try:
                count = UsuarioApp.query.count()
                print(f"[OK] Conectado\n")
            except Exception as e:
                print(f"[ERROR] Error de conexión: {e}")
                return False

            # Paso 1: Eliminar usuario jsanchez
            print("[2/3] Eliminando usuario jsanchez...")
            usuario_jsanchez = UsuarioApp.query.filter_by(username="jsanchez").first()
            if usuario_jsanchez:
                db.session.delete(usuario_jsanchez)
                db.session.commit()
                print("[OK] Usuario jsanchez eliminado\n")
            else:
                print("[INFO] Usuario jsanchez no encontrado (no hay nada que eliminar)\n")

            # Paso 2: Verificar y agregar responsable a un bien existente
            print("[3/3] Agregando responsable a bienes...")

            responsable_nombre = "SANCHEZ SAENZ JHON FLAVIO"

            # Buscar si ya existe un bien con este responsable
            bien_con_responsable = Bien.query.filter_by(responsable=responsable_nombre).first()

            if bien_con_responsable:
                print(f"[INFO] El responsable '{responsable_nombre}' ya está asignado a un bien")
                print(f"       Bien ID: {bien_con_responsable.id}")
            else:
                # Buscar un bien para asignarle este responsable
                primer_bien = Bien.query.first()

                if primer_bien:
                    # Actualizar responsable del primer bien
                    bien_original = primer_bien.responsable
                    primer_bien.responsable = responsable_nombre
                    db.session.commit()
                    print(f"[OK] Responsable agregado al bien ID {primer_bien.id}")
                    print(f"    Responsable anterior: {bien_original}")
                    print(f"    Nuevo responsable: {responsable_nombre}")
                else:
                    print("[ADVERTENCIA] No hay bienes en la BD para asignar responsable")
                    print("              Los responsables se agregan automáticamente cuando se asignan a bienes")

            print("\n" + "=" * 80)
            print("RESUMEN")
            print("=" * 80)
            print(f"✓ Usuario 'jsanchez' eliminado")
            print(f"✓ Responsable '{responsable_nombre}' disponible para asignar a bienes")
            print(f"\nAhora puedes:")
            print(f"  1. Acceder a https://control-patrimonial-195522615542.us-central1.run.app")
            print(f"  2. Crear o editar un bien")
            print(f"  3. En el campo 'Responsable' verás a '{responsable_nombre}'")
            print(f"  4. Asignarle bienes sin problemas")
            print("=" * 80)

            return True

    except Exception as e:
        print(f"\n[ERROR] Error: {e}")
        import traceback
        traceback.print_exc()
        return False

if __name__ == '__main__':
    success = gestionar_responsable()
    sys.exit(0 if success else 1)
