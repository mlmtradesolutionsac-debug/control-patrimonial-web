#!/usr/bin/env python3
"""
BÚSQUEDA PROFUNDA: Tablas temporales, registros de cambios, formularios pendientes
"""

import sys
import os
import json
from datetime import datetime, timedelta

sys.path.insert(0, '/home/patrimonio/control_patrimonial')
os.chdir('/home/patrimonio/control_patrimonial')

from wsgi import app
from app import db
from sqlalchemy import text, inspect

print("\n" + "="*90)
print("BÚSQUEDA PROFUNDA: TABLAS TEMPORALES Y REGISTROS EN POSTGRESQL")
print("="*90)

with app.app_context():
    inspector = inspect(db.engine)

    # ============================================================================
    # 1. TODAS LAS TABLAS EN POSTGRESQL
    # ============================================================================
    print("\n1. TODAS LAS TABLAS EN POSTGRESQL:")
    print("-" * 90)

    all_tables = inspector.get_table_names()
    print(f"  Total tablas: {len(all_tables)}")
    print(f"  Tablas: {', '.join(sorted(all_tables))}")

    # ============================================================================
    # 2. BUSCAR TABLAS TEMPORALES, LOGS, O QUE CONTENGAN 'INVENTARIO'
    # ============================================================================
    print("\n2. TABLAS TEMPORALES, LOGS O RELACIONADAS A INVENTARIO:")
    print("-" * 90)

    temp_keywords = ['temp', 'tmp', 'log', 'inventario', 'draft', 'pending', 'sync', 'queue']
    found_temp = False

    for table in all_tables:
        if any(keyword in table.lower() for keyword in temp_keywords):
            found_temp = True
            print(f"  ✓ Tabla: {table}")

            # Contar registros
            try:
                result = db.session.execute(text(f"SELECT COUNT(*) FROM {table}")).scalar()
                print(f"    Registros: {result}")

                # Si tiene registros, mostrar primeros 5
                if result > 0:
                    try:
                        columns = inspector.get_columns(table)
                        col_names = [col['name'] for col in columns]

                        query = f"SELECT {', '.join(col_names[:5])} FROM {table} LIMIT 5"
                        rows = db.session.execute(text(query)).fetchall()
                        print(f"    Primeros registros:")
                        for row in rows:
                            print(f"      {row}")
                    except Exception as e:
                        print(f"    Error al leer datos: {e}")
            except Exception as e:
                print(f"    Error: {e}")

    if not found_temp:
        print("  ✗ No se encontraron tablas temporales")

    # ============================================================================
    # 3. TABLA 'bienes' - Revisión completa
    # ============================================================================
    print("\n3. TABLA 'bienes' - ANÁLISIS COMPLETO:")
    print("-" * 90)

    try:
        from app.models_sqlalchemy import Bien

        # Columnas disponibles
        columns = inspector.get_columns('bienes')
        print(f"  Total columnas: {len(columns)}")

        # Buscar columnas que puedan tener datos temporales
        print("\n  Columnas con valores NULL o vacíos:")
        for col in columns:
            col_name = col['name']
            try:
                # Contar NULL
                null_count = db.session.execute(
                    text(f"SELECT COUNT(*) FROM bienes WHERE {col_name} IS NULL")
                ).scalar()

                # Contar vacíos
                empty_count = db.session.execute(
                    text(f"SELECT COUNT(*) FROM bienes WHERE {col_name} = ''")
                ).scalar()

                total = null_count + empty_count
                if total > 100:  # Solo mostrar si hay muchos
                    print(f"    {col_name}: NULL={null_count}, Vacíos={empty_count}, Total={total}")
            except:
                pass

        # Bienes sin CAL 2025 en SUPE
        print("\n  Bienes SUPE más recientes (sin CAL 2025):")
        print("  " + "-" * 85)

        result = db.session.execute(text("""
            SELECT b.id, b.codigo_patrimonial, b.denominacion, b.responsable,
                   b.fecha_registro, b.cal_2025
            FROM bienes b
            JOIN sedes s ON b.sede_id = s.id
            WHERE s.nombre LIKE '%SUPE%'
            ORDER BY b.fecha_registro DESC
            LIMIT 10
        """)).fetchall()

        print(f"  {'ID':<8} {'Código':<20} {'Denominación':<35} {'Responsable':<25} {'Fecha':<20}")
        print("  " + "-" * 130)

        for row in result:
            fecha = str(row[4])[:19] if row[4] else 'N/A'
            print(f"  {row[0]:<8} {(row[1][:18] if row[1] else 'N/A'):<20} {(row[2][:33] if row[2] else 'N/A'):<35} {(row[3][:23] if row[3] else 'N/A'):<25} {fecha:<20}")

    except Exception as e:
        print(f"  Error: {e}")

    # ============================================================================
    # 4. REVISAR TABLA 'alembic_version' (migraciones)
    # ============================================================================
    print("\n4. MIGRACIONES DE BASE DE DATOS:")
    print("-" * 90)

    try:
        version = db.session.execute(text("SELECT version_num FROM alembic_version")).scalar()
        print(f"  ✓ Última migración: {version}")
    except:
        print("  ✗ No hay tabla de migraciones")

    # ============================================================================
    # 5. REVISAR LOGS EN APLICACIÓN
    # ============================================================================
    print("\n5. BÚSQUEDA EN ARCHIVOS DE APLICACIÓN:")
    print("-" * 90)

    # Buscar archivos de sesión o formularios temporales
    app_temp_locations = [
        '/home/patrimonio/control_patrimonial/tmp',
        '/home/patrimonio/control_patrimonial/uploads',
        '/home/patrimonio/control_patrimonial/logs',
        '/home/patrimonio/control_patrimonial/sessions',
        '/tmp/control_patrimonial'
    ]

    for location in app_temp_locations:
        if os.path.isdir(location):
            files = os.listdir(location)
            if files:
                print(f"\n  ✓ {location}/")
                recent_files = sorted(files, key=lambda x: os.path.getmtime(os.path.join(location, x)), reverse=True)[:5]
                for file in recent_files:
                    file_path = os.path.join(location, file)
                    mod_time = datetime.fromtimestamp(os.path.getmtime(file_path))
                    size = os.path.getsize(file_path) / 1024  # KB
                    print(f"    {file:<40} ({size:.1f} KB) - {mod_time}")

    # ============================================================================
    # 6. ESTADÍSTICAS FINALES DETALLADAS
    # ============================================================================
    print("\n6. ESTADÍSTICAS FINALES DETALLADAS:")
    print("-" * 90)

    stats = db.session.execute(text("""
        SELECT
            COUNT(*) as total_bienes,
            COUNT(CASE WHEN cal_2025 IS NOT NULL AND cal_2025 != '' THEN 1 END) as con_cal_2025,
            COUNT(CASE WHEN cal_2025 IS NULL OR cal_2025 = '' THEN 1 END) as sin_cal_2025
        FROM bienes
    """)).fetchone()

    print(f"  Total bienes en BD:           {stats[0]:,}")
    print(f"  Con CAL 2025:                 {stats[1]:,}")
    print(f"  Sin CAL 2025:                 {stats[2]:,}")
    print(f"  Avance actual:                {(stats[1]/stats[0]*100) if stats[0] > 0 else 0:.2f}%")

    # Por sede
    print("\n  DESGLOSE POR SEDE:")
    print("-" * 90)

    from app.models_sqlalchemy import Sede
    from sqlalchemy import func

    sede_stats = db.session.execute(text("""
        SELECT
            s.nombre,
            COUNT(b.id) as total,
            COUNT(CASE WHEN b.cal_2025 IS NOT NULL AND b.cal_2025 != '' THEN 1 END) as con_cal,
            MAX(b.fecha_registro) as ultima_mod
        FROM bienes b
        JOIN sedes s ON b.sede_id = s.id
        GROUP BY s.nombre
        ORDER BY total DESC
    """)).fetchall()

    print(f"  {'Sede':<40} {'Bienes':<10} {'CAL 2025':<10} {'Última modificación':<20}")
    print("  " + "-" * 85)

    for sede_name, total, con_cal, ultima_mod in sede_stats:
        porcentaje = (con_cal / total * 100) if total > 0 else 0
        fecha_mod = str(ultima_mod)[:19] if ultima_mod else 'N/A'
        marker = ">>>" if 'supe' in sede_name.lower() else "   "
        print(f"  {marker} {sede_name:<37} {total:>10} {con_cal:>10} {fecha_mod:<20}")

print("\n" + "="*90 + "\n")
