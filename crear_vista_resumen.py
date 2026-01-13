#!/usr/bin/env python3
"""
Script para crear la vista vw_resumen_inventario en PostgreSQL
Esta vista es necesaria para mostrar el avance del inventario
"""

import sys
import os
sys.path.insert(0, '/home/patrimonio/control_patrimonial')
os.chdir('/home/patrimonio/control_patrimonial')

from wsgi import app
from app import db
from sqlalchemy import text

print("\n" + "="*70)
print("CREAR VISTA vw_resumen_inventario")
print("="*70 + "\n")

with app.app_context():
    try:
        # Primero, eliminar la vista si existe
        try:
            db.session.execute(text('DROP VIEW IF EXISTS vw_resumen_inventario CASCADE'))
            db.session.commit()
            print("[✓] Vista antigua eliminada (si existía)")
        except:
            pass

        # Crear la nueva vista
        # Esta vista agrupa por usuario_registro/responsable y calcula avance basado en CAL 2025
        view_sql = """
        CREATE OR REPLACE VIEW vw_resumen_inventario AS
        SELECT
            usuario_registro AS usuario_registro,
            responsable AS nombre,
            'OPERADOR' AS rol,
            COUNT(*) AS total_registrados,
            COUNT(CASE WHEN cal_2025 IS NOT NULL AND cal_2025 != '' THEN 1 END) AS inventariados,
            0 AS subidos_siga,
            COUNT(*) - COUNT(CASE WHEN cal_2025 IS NOT NULL AND cal_2025 != '' THEN 1 END) AS pendientes_siga,
            CASE
                WHEN COUNT(*) = 0 THEN 0.0
                ELSE ROUND((COUNT(CASE WHEN cal_2025 IS NOT NULL AND cal_2025 != '' THEN 1 END)::NUMERIC / COUNT(*)) * 100, 2)
            END AS porcentaje_completado
        FROM bienes
        WHERE usuario_registro IS NOT NULL
        GROUP BY usuario_registro, responsable
        ORDER BY inventariados DESC
        """

        db.session.execute(text(view_sql))
        db.session.commit()
        print("[✓] Vista vw_resumen_inventario creada exitosamente\n")

        # Verificar que la vista funciona
        result = db.session.execute(text('SELECT COUNT(*) FROM vw_resumen_inventario')).fetchone()
        print(f"[✓] Vista contiene {result[0]} filas de resumen\n")

        # Mostrar algunas filas de ejemplo
        print("Primeras 5 filas de la vista:")
        print("-" * 70)
        rows = db.session.execute(text("""
            SELECT usuario_registro, nombre, total_registrados, inventariados, porcentaje_completado
            FROM vw_resumen_inventario
            LIMIT 5
        """)).fetchall()

        for row in rows:
            print(f"  {row[0]:<20} {row[1]:<30} Total: {row[2]:<5} Inv: {row[3]:<5} Avance: {row[4]}%")

        print("\n" + "="*70)
        print("[✓] VISTA CREADA CORRECTAMENTE")
        print("="*70 + "\n")

    except Exception as e:
        print(f"[ERROR] {str(e)}\n")
        import traceback
        traceback.print_exc()
        db.session.rollback()
