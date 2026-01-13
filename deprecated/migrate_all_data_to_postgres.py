#!/usr/bin/env python3
"""
Script de migración COMPLETA de SQLite a PostgreSQL
Migra: Sedes, Unidades y Bienes
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
print("MIGRACIÓN COMPLETA: SQLite → PostgreSQL")
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
            'bienes_actualizados': 0,
            'errores': 0
        }

        # ====================
        # PASO 1: MIGRAR SEDES
        # ====================
        print("\nPASO 1: Migrando Sedes...")
        cursor.execute("SELECT * FROM sedes")
        sedes_sqlite = cursor.fetchall()

        for row in sedes_sqlite:
            try:
                sede_id = row['id']

                # Verificar si ya existe
                sede_exists = Sede.query.filter_by(id=sede_id).first()

                if not sede_exists:
                    nueva_sede = Sede(
                        id=row['id'],
                        nombre=row['nombre']
                    )
                    db.session.add(nueva_sede)
                    stats['sedes_insertadas'] += 1
                    print(f"  ✓ Sede {sede_id}: {row['nombre']}")

            except Exception as e:
                print(f"  ✗ Error sede {sede_id}: {str(e)}")
                stats['errores'] += 1

        db.session.commit()
        print(f"\nSedes migradas: {stats['sedes_insertadas']}")

        # ====================
        # PASO 2: MIGRAR UNIDADES
        # ====================
        print("\nPASO 2: Migrando Unidades...")
        cursor.execute("SELECT * FROM unidades")
        unidades_sqlite = cursor.fetchall()

        for row in unidades_sqlite:
            try:
                unidad_id = row['id']

                # Verificar si ya existe
                unidad_exists = Unidad.query.filter_by(id=unidad_id).first()

                if not unidad_exists:
                    nueva_unidad = Unidad(
                        id=row['id'],
                        nombre=row['nombre']
                    )
                    db.session.add(nueva_unidad)
                    stats['unidades_insertadas'] += 1
                    print(f"  ✓ Unidad {unidad_id}: {row['nombre']}")

            except Exception as e:
                print(f"  ✗ Error unidad {unidad_id}: {str(e)}")
                stats['errores'] += 1

        db.session.commit()
        print(f"\nUnidades migradas: {stats['unidades_insertadas']}")

        # ====================
        # PASO 3: MIGRAR BIENES
        # ====================
        print("\nPASO 3: Migrando Bienes...")
        cursor.execute("SELECT * FROM bienes")
        bienes_sqlite = cursor.fetchall()

        total_bienes = len(bienes_sqlite)
        print(f"Total de bienes a migrar: {total_bienes}\n")

        for idx, row in enumerate(bienes_sqlite, 1):
            try:
                codigo = row['codigo_patrimonial']

                # Verificar si ya existe
                bien_exists = Bien.query.filter_by(codigo_patrimonial=codigo).first()

                if bien_exists:
                    # Actualizar
                    bien_exists.denominacion = row['denominacion']
                    bien_exists.marca = row['marca']
                    bien_exists.modelo = row['modelo']
                    bien_exists.serie = row['serie']
                    bien_exists.estado = row['estado']
                    bien_exists.responsable = row['responsable']
                    bien_exists.usuario_registro = row['usuario_registro']
                    bien_exists.ubicacion_texto = row['ubicacion_texto']
                    bien_exists.observaciones = row['observaciones']
                    bien_exists.cal_2020 = row['cal_2020']
                    bien_exists.cal_2021 = row['cal_2021']
                    bien_exists.cal_2022 = row['cal_2022']
                    bien_exists.cal_2023 = row['cal_2023']
                    bien_exists.cal_2024 = row['cal_2024']
                    bien_exists.cal_2025 = row['cal_2025']
                    bien_exists.sede_id = row['sede_id']
                    bien_exists.unidad_id = row['unidad_id']

                    stats['bienes_actualizados'] += 1
                else:
                    # Insertar nuevo
                    nuevo_bien = Bien(
                        codigo_patrimonial=row['codigo_patrimonial'],
                        denominacion=row['denominacion'],
                        marca=row['marca'],
                        modelo=row['modelo'],
                        serie=row['serie'],
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
                        cal_2025=row['cal_2025'],
                        sede_id=row['sede_id'],
                        unidad_id=row['unidad_id'],
                        fecha_registro=datetime.now()
                    )

                    db.session.add(nuevo_bien)
                    stats['bienes_insertados'] += 1

                # Commit cada 500 registros
                if idx % 500 == 0:
                    db.session.commit()
                    print(f"  Procesados: {idx}/{total_bienes} ({int(idx/total_bienes*100)}%)")

            except Exception as e:
                db.session.rollback()
                print(f"  ✗ Error bien {codigo}: {str(e)[:100]}")
                stats['errores'] += 1

        # Commit final
        db.session.commit()

        # ====================
        # RESUMEN
        # ====================
        print("\n" + "="*70)
        print("MIGRACIÓN COMPLETADA")
        print("="*70)
        print(f"  Sedes insertadas:       {stats['sedes_insertadas']}")
        print(f"  Unidades insertadas:    {stats['unidades_insertadas']}")
        print(f"  Bienes insertados:      {stats['bienes_insertados']}")
        print(f"  Bienes actualizados:    {stats['bienes_actualizados']}")
        print(f"  Errores:                {stats['errores']}")

        # Verificación final
        total_final = Bien.query.count()
        print(f"\n  Total bienes en PostgreSQL: {total_final}")
        print("="*70 + "\n")

    except Exception as e:
        db.session.rollback()
        print(f"\nERROR FATAL: {str(e)}")
        import traceback
        traceback.print_exc()
        sys.exit(1)
    finally:
        conn_sqlite.close()
