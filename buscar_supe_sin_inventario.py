#!/usr/bin/env python3
"""
Buscar bienes en Sede SUPE sin inventario (sin CAL 2025)
"""

import os
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
os.environ['FLASK_ENV'] = 'development'

def buscar_supe():
    """Buscar bienes en SUPE sin CAL 2025"""

    print("=" * 100)
    print("BUSCAR BIENES EN SEDE SUPE SIN INVENTARIO (SIN CAL 2025)")
    print("=" * 100)

    try:
        from app import create_app, db
        from app.models_sqlalchemy import Bien, Sede
        from config import DevelopmentConfig

        app = create_app(DevelopmentConfig)

        with app.app_context():
            print("\n[1/3] Conectando a BD local...")
            try:
                total = Bien.query.count()
                print(f"[OK] Conectado - Total bienes: {total}\n")
            except Exception as e:
                print(f"[ERROR] Error: {e}")
                return False

            # Paso 1: Buscar Sede SUPE
            print("[2/3] Buscando Sede SUPE...")

            sede_supe = Sede.query.filter(
                Sede.nombre.ilike('%supe%')
            ).first()

            if not sede_supe:
                print("  [ERROR] No se encontró Sede SUPE\n")
                print("  Sedes disponibles:")
                sedes = Sede.query.all()
                for s in sedes:
                    print(f"    - {s.nombre}")
                return False

            print(f"  [OK] Sede encontrada: {sede_supe.nombre} (ID: {sede_supe.id})\n")

            # Paso 2: Bienes en SUPE sin CAL 2025
            print("[3/3] Buscando bienes SIN inventario en SUPE...")

            bienes_supe_sin_cal = Bien.query.filter(
                Bien.sede_id == sede_supe.id,
                Bien.cal_2025 == None
            ).order_by(Bien.id).all()

            bienes_supe_con_cal = Bien.query.filter(
                Bien.sede_id == sede_supe.id,
                Bien.cal_2025 != None
            ).count()

            total_supe = Bien.query.filter(Bien.sede_id == sede_supe.id).count()

            print(f"\n  Total bienes en SUPE: {total_supe}")
            print(f"    - Con inventario (CAL 2025): {bienes_supe_con_cal}")
            print(f"    - SIN inventario (sin CAL 2025): {len(bienes_supe_sin_cal)}\n")

            if bienes_supe_sin_cal:
                print("=" * 100)
                print("BIENES EN SUPE SIN INVENTARIO:\n")
                print(f"{'ID':<8} {'CÓDIGO':<18} {'DENOMINACIÓN':<45} {'USUARIO':<18} {'DEPENDENCIA':<18}")
                print("-" * 100)

                for bien in bienes_supe_sin_cal[:50]:  # Mostrar primeros 50
                    codigo = bien.codigo_patrimonial or "S/C"
                    denom = (bien.denominacion or "")[:45]
                    usuario = bien.usuario_registro or "N/A"
                    depto = (bien.unidad.nombre if bien.unidad else "N/A")[:18]

                    print(f"{bien.id:<8} {codigo:<18} {denom:<45} {usuario:<18} {depto:<18}")

                if len(bienes_supe_sin_cal) > 50:
                    print(f"\n... y {len(bienes_supe_sin_cal) - 50} bienes más sin mostrar")

                # Contar por usuario
                print("\n" + "=" * 100)
                print("BIENES POR USUARIO:\n")

                from sqlalchemy import func
                usuarios = db.session.query(
                    Bien.usuario_registro,
                    func.count(Bien.id).label('cantidad')
                ).filter(
                    Bien.sede_id == sede_supe.id,
                    Bien.cal_2025 == None
                ).group_by(Bien.usuario_registro).order_by(func.count(Bien.id).desc()).all()

                print(f"{'USUARIO':<30} {'CANTIDAD':<10}")
                print("-" * 40)
                for usuario, cantidad in usuarios:
                    usuario_display = usuario or "SIN USUARIO"
                    print(f"{usuario_display:<30} {cantidad:<10}")

            print("\n" + "=" * 100)
            print("RESUMEN SEDE SUPE")
            print("=" * 100)
            print(f"Total bienes: {total_supe}")
            print(f"Inventariados: {bienes_supe_con_cal}")
            print(f"PENDIENTES: {len(bienes_supe_sin_cal)}")
            print(f"Porcentaje completado: {(bienes_supe_con_cal/total_supe*100) if total_supe > 0 else 0:.1f}%")
            print("=" * 100)

            return True

    except Exception as e:
        print(f"\n[ERROR] Error: {e}")
        import traceback
        traceback.print_exc()
        return False

if __name__ == '__main__':
    success = buscar_supe()
    sys.exit(0 if success else 1)
