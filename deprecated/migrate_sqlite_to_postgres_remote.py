#!/usr/bin/env python3
"""
Script de migración: SQLite local -> PostgreSQL remoto
Se ejecuta en la máquina local (Windows) y migra a servidor remoto
"""

import sqlite3
import psycopg2
from datetime import datetime
import os

# ================ CONFIGURACIÓN ================
SQLITE_PATH = r'E:\PROYECTOS WEB\control_patrimonial_web\data\inventario_patrimonial.db'

# PostgreSQL remoto
PG_HOST = '10.28.106.250'
PG_PORT = 5432
PG_DATABASE = 'control_patrimonial'
PG_USER = 'control_patrimonial'
PG_PASSWORD = 'T1C050p06769077'

print("\n" + "="*70)
print("MIGRACION: SQLite local a PostgreSQL remoto")
print("="*70)
print(f"SQLite:     {SQLITE_PATH}")
print(f"PostgreSQL: {PG_USER}@{PG_HOST}:{PG_PORT}/{PG_DATABASE}")
print("="*70 + "\n")

# Verificar SQLite
if not os.path.exists(SQLITE_PATH):
    print(f"ERROR: No existe {SQLITE_PATH}")
    exit(1)

print("Conectando a SQLite...")
conn_sqlite = sqlite3.connect(SQLITE_PATH)
conn_sqlite.row_factory = sqlite3.Row
cursor_sqlite = conn_sqlite.cursor()

try:
    print("Conectando a PostgreSQL remoto...")
    conn_pg = psycopg2.connect(
        host=PG_HOST,
        port=PG_PORT,
        database=PG_DATABASE,
        user=PG_USER,
        password=PG_PASSWORD,
        connect_timeout=10,
        sslmode='disable'
    )
    cursor_pg = conn_pg.cursor()
    print("[OK] Conectado a PostgreSQL\n")

