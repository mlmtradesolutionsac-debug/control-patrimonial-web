#!/usr/bin/env python3
"""
Buscar si Amalia Fernandez es responsable de bienes
"""

import os
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
os.environ['FLASK_ENV'] = 'development'

def buscar_amalia():
    """Buscar a Amalia como responsable"""

    print("=" * 100)
    print("BUSCAR A AMALIA FERNANDEZ EN BD")
    print("=" * 100)

    try:
        from app import create_app, db
        from app.models_sqlalchemy import Bien
        from config import DevelopmentConfig
        from sqlalchemy import func

        app = create_app(DevelopmentConfig)

        with app.app_context():
            print("\n[1/3] Conectando a BD local...")
            try:
                total = Bien.query.count()
                print(f"[OK] Conectado\n")
            except Exception as e:
                print(f"[ERROR] Error: {e}")
                return False

            # Búsquedas diferentes
            print("[2/3] Buscando a Amalia Fernandez en diferentes campos...\n")

            # 1. Como responsable
            print("1. Búsqueda como RESPONSABLE:")
            bienes_responsable = Bien.query.filter(
                Bien.responsable.ilike('%amalia%')
            ).all()
            print(f"   Encontrados: {len(bienes_responsable)}")
            if bienes_responsable:
                for bien in bienes_responsable[:5]:
                    print(f"     - ID {bien.id}: {bien.denominacion[:50]}")

            # 2. Como usuario de registro
            print("\n2. Búsqueda como USUARIO_REGISTRO:")
            bienes_usuario = Bien.query.filter(
                Bien.usuario_registro.ilike('%amalia%')
            ).all()
            print(f"   Encontrados: {len(bienes_usuario)}")

            # 3. Buscar "FERNANDEZ" en responsable
            print("\n3. Búsqueda por 'FERNANDEZ' en RESPONSABLE:")
            bienes_fernandez = Bien.query.filter(
                Bien.responsable.ilike('%fernandez%')
            ).all()
            print(f"   Encontrados: {len(bienes_fernandez)}")
            if bienes_fernandez:
                print(f"\n   Primeros 10:")
                for bien in bienes_fernandez[:10]:
                    print(f"     - {bien.responsable} (ID {bien.id})")

            # 4. Todos los responsables únicos que contienen "AMALIA" o "FERNANDEZ"
            print("\n4. Responsables que contienen 'AMALIA' o 'FERNANDEZ':")
            responsables = db.session.query(
                Bien.responsable,
                func.count(Bien.id).label('cantidad')
            ).filter(
                Bien.responsable.ilike('%amalia%') | Bien.responsable.ilike('%fernandez%')
            ).group_by(Bien.responsable).all()

            if responsables:
                for resp, cant in responsables:
                    print(f"   - {resp}: {cant} bienes")
            else:
                print("   No encontrados")

            # 5. Listar TODOS los responsables únicos para búsqueda manual
            print("\n[3/3] Buscando responsables que podrían ser de Amalia...\n")
            print("   RESPONSABLES CON INFORMACIÓN (primeros 30):\n")

            todos_responsables = db.session.query(
                Bien.responsable,
                func.count(Bien.id).label('cantidad')
            ).filter(
                Bien.responsable != None,
                Bien.responsable != ''
            ).group_by(Bien.responsable).order_by(
                func.count(Bien.id).desc()
            ).limit(30).all()

            print(f"{'RESPONSABLE':<50} {'CANTIDAD':<10}")
            print("-" * 60)
            for resp, cant in todos_responsables:
                print(f"{resp:<50} {cant:<10}")

            print("\n" + "=" * 100)
            print("NOTA: Si Amalia realizó inventario pero no aparece:")
            print("  - Los datos NO se sincronizaron a la BD local")
            print("  - O se guardaron con OTRO nombre")
            print("  - O en OTRA sede que no sea SUPE")
            print("=" * 100)

            return True

    except Exception as e:
        print(f"\n[ERROR] Error: {e}")
        import traceback
        traceback.print_exc()
        return False

if __name__ == '__main__':
    success = buscar_amalia()
    sys.exit(0 if success else 1)
