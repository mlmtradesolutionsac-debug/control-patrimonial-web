#!/usr/bin/env python3
"""
Script para aplicar migración directamente en PostgreSQL
Ejecuta SQL directo para cambiar el esquema de la BD
"""

import psycopg2
import sys

# Configuración de conexión a Cloud SQL
DB_HOST = "35.222.111.223"
DB_PORT = 5432
DB_NAME = "control_patrimonial"
DB_USER = "control_patrimonial"
DB_PASSWORD = "Control2025"

def apply_migration():
    """Aplicar migración SQL directamente"""

    print("=" * 80)
    print("APLICAR MIGRACIÓN: codigo_patrimonial NULLABLE")
    print("=" * 80)

    try:
        # Conectar a PostgreSQL
        print(f"\n[1/3] Conectando a PostgreSQL en {DB_HOST}:{DB_PORT}...")
        conn = psycopg2.connect(
            host=DB_HOST,
            port=DB_PORT,
            database=DB_NAME,
            user=DB_USER,
            password=DB_PASSWORD,
            connect_timeout=10
        )
        cursor = conn.cursor()
        print("[OK] Conectado exitosamente\n")

        # Paso 1: Verificar estado actual de la columna
        print("[2/3] Verificando estado actual de la columna...")
        cursor.execute("""
            SELECT is_nullable FROM information_schema.columns
            WHERE table_name = 'bienes' AND column_name = 'codigo_patrimonial'
        """)
        result = cursor.fetchone()

        if result:
            is_nullable = result[0]
            print(f"  Estado actual: {'NULLABLE' if is_nullable == 'YES' else 'NOT NULL'}")

            if is_nullable == 'YES':
                print("  [INFO] La columna ya es NULLABLE, migración no necesaria")
                cursor.close()
                conn.close()
                return True

        # Paso 2: Aplicar la migración
        print("\n[3/3] Aplicando migración SQL...")

        # Cambiar la columna a NULLABLE
        cursor.execute("""
            ALTER TABLE bienes ALTER COLUMN codigo_patrimonial DROP NOT NULL
        """)
        print("  [OK] Columna codigo_patrimonial ahora es NULLABLE")

        # Registrar la migración en alembic_version
        cursor.execute("""
            INSERT INTO alembic_version (version_num) VALUES ('allow_bienes_without_code')
            ON CONFLICT (version_num) DO NOTHING
        """)
        print("  [OK] Migración registrada en alembic_version")

        # Commit
        conn.commit()
        print("\n[OK] Commit completado")

        # Verificación final
        print("\n" + "=" * 80)
        print("RESULTADOS DE LA MIGRACIÓN")
        print("=" * 80)

        cursor.execute("""
            SELECT is_nullable FROM information_schema.columns
            WHERE table_name = 'bienes' AND column_name = 'codigo_patrimonial'
        """)
        result = cursor.fetchone()
        if result and result[0] == 'YES':
            print("[OK] Migración completada exitosamente!")
            print("     La columna codigo_patrimonial ahora acepta valores NULL")
        else:
            print("[ERROR] La migración no se aplicó correctamente")
            return False

        cursor.close()
        conn.close()
        return True

    except Exception as e:
        print(f"\n[ERROR] Error durante la migración: {e}")
        import traceback
        traceback.print_exc()
        return False

if __name__ == '__main__':
    success = apply_migration()
    sys.exit(0 if success else 1)
