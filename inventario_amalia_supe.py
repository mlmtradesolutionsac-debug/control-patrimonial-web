#!/usr/bin/env python3
"""
Verificar inventario de Amalia en Sede SUPE
"""

import os
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
os.environ['FLASK_ENV'] = 'development'

def verificar_inventario_amalia():
    """Verificar inventario de Amalia"""

    print("=" * 100)
    print("VERIFICAR INVENTARIO DE AMALIA FERNANDEZ EN SUPE")
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
                print(f"[OK] Conectado\n")
            except Exception as e:
                print(f"[ERROR] Error: {e}")
                return False

            # Datos de Amalia
            amalia_name = "FERNANDEZ HUAYAS AMALIA FELICITA"

            # Paso 1: Total de bienes de Amalia (responsable)
            print(f"[2/3] Analizando bienes de {amalia_name}...\n")

            bienes_amalia_total = Bien.query.filter(
                Bien.responsable == amalia_name
            ).count()

            bienes_amalia_con_cal = Bien.query.filter(
                Bien.responsable == amalia_name,
                Bien.cal_2025 != None
            ).count()

            bienes_amalia_sin_cal = bienes_amalia_total - bienes_amalia_con_cal

            print(f"TOTAL BIENES DE AMALIA: {bienes_amalia_total}")
            print(f"  - Inventariados (CAL 2025): {bienes_amalia_con_cal}")
            print(f"  - SIN inventariar: {bienes_amalia_sin_cal}\n")

            # Paso 2: En Sede SUPE específicamente
            print(f"[3/3] Buscando Sede SUPE...")

            sede_supe = Sede.query.filter(Sede.nombre.ilike('%supe%')).first()

            if not sede_supe:
                print("  [ERROR] Sede SUPE no encontrada")
                return False

            print(f"  [OK] Sede: {sede_supe.nombre}\n")

            amalia_supe_total = Bien.query.filter(
                Bien.responsable == amalia_name,
                Bien.sede_id == sede_supe.id
            ).count()

            amalia_supe_con_cal = Bien.query.filter(
                Bien.responsable == amalia_name,
                Bien.sede_id == sede_supe.id,
                Bien.cal_2025 != None
            ).count()

            amalia_supe_sin_cal = amalia_supe_total - amalia_supe_con_cal

            print("=" * 100)
            print("EN SEDE SUPE (MANTENIMIENTO):")
            print("=" * 100)
            print(f"Total bienes de Amalia: {amalia_supe_total}")
            print(f"  - Inventariados (CAL 2025): {amalia_supe_con_cal}")
            print(f"  - SIN inventariar: {amalia_supe_sin_cal}")

            if amalia_supe_total > 0:
                porcentaje = (amalia_supe_con_cal / amalia_supe_total * 100)
                print(f"  - Porcentaje completado: {porcentaje:.1f}%")

            # Mostrar bienes sin CAL 2025 en SUPE
            if amalia_supe_sin_cal > 0:
                print(f"\n📋 PRIMEROS 20 BIENES SIN INVENTARIAR EN SUPE:\n")
                print(f"{'ID':<8} {'CÓDIGO':<18} {'DENOMINACIÓN':<50}")
                print("-" * 76)

                bienes_sin = Bien.query.filter(
                    Bien.responsable == amalia_name,
                    Bien.sede_id == sede_supe.id,
                    Bien.cal_2025 == None
                ).limit(20).all()

                for bien in bienes_sin:
                    codigo = bien.codigo_patrimonial or "S/C"
                    denom = (bien.denominacion or "")[:50]
                    print(f"{bien.id:<8} {codigo:<18} {denom:<50}")

                if amalia_supe_sin_cal > 20:
                    print(f"\n... y {amalia_supe_sin_cal - 20} bienes más sin mostrar")

            print("\n" + "=" * 100)
            print("ANÁLISIS")
            print("=" * 100)

            if amalia_supe_sin_cal > 0:
                print(f"⚠️  Amalia tiene {amalia_supe_sin_cal} bienes SIN inventariar en SUPE")
                print(f"   Estos bienes necesitan CAL 2025 para reflejarse en el inventario")
                print(f"\n✅ SOLUCIÓN:")
                print(f"   1. Verificar si Amalia registró los CAL 2025 en el servidor local")
                print(f"   2. Los datos pueden estar en la carpeta de datos del servidor (10.28.106.250)")
                print(f"   3. Necesitamos sincronizar esos datos a la BD Cloud SQL")
            else:
                print(f"✅ Todos los bienes de Amalia en SUPE están inventariados")

            print("=" * 100)

            return True

    except Exception as e:
        print(f"\n[ERROR] Error: {e}")
        import traceback
        traceback.print_exc()
        return False

if __name__ == '__main__':
    success = verificar_inventario_amalia()
    sys.exit(0 if success else 1)
