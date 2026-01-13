#!/usr/bin/env python3
"""
Revisar tabla historial y logs de inventario para encontrar registros de SUPE
"""

import sys
import os
from datetime import datetime, timedelta

sys.path.insert(0, '/home/patrimonio/control_patrimonial')
os.chdir('/home/patrimonio/control_patrimonial')

from wsgi import app
from app import db
from sqlalchemy import text

print("\n" + "="*90)
print("INVESTIGACIÓN: TABLA 'historial' Y LOGS DE INVENTARIO")
print("="*90)

with app.app_context():
    # ========================================================================
    # 1. REVISAR TABLA 'historial'
    # ========================================================================
    print("\n1. TABLA 'historial' - ÚLTIMOS CAMBIOS:")
    print("-" * 90)

    try:
        # Ver estructura
        historial_data = db.session.execute(text("""
            SELECT column_name, data_type
            FROM information_schema.columns
            WHERE table_name = 'historial'
            ORDER BY ordinal_position
        """)).fetchall()

        print(f"  Columnas: {', '.join([col[0] for col in historial_data])}")

        # Contar registros
        total_historial = db.session.execute(text("SELECT COUNT(*) FROM historial")).scalar()
        print(f"  Total registros: {total_historial}")

        # Últimos cambios
        print("\n  ÚLTIMOS 30 CAMBIOS REGISTRADOS:")
        print("  " + "-" * 85)

        historial_rows = db.session.execute(text("""
            SELECT * FROM historial
            ORDER BY fecha DESC
            LIMIT 30
        """)).fetchall()

        if historial_rows:
            # Detectar columnas dinámicamente
            col_names = [col[0] for col in historial_data]
            print(f"  {'Fecha':<20} {'Bien ID':<10} {'Acción':<15} {'Usuario':<25}")
            print("  " + "-" * 85)

            for row in historial_rows:
                row_dict = {}
                for i, col in enumerate(col_names):
                    row_dict[col] = row[i]

                fecha = str(row_dict.get('fecha', 'N/A'))[:19]
                bien_id = row_dict.get('bien_id', 'N/A')
                accion = row_dict.get('accion', 'N/A')
                usuario = row_dict.get('usuario', 'N/A')

                print(f"  {fecha:<20} {str(bien_id):<10} {str(accion):<15} {str(usuario):<25}")

        # Cambios específicamente de SUPE
        print("\n  CAMBIOS ESPECÍFICOS DE SUPE:")
        print("  " + "-" * 85)

        try:
            supe_changes = db.session.execute(text("""
                SELECT h.* FROM historial h
                JOIN bienes b ON h.bien_id = b.id
                JOIN sedes s ON b.sede_id = s.id
                WHERE s.nombre LIKE '%SUPE%'
                ORDER BY h.fecha DESC
                LIMIT 20
            """)).fetchall()

            if supe_changes:
                print(f"  Cambios encontrados en SUPE: {len(supe_changes)}")
                for row in supe_changes:
                    print(f"    {row}")
            else:
                print("  ✗ No hay cambios registrados de SUPE en historial")
        except Exception as e:
            print(f"  Error: {e}")

    except Exception as e:
        print(f"  Error al revisar historial: {e}")

    # ========================================================================
    # 2. REVISAR LOGS DE INVENTARIO
    # ========================================================================
    print("\n2. ARCHIVO LOG: inventario.log")
    print("-" * 90)

    log_path = '/home/patrimonio/control_patrimonial/logs/inventario.log'
    if os.path.exists(log_path):
        with open(log_path, 'r') as f:
            lines = f.readlines()

        print(f"  Total líneas: {len(lines)}")
        print(f"  Últimas 50 líneas (posible registro de SUPE ayer):")
        print("  " + "-" * 85)

        for line in lines[-50:]:
            print(f"  {line.rstrip()}")
    else:
        print(f"  ✗ Archivo no encontrado: {log_path}")

    # ========================================================================
    # 3. REVISAR LOG DE LA APLICACIÓN
    # ========================================================================
    print("\n3. ARCHIVO LOG: app.log (últimas 100 líneas con 'SUPE' o 'CAL 2025')")
    print("-" * 90)

    app_log_path = '/home/patrimonio/control_patrimonial/logs/app.log'
    if os.path.exists(app_log_path):
        with open(app_log_path, 'r') as f:
            lines = f.readlines()

        # Buscar líneas relevantes
        relevant_lines = []
        for line in lines:
            if any(keyword in line.upper() for keyword in ['SUPE', 'CAL 2025', 'ERROR', 'INVENTARIO']):
                relevant_lines.append(line)

        if relevant_lines:
            print(f"  Líneas relevantes encontradas: {len(relevant_lines)}")
            print("  Últimas 20:")
            print("  " + "-" * 85)
            for line in relevant_lines[-20:]:
                print(f"  {line.rstrip()}")
        else:
            print(f"  ✗ No hay líneas relevantes sobre SUPE o CAL 2025")

    else:
        print(f"  ✗ Archivo no encontrado: {app_log_path}")

    # ========================================================================
    # 4. ESTADÍSTICAS FINALES
    # ========================================================================
    print("\n4. ESTADÍSTICAS DE CAMBIOS EN LAS ÚLTIMAS 24 HORAS:")
    print("-" * 90)

    try:
        from app.models_sqlalchemy import Bien, Sede

        ayer = datetime.now() - timedelta(days=1)

        # Cambios de SUPE
        total_cambios_supe = Bien.query.filter_by(sede_id=5).filter(
            Bien.fecha_registro >= ayer
        ).count()

        # Cambios globales
        total_cambios_global = Bien.query.filter(
            Bien.fecha_registro >= ayer
        ).count()

        print(f"  Total cambios globales en últimas 24h: {total_cambios_global}")
        print(f"  Cambios en SUPE: {total_cambios_supe}")

        # Cambios con CAL 2025
        cambios_con_cal = Bien.query.filter(
            Bien.fecha_registro >= ayer,
            Bien.cal_2025.isnot(None),
            Bien.cal_2025 != ''
        ).count()

        print(f"  Cambios con CAL 2025: {cambios_con_cal}")

    except Exception as e:
        print(f"  Error: {e}")

print("\n" + "="*90 + "\n")
