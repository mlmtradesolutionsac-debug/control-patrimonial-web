#!/usr/bin/env python3
"""
BÚSQUEDA EXHAUSTIVA: Bienes con CAL 2025 en TODAS las bases de datos
Busca en SQLite, PostgreSQL, archivos temporales, logs, etc.
"""

import sys
import os
import sqlite3
from datetime import datetime, timedelta
from pathlib import Path

sys.path.insert(0, '/home/patrimonio/control_patrimonial')
os.chdir('/home/patrimonio/control_patrimonial')

from wsgi import app
from app.models_sqlalchemy import Bien, Sede
from sqlalchemy import func, text

print("\n" + "="*90)
print("BÚSQUEDA EXHAUSTIVA: BIENES CON CAL 2025 EN SERVIDOR")
print("="*90)

# ============================================================================
# 1. POSTGRESQL (Base de datos actual de producción)
# ============================================================================
print("\n1. POSTGRESQL (Base de datos en producción):")
print("-" * 90)

with app.app_context():
    total_postgres = Bien.query.count()
    con_cal_postgres = Bien.query.filter(
        Bien.cal_2025.isnot(None),
        Bien.cal_2025 != ''
    ).count()

    # Bienes SUPE con CAL 2025
    sede_supe = Sede.query.filter(Sede.nombre.ilike('SUPE')).first()
    supe_con_cal = Bien.query.filter_by(sede_id=sede_supe.id).filter(
        Bien.cal_2025.isnot(None),
        Bien.cal_2025 != ''
    ).count() if sede_supe else 0

    print(f"  Total bienes:                 {total_postgres:,}")
    print(f"  Con CAL 2025:                 {con_cal_postgres:,}")
    print(f"  SUPE con CAL 2025:            {supe_con_cal:,}")

# ============================================================================
# 2. SQLITE (Desarrollo - puede tener datos diferentes)
# ============================================================================
print("\n2. SQLITE (Base de datos local/desarrollo):")
print("-" * 90)

sqlite_paths = [
    '/home/patrimonio/control_patrimonial/data/inventario_patrimonial.db',
    '/home/patrimonio/control_patrimonial/inventario_patrimonial.db',
    '/home/patrimonio/inventario_patrimonial.db',
    '/tmp/inventario_patrimonial.db'
]

sqlite_found = False
for sqlite_path in sqlite_paths:
    if os.path.exists(sqlite_path):
        sqlite_found = True
        print(f"  ✓ Encontrado: {sqlite_path}")
        try:
            conn = sqlite3.connect(sqlite_path)
            cursor = conn.cursor()

            # Contar bienes en SQLite
            cursor.execute("SELECT COUNT(*) FROM bienes")
            total_sqlite = cursor.fetchone()[0]

            # Contar con CAL 2025
            cursor.execute("""
                SELECT COUNT(*) FROM bienes
                WHERE cal_2025 IS NOT NULL AND cal_2025 != ''
            """)
            con_cal_sqlite = cursor.fetchone()[0]

            # Contar SUPE en SQLite
            cursor.execute("""
                SELECT COUNT(*) FROM bienes b
                JOIN sedes s ON b.sede_id = s.id
                WHERE s.nombre LIKE '%SUPE%'
                AND b.cal_2025 IS NOT NULL AND b.cal_2025 != ''
            """)
            supe_cal_sqlite = cursor.fetchone()[0]

            print(f"    Total bienes:             {total_sqlite:,}")
            print(f"    Con CAL 2025:             {con_cal_sqlite:,}")
            print(f"    SUPE con CAL 2025:        {supe_cal_sqlite:,}")

            # Si hay diferencia, investigar qué bienes están en SQLite pero NO en PostgreSQL
            if con_cal_sqlite > con_cal_postgres:
                print(f"\n    ⚠️ ALERTA: SQLite tiene {con_cal_sqlite - con_cal_postgres} BIENES MÁS con CAL 2025")
                print(f"       Investigando diferencia...")

                # Bienes con CAL 2025 en SQLite
                cursor.execute("""
                    SELECT codigo_patrimonial, cal_2025, responsable, denominacion
                    FROM bienes
                    WHERE cal_2025 IS NOT NULL AND cal_2025 != ''
                    ORDER BY codigo_patrimonial
                    LIMIT 20
                """)

                print(f"\n       Primeros 20 bienes CON CAL 2025 en SQLite:")
                print(f"       {'Código':<20} {'CAL 2025':<20} {'Responsable':<40}")
                print(f"       {'-'*80}")

                for row in cursor.fetchall():
                    print(f"       {row[0]:<20} {str(row[1]):<20} {(row[2][:38] if row[2] else 'N/A'):<40}")

            conn.close()
        except Exception as e:
            print(f"    Error al leer SQLite: {e}")

if not sqlite_found:
    print(f"  ✗ No se encontró SQLite en las rutas buscadas")

# ============================================================================
# 3. ARCHIVOS TEMPORALES Y RESPALDOS
# ============================================================================
print("\n3. ARCHIVOS TEMPORALES Y RESPALDOS:")
print("-" * 90)

backup_paths = [
    '/home/patrimonio/control_patrimonial',
    '/home/patrimonio/control_patrimonial/backups',
    '/home/patrimonio/control_patrimonial/data',
    '/tmp',
    '/home/patrimonio'
]

print("  Buscando archivos .db, .sql, .csv recientes...")

