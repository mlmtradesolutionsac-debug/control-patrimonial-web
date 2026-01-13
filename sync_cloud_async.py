#!/usr/bin/env python3
"""
Sincronización asíncrona a Cloud SQL usando Google Cloud SQL Python Connector
Este script puede ejecutarse localmente o en Cloud Run
"""

import asyncio
import psycopg2
from psycopg2 import sql
import os
import sys

async def main():
    print("="*80)
    print("SINCRONIZACION A CLOUD SQL POSTGRESQL")
    print("="*80)

    # Parámetros de conexión
    db_host = os.environ.get('DB_HOST', '35.222.111.223')
    db_port = int(os.environ.get('DB_PORT', 5432))
    db_name = os.environ.get('DB_NAME', 'control_patrimonial')
    db_user = os.environ.get('DB_USER', 'control_patrimonial')
    db_pass = os.environ.get('DB_PASS', 'Control2025')

    print(f"\nHost: {db_host}")
    print(f"BD: {db_name}")
    print(f"Usuario: {db_user}\n")

    try:
        # Leer el archivo SQL
        sql_file = r"E:\PROYECTOS WEB\control_patrimonial_web\sync_to_cloud.sql"

        if not os.path.exists(sql_file):
            print(f"ERROR: Archivo SQL no encontrado: {sql_file}")
            return False

        print("Leyendo archivo SQL...")
        with open(sql_file, 'r', encoding='utf-8') as f:
            sql_content = f.read()

        print("Conectando a PostgreSQL en Google Cloud...")

        # Intentar conexión
        conn = psycopg2.connect(
            host=db_host,
            port=db_port,
            database=db_name,
            user=db_user,
            password=db_pass,
            connect_timeout=10
        )

        cursor = conn.cursor()

        # Verificar conexión
        cursor.execute("SELECT version();")
        version = cursor.fetchone()
        print(f"[OK] Conectado a PostgreSQL")
        print(f"Versión: {version[0][:60]}...\n")

        # Obtener estadísticas ANTES
        cursor.execute("SELECT COUNT(*) FROM bienes")
        total_antes = cursor.fetchone()[0]
        cursor.execute("SELECT COUNT(*) FROM bienes WHERE cal_2025 IS NOT NULL")
        con_cal_antes = cursor.fetchone()[0]

        print("Estado ANTES:")
        print(f"  Total bienes: {total_antes}")
        print(f"  Bienes con CAL 2025: {con_cal_antes}\n")

        # Ejecutar sincronización
        print("Ejecutando sincronización...")
        print("(Esto puede tomar 1-2 minutos...)\n")

        # Dividir el SQL en sentencias y ejecutar una por una
        statements = [s.strip() for s in sql_content.split(';') if s.strip()]

        for i, stmt in enumerate(statements):
            if stmt:
                try:
                    cursor.execute(stmt)
                    if (i + 1) % 100 == 0:
                        print(f"  [{i+1}/{len(statements)}] Procesando...")
                        conn.commit()  # Hacer commit parcial
                except Exception as e:
                    error_msg = str(e)[:100]
                    # Ignorar errores de CONFLICT que son esperados
                    if "conflict" not in error_msg.lower():
                        print(f"  [WARN] Error en statement {i}: {error_msg}")

        # Commit final
        conn.commit()

        # Obtener estadísticas DESPUÉS
        cursor.execute("SELECT COUNT(*) FROM bienes")
        total_despues = cursor.fetchone()[0]
        cursor.execute("SELECT COUNT(*) FROM bienes WHERE cal_2025 IS NOT NULL")
        con_cal_despues = cursor.fetchone()[0]

        print("\n" + "="*80)
        print("RESULTADOS")
        print("="*80)

        print("\nEstado DESPUES:")
        print(f"  Total bienes: {total_despues}")
        print(f"  Bienes con CAL 2025: {con_cal_despues}\n")

        print("Cambios realizados:")
        print(f"  Bienes agregados: {total_despues - total_antes}")
        print(f"  CAL 2025 actualizados: {con_cal_despues - con_cal_antes}")

        cursor.close()
        conn.close()

        print("\n[OK] Sincronización completada exitosamente!")
        return True

    except psycopg2.OperationalError as e:
        print(f"[ERROR] Error de conexión: {e}")
        print("\nPosibles soluciones:")
        print("  1. Verificar que la IP de Google Cloud esté correcta")
        print("  2. Asegurar que el firewall de Cloud SQL permita conexiones")
        print("  3. Verificar que las credenciales sean correctas")
        return False
    except Exception as e:
        print(f"[ERROR] {e}")
        import traceback
        traceback.print_exc()
        return False

if __name__ == '__main__':
    success = asyncio.run(main())
    sys.exit(0 if success else 1)
