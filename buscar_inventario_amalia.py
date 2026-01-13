#!/usr/bin/env python3
"""
Buscar inventario de Amalia Fernandez en BD local
"""

import os
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
os.environ['FLASK_ENV'] = 'development'

def buscar_inventario_amalia():
    """Buscar bienes de Amalia Fernandez"""

    print("=" * 90)
    print("BUSCAR INVENTARIO DE AMALIA FERNANDEZ")
    print("=" * 90)

    try:
        from app import create_app, db
        from app.models_sqlalchemy import Bien
        from config import DevelopmentConfig
        from sqlalchemy import func

        app = create_app(DevelopmentConfig)

        with app.app_context():
            print("\n[1/4] Conectando a BD local (SQLite)...")
            try:
                total = Bien.query.count()
                print(f"[OK] Conectado - Total bienes: {total}\n")
            except Exception as e:
                print(f"[ERROR] Error de conexión: {e}")
                return False

            # Paso 1: Buscar bienes de Amalia Fernandez
            print("[2/4] Buscando bienes registrados por Amalia Fernandez...")

            bienes_amalia = Bien.query.filter(
                Bien.usuario_registro.ilike('%amalia%')
            ).all()

            print(f"  Bienes encontrados: {len(bienes_amalia)}\n")

            if not bienes_amalia:
                print("  [INFO] No hay bienes registrados por 'amalia'")
                print("  Intentando buscar por otros criterios...\n")

            # Paso 2: Bienes sin CAL 2025
            print("[3/4] Analizando datos...")

            bienes_sin_cal = []
            bienes_con_cal = []
            sede_supe_sin_cal = []
            sede_supe_con_cal = []

            for bien in bienes_amalia:
                if bien.cal_2025:
                    bienes_con_cal.append(bien)
                    if bien.sede and 'supe' in bien.sede.nombre.lower():
                        sede_supe_con_cal.append(bien)
                else:
                    bienes_sin_cal.append(bien)
                    if bien.sede and 'supe' in bien.sede.nombre.lower():
                        sede_supe_sin_cal.append(bien)

            print(f"  Total bienes de Amalia: {len(bienes_amalia)}")
            print(f"    - Con CAL 2025: {len(bienes_con_cal)}")
            print(f"    - SIN CAL 2025: {len(bienes_sin_cal)}\n")

            if sede_supe_sin_cal or sede_supe_con_cal:
                print(f"  En Sede SUPE:")
                print(f"    - Con CAL 2025: {len(sede_supe_con_cal)}")
                print(f"    - SIN CAL 2025: {len(sede_supe_sin_cal)}\n")

            # Paso 3: Mostrar detalles de bienes SIN CAL 2025
            if bienes_sin_cal:
                print("[4/4] Bienes SIN CAL 2025 (PENDIENTES):\n")
                print(f"{'ID':<8} {'CÓDIGO':<20} {'DENOMINACIÓN':<40} {'SEDE':<15} {'DEPENDENCIA':<20}")
                print("-" * 103)

                for bien in bienes_sin_cal[:20]:  # Mostrar primeros 20
                    codigo = bien.codigo_patrimonial or "S/C"
                    sede_nombre = bien.sede.nombre if bien.sede else "N/A"
                    depto_nombre = bien.unidad.nombre if bien.unidad else "N/A"
                    denom = (bien.denominacion or "")[:40]

                    print(f"{bien.id:<8} {codigo:<20} {denom:<40} {sede_nombre:<15} {depto_nombre:<20}")

                if len(bienes_sin_cal) > 20:
                    print(f"\n... y {len(bienes_sin_cal) - 20} bienes más sin CAL 2025")

            print("\n" + "=" * 90)
            print("RESUMEN")
            print("=" * 90)
            print(f"Total bienes de Amalia Fernandez: {len(bienes_amalia)}")
            print(f"  - Con inventario (CAL 2025): {len(bienes_con_cal)}")
            print(f"  - PENDIENTES (sin CAL 2025): {len(bienes_sin_cal)}")

            if sede_supe_sin_cal:
                print(f"\n⚠️  EN SEDE SUPE (MANTENIMIENTO):")
                print(f"  - Bienes SIN inventario: {len(sede_supe_sin_cal)}")
                print(f"  - Bienes CON inventario: {len(sede_supe_con_cal)}")

            print("=" * 90)

            return True

    except Exception as e:
        print(f"\n[ERROR] Error: {e}")
        import traceback
        traceback.print_exc()
        return False

if __name__ == '__main__':
    success = buscar_inventario_amalia()
    sys.exit(0 if success else 1)