for backup_dir in backup_paths:
    if os.path.isdir(backup_dir):
        for file in os.listdir(backup_dir):
            if file.endswith(('.db', '.sql', '.csv')) and 'backup' in file.lower():
                full_path = os.path.join(backup_dir, file)
                mod_time = os.path.getmtime(full_path)
                mod_datetime = datetime.fromtimestamp(mod_time)
                size = os.path.getsize(full_path) / 1024 / 1024  # MB

                if (datetime.now() - mod_datetime).days <= 7:  # Últimos 7 días
                    print(f"\n  ✓ {file}")
                    print(f"    Ruta: {full_path}")
                    print(f"    Modificado: {mod_datetime}")
                    print(f"    Tamaño: {size:.2f} MB")

# ============================================================================
# 4. INVESTIGAR POSTGRESQL COMPLETAMENTE
# ============================================================================
print("\n4. INVESTIGACIÓN DETALLADA EN POSTGRESQL:")
print("-" * 90)

with app.app_context():
    # Bienes con CAL 2025 pero SIN SUPE
    print("\n  a) Bienes con CAL 2025 POR SEDE:")
    print("     " + "-" * 75)

    stats = Bien.query.with_entities(
        Sede.nombre,
        func.count(Bien.id).label('total'),
        func.count(func.nullif(Bien.cal_2025, '')).label('con_cal')
    ).join(Sede).group_by(Sede.nombre).order_by(
        func.count(func.nullif(Bien.cal_2025, '')).desc()
    ).all()

    print(f"     {'Sede':<40} {'Con CAL 2025':<15} {'% Avance':<10}")
    print("     " + "-" * 75)

    for sede_name, total, con_cal in stats:
        porcentaje = (con_cal / total * 100) if total > 0 else 0
        marker = ">>>" if 'supe' in sede_name.lower() else "   "
        if con_cal > 0:
            print(f"     {marker} {sede_name:<37} {con_cal:>15} {porcentaje:>9.1f}%")

    # Bienes agregados AYER con CAL 2025
    print("\n  b) Bienes CON CAL 2025 agregados en últimas 24h:")
    print("     " + "-" * 75)

    ayer = datetime.now() - timedelta(days=1)

    try:
        bienes_ayer_cal = Bien.query.filter(
            Bien.fecha_registro >= ayer,
            Bien.cal_2025.isnot(None),
            Bien.cal_2025 != ''
        ).count()

        print(f"     Bienes CON CAL 2025 agregados ayer: {bienes_ayer_cal}")

        if bienes_ayer_cal > 0:
            print("\n     Primeros 20:")
            print(f"     {'Código':<20} {'Sede':<30} {'Responsable':<35}")
            print("     " + "-" * 85)

            bienes = Bien.query.filter(
                Bien.fecha_registro >= ayer,
                Bien.cal_2025.isnot(None),
                Bien.cal_2025 != ''
            ).join(Sede).with_entities(
                Bien.codigo_patrimonial,
                Sede.nombre,
                Bien.responsable
            ).limit(20).all()

            for codigo, sede, resp in bienes:
                print(f"     {codigo:<20} {(sede[:28] if sede else 'N/A'):<30} {(resp[:33] if resp else 'N/A'):<35}")
    except Exception as e:
        print(f"     Error: {e}")

    # Bienes SUPE modificados AYER
    print("\n  c) Bienes SUPE modificados en últimas 24h:")
    print("     " + "-" * 75)

    sede_supe = Sede.query.filter(Sede.nombre.ilike('SUPE')).first()
    if sede_supe:
        bienes_supe_modified = Bien.query.filter_by(sede_id=sede_supe.id).filter(
            Bien.fecha_registro >= ayer
        ).count()

        print(f"     Bienes SUPE modificados ayer: {bienes_supe_modified}")

        # Ver cuáles tienen CAL 2025
        con_cal = Bien.query.filter_by(sede_id=sede_supe.id).filter(
            Bien.fecha_registro >= ayer,
            Bien.cal_2025.isnot(None),
            Bien.cal_2025 != ''
        ).count()

        print(f"     De esos, CON CAL 2025: {con_cal}")

# ============================================================================
# 5. LOGS DE LA APLICACIÓN
# ============================================================================
print("\n5. REVISIÓN DE LOGS:")
print("-" * 90)

log_files = [
    '/home/patrimonio/control_patrimonial/gunicorn.log',
    '/home/patrimonio/gunicorn.log',
    '/var/log/gunicorn.log'
]

for log_file in log_files:
    if os.path.exists(log_file):
        print(f"  ✓ Encontrado: {log_file}")
        # Mostrar últimas líneas
        os.system(f"echo '    Últimas 20 líneas:' && tail -20 {log_file} | sed 's/^/    /'")

# ============================================================================
# CONCLUSIÓN
# ============================================================================
print("\n" + "="*90)
print("RESUMEN DE BÚSQUEDA EXHAUSTIVA:")
print("="*90)

with app.app_context():
    total_pg = Bien.query.count()
    cal_pg = Bien.query.filter(Bien.cal_2025.isnot(None), Bien.cal_2025 != '').count()

    print(f"\n  PostgreSQL (Producción):")
    print(f"    ✓ Total bienes:       {total_pg:,}")
    print(f"    ✓ Con CAL 2025:       {cal_pg:,}")
    print(f"    ✓ Avance:             {(cal_pg/total_pg*100) if total_pg > 0 else 0:.2f}%")

    print(f"\n  Recomendación:")
    print(f"    Si SQLite tiene más CAL 2025, necesitamos:")
    print(f"    1. Importar esos registros a PostgreSQL")
    print(f"    2. Verificar si hay errores en la sincronización")
    print(f"    3. Contactar operadores para confirmar si capturaron datos")

print("\n" + "="*90 + "\n")
