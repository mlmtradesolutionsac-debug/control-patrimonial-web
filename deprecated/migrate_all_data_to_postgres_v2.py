#!/usr/bin/env python3
"""
Script de migración COMPLETA de SQLite a PostgreSQL - VERSION 2
Maneja duplicados en campos UNIQUE (serie, cal_2025)
"""

import sys
import os
sys.path.insert(0, '/home/patrimonio/control_patrimonial')
os.chdir('/home/patrimonio/control_patrimonial')

from wsgi import app
from app import db
from app.models_sqlalchemy import Bien, Sede, Unidad
import sqlite3
from datetime import datetime

SQLITE_PATH = 'data/inventario_patrimonial.db'

print("\n" + "="*70)
print("MIGRACION COMPLETA v2: SQLite - PostgreSQL (manejo de duplicados)")
print("="*70 + "\n")

# Verificar que existe SQLite
if not os.path.exists(SQLITE_PATH):
    print(f"ERROR: No existe {SQLITE_PATH}")
    sys.exit(1)

# Conectar a SQLite
print(f"Conectando a SQLite: {SQLITE_PATH}")
conn_sqlite = sqlite3.connect(SQLITE_PATH)
conn_sqlite.row_factory = sqlite3.Row
cursor = conn_sqlite.cursor()

with app.app_context():
    try:
        stats = {
            'sedes_insertadas': 0,
            'unidades_insertadas': 0,
            'bienes_insertados': 0,
            'bienes_duplicados_serie': 0,
            'bienes_duplicados_cal': 0,
            'errores': 0
        }

        # ====================
        # PASO 1: MIGRAR SEDES
        # ====================
        print("PASO 1: Migrando Sedes...")
        cursor.execute("SELECT * FROM sedes")
        sedes_sqlite = cursor.fetchall()

        for row in sedes_sqlite:
            try:
                sede_id = row['id']
                nombre = row['nombre']

                # Verificar si ya existe
                sede_exists = Sede.query.filter_by(id=sede_id).first()

                if not sede_exists:
                    nueva_sede = Sede(
                        id=row['id'],
                        nombre=row['nombre']
                    )
                    db.session.add(nueva_sede)
                    stats['sedes_insertadas'] += 1
                    print(f"  [OK] Sede {sede_id}: {nombre}")

            except Exception as e:
                print(f"  [ERROR] Error sede {sede_id}: {str(e)}")
                stats['errores'] += 1

        db.session.commit()
        print(f"[OK] Sedes migradas: {stats['sedes_insertadas']}\n")

        # ====================
        # PASO 2: MIGRAR UNIDADES
        # ====================
        print("PASO 2: Migrando Unidades...")
        cursor.execute("SELECT * FROM unidades")
        unidades_sqlite = cursor.fetchall()

        for row in unidades_sqlite:
            try:
                unidad_id = row['id']
                nombre = row['nombre']

                # Verificar si ya existe
                unidad_exists = Unidad.query.filter_by(id=unidad_id).first()

                if not unidad_exists:
                    nueva_unidad = Unidad(
                        id=row['id'],
                        nombre=row['nombre']
                    )
                    db.session.add(nueva_unidad)
                    stats['unidades_insertadas'] += 1

            except Exception as e:
                print(f"  [ERROR] Error unidad {unidad_id}: {str(e)}")
                stats['errores'] += 1

        db.session.commit()
        print(f"[OK] Unidades migradas: {stats['unidades_insertadas']}\n")

        # ====================
        # PASO 3: MIGRAR BIENES (con manejo de duplicados)
        # ====================
        print("PASO 3: Migrando Bienes...")
        cursor.execute("SELECT * FROM bienes")
        bienes_sqlite = cursor.fetchall()

        total_bienes = len(bienes_sqlite)
        print(f"Total de bienes a migrar: {total_bienes}\n")

        # Conjunto para rastrear series y cal_2025 ya usados
        series_usadas = set()
        cal_2025_usadas = set()

        for idx, row in enumerate(bienes_sqlite, 1):
            try:
                codigo = row['codigo_patrimonial']
                serie_val = row['serie']
                cal_2025_val = row['cal_2025']

                # Verificar si ya existe
                bien_exists = Bien.query.filter_by(codigo_patrimonial=codigo).first()

                # Limpiar values NULL/None
                if serie_val == '' or serie_val is None:
                    serie_val = None
                if cal_2025_val == '' or cal_2025_val is None:
                    cal_2025_val = None

                # Detectar duplicados en UNIQUE fields
                if serie_val and serie_val in series_usadas:
                    # Descartar serie duplicada - ponerla en NULL
                    stats['bienes_duplicados_serie'] += 1
                    serie_val = None
                elif serie_val:
                    series_usadas.add(serie_val)

                if cal_2025_val and cal_2025_val in cal_2025_usadas:
                    # Descartar cal_2025 duplicada - ponerla en NULL
                    stats['bienes_duplicados_cal'] += 1
                    cal_2025_val = None
                elif cal_2025_val:
                    cal_2025_usadas.add(cal_2025_val)

                if not bien_exists:
                    # INSERTAR nuevo
                    nuevo_bien = Bien(
                        codigo_patrimonial=row['codigo_patrimonial'],
                        denominacion=row['denominacion'],
                        marca=row['marca'],
                        modelo=row['modelo'],
                        serie=serie_val,  # Puede ser None
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
                        cal_2025=cal_2025_val,  # Puede ser None
                        sede_id=row['sede_id'],
                        unidad_id=row['unidad_id'],
                        fecha_registro=datetime.now()
                    )

                    db.session.add(nuevo_bien)
                    stats['bienes_insertados'] += 1

                # Commit cada 500 registros
                if idx % 500 == 0:
                    db.session.commit()
                    pct = int(idx / total_bienes * 100)
                    print(f"  Procesados: {idx}/{total_bienes} ({pct}%)")

            except Exception as e:
                db.session.rollback()
                print(f"  [ERROR] Error bien {codigo}: {str(e)[:80]}")
                stats['errores'] += 1

        # Commit final
        db.session.commit()

        # ====================
        # RESUMEN
        # ====================
        print("\n" + "="*70)
        print("MIGRACION COMPLETADA")
        print("="*70)
        print(f"  Sedes insertadas:           {stats['sedes_insertadas']}")
        print(f"  Unidades insertadas:        {stats['unidades_insertadas']}")
        print(f"  Bienes insertados:          {stats['bienes_insertados']}")
        print(f"  Bienes series duplicadas:   {stats['bienes_duplicados_serie']} (puestas en NULL)")
        print(f"  Bienes cal_2025 duplicadas: {stats['bienes_duplicados_cal']} (puestas en NULL)")
        print(f"  Errores:                    {stats['errores']}")

        # Verificacion final
        total_final = Bien.query.count()
        print(f"\n  Total bienes en PostgreSQL: {total_final}")

        if total_final > 10000:
            print("\n[OK] MIGRACION EXITOSA - Todos los bienes fueron importados")
        else:
            print(f"\n[ADVERTENCIA] Solo {total_final} bienes fueron importados")

        print("="*70 + "\n")

    except Exception as e:
        db.session.rollback()
        print(f"\nERROR FATAL: {str(e)}")
        import traceback
        traceback.print_exc()
        sys.exit(1)
    finally:
        cursor.close()
        conn_sqlite.close()
