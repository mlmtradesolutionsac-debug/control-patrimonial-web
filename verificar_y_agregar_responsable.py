#!/usr/bin/env python3
"""
Verificar y agregar SANCHEZ SAENZ JHON FLAVIO a varios bienes
"""

import os
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
os.environ['FLASK_ENV'] = 'development'

def verificar_responsable():
    """Verificar y agregar responsable"""

    print("=" * 80)
    print("VERIFICAR Y AGREGAR RESPONSABLE")
    print("=" * 80)

    try:
        from app import create_app, db
        from app.models_sqlalchemy import Bien
        from config import DevelopmentConfig

        app = create_app(DevelopmentConfig)

        with app.app_context():
            print("\n[1/4] Conectando a BD...")
            try:
                total_bienes = Bien.query.count()
                print(f"[OK] Total bienes en BD: {total_bienes}\n")
            except Exception as e:
                print(f"[ERROR] Error de conexión: {e}")
                return False

            responsable_nombre = "SANCHEZ SAENZ JHON FLAVIO"

            # Verificar si ya existe
            print(f"[2/4] Buscando responsable '{responsable_nombre}'...")
            bienes_con_responsable = Bien.query.filter_by(responsable=responsable_nombre).count()
            print(f"  Bienes encontrados: {bienes_con_responsable}\n")

            # Agregar a varios bienes (primeros 5)
            print(f"[3/4] Asignando responsable a los primeros 5 bienes...")
            from sqlalchemy import or_
            bienes_sin_responsable = Bien.query.filter(or_(Bien.responsable == None, Bien.responsable == '')).limit(5).all()

            if bienes_sin_responsable:
                for i, bien in enumerate(bienes_sin_responsable, 1):
                    bien.responsable = responsable_nombre
                    print(f"  Bien {i}: ID {bien.id} - {bien.denominacion[:50]}...")

                db.session.commit()
                print(f"\n[OK] {len(bienes_sin_responsable)} bienes actualizados\n")
            else:
                # Si no hay bienes sin responsable, actualizar algunos que ya tienen
                print("  (No hay bienes sin responsable, actualizando algunos existentes...)")
                bienes_existentes = Bien.query.limit(5).all()
                for i, bien in enumerate(bienes_existentes, 1):
                    bien.responsable = responsable_nombre
                    print(f"  Bien {i}: ID {bien.id}")

                db.session.commit()
                print(f"\n[OK] {len(bienes_existentes)} bienes actualizados\n")

            # Verificar que aparezca en la lista de responsables únicos
            print(f"[4/4] Verificando que aparezca en la lista...")
            responsables_unicos = db.session.query(Bien.responsable).filter(
                Bien.responsable != None,
                Bien.responsable != ''
            ).distinct().order_by(Bien.responsable).all()

            responsables_lista = [r[0].strip() for r in responsables_unicos if r[0] and r[0].strip()]

            if responsable_nombre in responsables_lista:
                print(f"[OK] '{responsable_nombre}' está en la lista de responsables\n")
                idx = responsables_lista.index(responsable_nombre)
                print(f"  Posición en lista: {idx + 1}")
                print(f"  Total responsables únicos: {len(responsables_lista)}")
            else:
                print(f"[ERROR] '{responsable_nombre}' NO aparece en la lista\n")
                print(f"  Total responsables: {len(responsables_lista)}")
                print(f"  Primeros 10:")
                for resp in responsables_lista[:10]:
                    print(f"    - {resp}")
                return False

            print("\n" + "=" * 80)
            print("LISTO")
            print("=" * 80)
            print(f"✓ Responsable '{responsable_nombre}' disponible en el dropdown")
            print(f"✓ Asignado a {len(bienes_sin_responsable) if bienes_sin_responsable else len(bienes_existentes)} bienes")
            print(f"✓ Recarga la página para ver los cambios")
            print("=" * 80)

            return True

    except Exception as e:
        print(f"\n[ERROR] Error: {e}")
        import traceback
        traceback.print_exc()
        return False

if __name__ == '__main__':
    success = verificar_responsable()
    sys.exit(0 if success else 1)