except Exception as e:
    print(f"[ERROR] Conectando a PostgreSQL: {str(e)}")
    print("\nVerifica:")
    print("  - Que el servidor PostgreSQL este corriendo")
    print("  - Que la contrasena sea correcta")
    print("  - Que el servidor 10.28.106.250 sea accesible")
    exit(1)

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
    print("PASO 1: Migrando Sedes...")
    cursor_sqlite.execute("SELECT * FROM sedes")
    sedes_sqlite = cursor_sqlite.fetchall()

    for row in sedes_sqlite:
        try:
            sede_id = row['id']
            nombre = row['nombre']

            # Verificar si ya existe
            cursor_pg.execute("SELECT id FROM sedes WHERE id = %s", (sede_id,))
            existe = cursor_pg.fetchone()

            if not existe:
                cursor_pg.execute(
                    "INSERT INTO sedes (id, nombre) VALUES (%s, %s)",
                    (sede_id, nombre)
                )
                stats['sedes_insertadas'] += 1
                print(f"  [OK] Sede {sede_id}: {nombre}")

        except Exception as e:
            print(f"  [ERROR] Error sede {sede_id}: {str(e)}")
            stats['errores'] += 1

    conn_pg.commit()
    print(f"[OK] Sedes migradas: {stats['sedes_insertadas']}\n")

    # ====================
    # PASO 2: MIGRAR UNIDADES
    # ====================
    print("PASO 2: Migrando Unidades...")
    cursor_sqlite.execute("SELECT * FROM unidades")
    unidades_sqlite = cursor_sqlite.fetchall()

    for row in unidades_sqlite:
        try:
            unidad_id = row['id']
            nombre = row['nombre']

            # Verificar si ya existe
            cursor_pg.execute("SELECT id FROM unidades WHERE id = %s", (unidad_id,))
            existe = cursor_pg.fetchone()

            if not existe:
                cursor_pg.execute(
                    "INSERT INTO unidades (id, nombre) VALUES (%s, %s)",
                    (unidad_id, nombre)
                )
                stats['unidades_insertadas'] += 1
                print(f"  [OK] Unidad {unidad_id}: {nombre}")

        except Exception as e:
            print(f"  [ERROR] Error unidad {unidad_id}: {str(e)}")
            stats['errores'] += 1

    conn_pg.commit()
    print(f"[OK] Unidades migradas: {stats['unidades_insertadas']}\n")

    # ====================
    # PASO 3: MIGRAR BIENES
    # ====================
    print("PASO 3: Migrando Bienes...")
    cursor_sqlite.execute("SELECT * FROM bienes")
    bienes_sqlite = cursor_sqlite.fetchall()

    total_bienes = len(bienes_sqlite)
    print(f"Total de bienes a migrar: {total_bienes}\n")

    for idx, row in enumerate(bienes_sqlite, 1):
        try:
            codigo = row['codigo_patrimonial']

            # Verificar si ya existe
            cursor_pg.execute(
                "SELECT id FROM bienes WHERE codigo_patrimonial = %s",
                (codigo,)
            )
            existe = cursor_pg.fetchone()

            if existe:
                # Actualizar
                cursor_pg.execute("""
                    UPDATE bienes SET
                        denominacion = %s,
                        marca = %s,
                        modelo = %s,
                        serie = %s,
                        estado = %s,
                        responsable = %s,
                        usuario_registro = %s,
                        ubicacion_texto = %s,
                        observaciones = %s,
                        codigo_siga_1 = %s,
                        cal_2020 = %s,
                        cal_2021 = %s,
                        cal_2022 = %s,
                        cal_2023 = %s,
                        cal_2024 = %s,
                        cal_2025 = %s,
                        sede_id = %s,
                        unidad_id = %s,
                        fecha_inventario = %s
                    WHERE codigo_patrimonial = %s
                """, (
                    row['denominacion'],
                    row['marca'],
                    row['modelo'],
                    row['serie'],
                    row['estado'],
                    row['responsable'],
                    row['usuario_registro'],
                    row['ubicacion_texto'],
                    row['observaciones'],
                    row['codigo_siga_1'],
                    row['cal_2020'],
                    row['cal_2021'],
                    row['cal_2022'],
                    row['cal_2023'],
                    row['cal_2024'],
                    row['cal_2025'],
                    row['sede_id'],
                    row['unidad_id'],
                    datetime.now(),
                    codigo
                ))
                stats['bienes_actualizados'] += 1
            else:
                # Insertar nuevo
                cursor_pg.execute("""
                    INSERT INTO bienes (
                        codigo_patrimonial, denominacion, marca, modelo, serie,
                        estado, responsable, usuario_registro, ubicacion_texto,
                        observaciones, codigo_siga_1, cal_2020, cal_2021, cal_2022,
                        cal_2023, cal_2024, cal_2025, sede_id, unidad_id, fecha_inventario
                    ) VALUES (
                        %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s,
                        %s, %s, %s, %s, %s, %s, %s, %s, %s
                    )
                """, (
                    row['codigo_patrimonial'],
                    row['denominacion'],
                    row['marca'],
                    row['modelo'],
                    row['serie'],
                    row['estado'],
                    row['responsable'],
                    row['usuario_registro'],
                    row['ubicacion_texto'],
                    row['observaciones'],
                    row['codigo_siga_1'],
                    row['cal_2020'],
                    row['cal_2021'],
                    row['cal_2022'],
                    row['cal_2023'],
                    row['cal_2024'],
                    row['cal_2025'],
                    row['sede_id'],
                    row['unidad_id'],
                    datetime.now()
                ))
                stats['bienes_insertados'] += 1

            # Commit cada 500 registros
            if idx % 500 == 0:
                conn_pg.commit()
                pct = int(idx / total_bienes * 100)
                print(f"  Procesados: {idx}/{total_bienes} ({pct}%)")

        except Exception as e:
            print(f"  [ERROR] Error bien {codigo}: {str(e)}")
            stats['errores'] += 1

    # Commit final
    conn_pg.commit()

    # ====================
    # RESUMEN
    # ====================
    print("\n" + "="*70)
    print("MIGRACION COMPLETADA EXITOSAMENTE")
    print("="*70)
    print(f"  Sedes insertadas:       {stats['sedes_insertadas']}")
    print(f"  Unidades insertadas:    {stats['unidades_insertadas']}")
    print(f"  Bienes insertados:      {stats['bienes_insertados']}")
    print(f"  Bienes actualizados:    {stats['bienes_actualizados']}")
    print(f"  Errores:                {stats['errores']}")

    # Verificación final
    cursor_pg.execute("SELECT COUNT(*) FROM bienes")
    total_final = cursor_pg.fetchone()[0]
    print(f"\n  Total bienes en PostgreSQL: {total_final}")
    print("="*70 + "\n")

except Exception as e:
    print(f"\nERROR: {str(e)}")
    import traceback
    traceback.print_exc()

finally:
    if cursor_sqlite:
        cursor_sqlite.close()
    if conn_sqlite:
        conn_sqlite.close()
    if cursor_pg:
        cursor_pg.close()
    if conn_pg:
        conn_pg.close()
