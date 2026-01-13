#!/usr/bin/env python3
"""
Crear vista vw_resumen_inventario - VERSION 2
Agrupa por responsable (no por usuario_registro que está vacío)
"""

import sys
import os
sys.path.insert(0, '/home/patrimonio/control_patrimonial')
os.chdir('/home/patrimonio/control_patrimonial')

from wsgi import app
from app import db
from sqlalchemy import text

print("\n" + "="*70)
print("CREAR VISTA vw_resumen_inventario v2")
print("="*70 + "\n")

with app.app_context():
    try:
        # Eliminar la vista anterior
        try:
            db.session.execute(text('DROP VIEW IF EXISTS vw_resumen_inventario CASCADE'))
            db.session.commit()
        except:
            pass

        # Crear la nueva vista agrupando por responsable
        # El usuario_registro está vacío, así que usamos responsable como identificador
        view_sql = """
        CREATE VIEW vw_resumen_inventario AS
        SELECT
            responsable AS usuario_registro,
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
        WHERE responsable IS NOT NULL AND responsable != ''
        GROUP BY responsable
        ORDER BY inventariados DESC
        """

        db.session.execute(text(view_sql))
        db.session.commit()
        print("[✓] Vista vw_resumen_inventario creada exitosamente\n")

        # Verificar que la vista funciona
        result = db.session.execute(text('SELECT COUNT(*) FROM vw_resumen_inventario')).fetchone()
        print(f"[✓] Vista contiene {result[0]} filas de resumen\n")

        # Mostrar algunas filas
        print("Primeras 10 responsables con su avance:")
        print("-" * 90)
        print(f"{'Responsable':<35} {'Total':<8} {'Inv':<8} {'Avance %':<10}")
        print("-" * 90)

        rows = db.session.execute(text("""
            SELECT nombre, total_registrados, inventariados, porcentaje_completado
            FROM vw_resumen_inventario
            LIMIT 10
        """)).fetchall()

        for row in rows:
            print(f"{row[0]:<35} {row[1]:<8} {row[2]:<8} {row[3]:<10}")

        # Mostrar totales globales
        print("\n" + "-" * 90)
        total_result = db.session.execute(text("""
            SELECT
                SUM(total_registrados) as total,
                SUM(inventariados) as inventariados,
                ROUND((SUM(inventariados)::NUMERIC / SUM(total_registrados)) * 100, 2) as avance_global
            FROM vw_resumen_inventario
        """)).fetchone()

        print(f"{'TOTAL GLOBAL':<35} {total_result[0]:<8} {total_result[1]:<8} {total_result[2]:<10}")

        print("\n" + "="*70)
        print("[✓] VISTA CREADA CORRECTAMENTE")
        print("="*70 + "\n")

    except Exception as e:
        print(f"[ERROR] {str(e)}\n")
        import traceback
        traceback.print_exc()
        db.session.rollback()
