#!/usr/bin/env python3
"""
Sincroniza los datos del Excel a la BD PostgreSQL en Google Cloud
Usando Cloud SQL Python Connector
"""

import asyncio
from cloud_sql_python_connector import Connector
import psycopg2
from psycopg2 import sql

async def main():
    print("="*80)
    print("SINCRONIZACION A POSTGRESQL EN GOOGLE CLOUD")
    print("="*80)

    # Configuración
    project_id = "steam-outlet-480502-d7"
    instance_connection_name = "steam-outlet-480502-d7:us-central1:patrimonio-sql-v1"
    db_user = "control_patrimonial"
    db_name = "control_patrimonial"
    db_password = "Control2025"

    try:
        # Crear conector
        connector = Connector(project_id=project_id)

        # Obtener conexión
        print("\nConectando a PostgreSQL en Google Cloud...")
        conn = await connector.getconn(
            instance_connection_name,
            "psycopg2",
            user=db_user,
            password=db_password,
            db=db_name
        )

        cursor = conn.cursor()

        # Verificar conexión
        cursor.execute("SELECT version();")
        version = cursor.fetchone()
        print(f"[OK] Conectado a PostgreSQL")
        print(f"Versión: {version[0][:50]}...\n")

        # Obtener estadísticas antes
        cursor.execute("SELECT COUNT(*) FROM bienes")
        bienes_antes = cursor.fetchone()[0]
        cursor.execute("SELECT COUNT(*) FROM bienes WHERE cal_2025 IS NOT NULL")
        con_cal_antes = cursor.fetchone()[0]

        print("Estado ANTES:")
        print(f"  Total bienes: {bienes_antes}")
        print(f"  Con CAL 2025: {con_cal_antes}")

        # Leer el archivo SQL
        print("\nLeyendo archivo SQL...")
        with open(r"E:\PROYECTOS WEB\control_patrimonial_web\sync_to_cloud.sql", 'r', encoding='utf-8') as f:
            sql_content = f.read()

        # Ejecutar el SQL
        print("Ejecutando sincronización...")
        print("(Esto puede tomar un tiempo...)\n")

        cursor.execute(sql_content)
        conn.commit()

        # Obtener estadísticas después
        cursor.execute("SELECT COUNT(*) FROM bienes")
        bienes_despues = cursor.fetchone()[0]
        cursor.execute("SELECT COUNT(*) FROM bienes WHERE cal_2025 IS NOT NULL")
        con_cal_despues = cursor.fetchone()[0]

        print("\n" + "="*80)
        print("RESULTADOS")
        print("="*80)
        print("\nEstado ANTES:")
        print(f"  Total bienes: {bienes_antes}")
        print(f"  Con CAL 2025: {con_cal_antes}")

        print("\nEstado DESPUES:")
        print(f"  Total bienes: {bienes_despues}")
        print(f"  Con CAL 2025: {con_cal_despues}")

        print("\nCambios:")
        print(f"  Bienes agregados: {bienes_despues - bienes_antes}")
        print(f"  CAL 2025 agregados: {con_cal_despues - con_cal_antes}")

        cursor.close()
        conn.close()

        print("\n[OK] Sincronizacion completada exitosamente")

    except Exception as e:
        print(f"[ERROR] {e}")
        import traceback
        traceback.print_exc()

if __name__ == '__main__':
    asyncio.run(main())
