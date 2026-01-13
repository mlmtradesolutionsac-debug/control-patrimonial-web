#!/usr/bin/env python3
"""
Script para recuperar los 668 bienes que faltaron en la migración SQLite -> PostgreSQL
Identifica y migra TODOS los bienes faltantes preservando CAL 2025 y otros campos
"""

import sys
import os
sys.path.insert(0, '/home/patrimonio/control_patrimonial')
os.chdir('/home/patrimonio/control_patrimonial')

from wsgi import app
from app import db
from app.models_sqlalchemy import Bien
import sqlite3
from datetime import datetime

SQLITE_PATH = 'data/inventario_patrimonial.db'

print("\n" + "="*70)
print("RECUPERAR BIENES FALTANTES DE SQLite A PostgreSQL")
print("="*70 + "\n")

# Conectar a SQLite
conn_sqlite = sqlite3.connect(SQLITE_PATH)
conn_sqlite.row_factory = sqlite3.Row
cursor = conn_sqlite.cursor()

with app.app_context():
    try:
        # Obtener códigos que ya existen en PostgreSQL
        codigos_pg = set(bien.codigo_patrimonial for bien in Bien.query.all())
        print(f"Bienes ya en PostgreSQL: {len(codigos_pg)}")

        # Leer todos los bienes de SQLite
        cursor.execute("SELECT * FROM bienes")
        bienes_sqlite = cursor.fetchall()
        print(f"Bienes en SQLite: {len(bienes_sqlite)}")

        # Encontrar faltantes
        bienes_faltantes = [b for b in bienes_sqlite if b['codigo_patrimonial'] not in codigos_pg]
        print(f"Bienes faltantes: {len(bienes_faltantes)}\n")

        # Analizar cuántos faltantes tienen CAL 2025
        faltantes_con_cal = sum(1 for b in bienes_faltantes if b['cal_2025'] and b['cal_2025'].strip())
        print(f"Faltantes CON CAL 2025: {faltantes_con_cal}")
        print(f"Faltantes SIN CAL 2025: {len(bienes_faltantes) - faltantes_con_cal}\n")

        stats = {'insertados': 0, 'errores': 0}

        # Rastrear series y cal_2025 para evitar duplicados UNIQUE
        series_usadas = set(bien.serie for bien in Bien.query.filter(Bien.serie != None).all())
        cal_2025_usadas = set(bien.cal_2025 for bien in Bien.query.filter(Bien.cal_2025 != None).all())

        print(f"Series ya usadas: {len(series_usadas)}")
        print(f"CAL 2025 ya usadas: {len(cal_2025_usadas)}\n")

        print("Importando bienes faltantes...")

        for idx, row in enumerate(bienes_faltantes, 1):
            try:
                codigo = row['codigo_patrimonial']
                serie_val = row['serie']
                cal_2025_val = row['cal_2025']

                # Limpiar nulls
                if not serie_val or serie_val == '':
                    serie_val = None
                if not cal_2025_val or cal_2025_val == '':
                    cal_2025_val = None

                # Evitar duplicados
                if serie_val and serie_val in series_usadas:
                    serie_val = None
                else:
                    if serie_val:
                        series_usadas.add(serie_val)

                if cal_2025_val and cal_2025_val in cal_2025_usadas:
                    cal_2025_val = None
                else:
                    if cal_2025_val:
                        cal_2025_usadas.add(cal_2025_val)

                # Validar sede_id y unidad_id
                sede_id = row['sede_id']
                if not sede_id or sede_id <= 0:
                    sede_id = 1
                unidad_id = row['unidad_id']
                if not unidad_id or unidad_id <= 0:
                    unidad_id = 1

                # Crear bien
                nuevo_bien = Bien(
                    codigo_patrimonial=codigo,
                    denominacion=row['denominacion'],
                    marca=row['marca'],
                    modelo=row['modelo'],
                    serie=serie_val,
                    estado=row['estado'],
                    responsable=row['responsable'],
                    usuario_registro=row['usuario_registro'],
                    ubicacion_texto=row['ubicacion_texto'],
                    observaciones=row['observaciones'],
                    cal_2020=row['cal_2020'],
                    cal_2021=row['cal_2021'],
                    cal_2022=row['cal_2022'],
                    cal_2023=row['cal_2023'],
                    cal_2024=row['cal_2024'],
                    cal_2025=cal_2025_val,
                    sede_id=sede_id,
                    unidad_id=unidad_id,
                    fecha_registro=datetime.now()
                )

                db.session.add(nuevo_bien)
                stats['insertados'] += 1

                # Commit cada 100 registros
                if idx % 100 == 0:
                    db.session.commit()
                    pct = int(idx / len(bienes_faltantes) * 100)
                    print(f"  {idx}/{len(bienes_faltantes)} ({pct}%) - Insertados: {stats['insertados']}, Errores: {stats['errores']}")

            except Exception as e:
                db.session.rollback()
                stats['errores'] += 1
                if stats['errores'] <= 10:
                    print(f"  [ERROR] {codigo}: {str(e)[:80]}")

        # Commit final
        db.session.commit()

        # Resumen
        print("\n" + "="*70)
        print("RECUPERACIÓN COMPLETADA")
        print("="*70)
        print(f"  Bienes faltantes encontrados: {len(bienes_faltantes)}")
        print(f"  Bienes insertados:            {stats['insertados']}")
        print(f"  Errores:                      {stats['errores']}")

        # Verificación
        total_final = Bien.query.count()
        con_cal_final = Bien.query.filter(Bien.cal_2025.isnot(None)).count()
        print(f"\n  Total en PostgreSQL ANTES:    12,158")
        print(f"  Total en PostgreSQL AHORA:    {total_final}")
        print(f"  Diferencia:                   {total_final - 12158}")
        print(f"\n  CAL 2025 ANTES:               2,312")
        print(f"  CAL 2025 AHORA:               {con_cal_final}")
        print(f"  Diferencia CAL 2025:          {con_cal_final - 2312}")

        avance_actual = (con_cal_final / total_final * 100) if total_final > 0 else 0
        print(f"\n  AVANCE ACTUAL:                {avance_actual:.2f}%")

        if total_final >= 12800:
            print("\n[OK] RECUPERACION EXITOSA - Todos los bienes recuperados")
        else:
            print(f"\n[ADVERTENCIA] Faltaron {len(bienes_faltantes) - stats['insertados']} bienes por recuperar")

        print("="*70 + "\n")

    except Exception as e:
        print(f"ERROR FATAL: {str(e)}")
        import traceback
        traceback.print_exc()
    finally:
        cursor.close()
        conn_sqlite.close()
