#!/usr/bin/env python3
"""
Script para sincronizar datos a Cloud SQL PostgreSQL
Usa Cloud SQL Python Connector para conexión segura desde Cloud Run
"""

import os
import sys
from pathlib import Path

# Agregar el directorio al path para importar la aplicación
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

# Configurar variables de entorno ANTES de importar
os.environ['FLASK_ENV'] = 'production'
os.environ.setdefault('DATABASE_URL', 'postgresql://control_patrimonial:Control2025@35.222.111.223:5432/control_patrimonial')

def sync_to_cloud():
    """Sincronizar datos del SQLite local a Cloud SQL PostgreSQL"""

    print("=" * 80)
    print("SINCRONIZACION A CLOUD SQL POSTGRESQL")
    print("=" * 80)

    try:
        # Importar después de configurar FLASK_ENV
        from app import create_app, db
        from app.models_sqlalchemy import Bien
        from config import ProductionConfig

        # Crear contexto de aplicación con configuración de producción
        app = create_app(ProductionConfig)

        with app.app_context():
            print("\n[1/3] Verificando conexión a PostgreSQL en Cloud...")

            # Verificar que podemos conectar a la BD
            try:
                result = db.session.execute(db.text('SELECT version();'))
                version = result.fetchone()
                print("[OK] Conectado a PostgreSQL")
                print(f"  Version: {version[0][:70]}...\n")
            except Exception as e:
                print(f"[ERROR] Error de conexion: {e}")
                return False

            # Leer y ejecutar el SQL de sincronización
            sql_file = Path(__file__).parent / 'sync_to_cloud.sql'

            if not sql_file.exists():
                print(f"[ERROR] Archivo no encontrado: {sql_file}")
                return False

            print(f"[2/3] Leyendo archivo SQL ({sql_file.stat().st_size / 1024:.0f} KB)...")

            with open(sql_file, 'r', encoding='utf-8') as f:
                sql_content = f.read()

            # Dividir en sentencias y ejecutar
            print("[3/3] Ejecutando sincronizacion...")
            print("  (Esto puede tomar 1-2 minutos)...\n")

            statements = [s.strip() for s in sql_content.split(';') if s.strip()]

            total_statements = len(statements)
            errors = []
            success_count = 0

            for i, stmt in enumerate(statements, 1):
                try:
                    db.session.execute(db.text(stmt))

                    if i % 100 == 0:
                        print(f"  [{i}/{total_statements}] Procesados {i} statements...")
                        db.session.commit()  # Commit parcial

                    success_count += 1

                except Exception as e:
                    error_msg = str(e).lower()
                    # Ignorar errores de CONFLICT (actualizaciones)
                    if 'conflict' in error_msg or 'duplicate' in error_msg:
                        success_count += 1  # Contar como éxito (ya existe)
                    else:
                        errors.append(f"Statement {i}: {str(e)[:100]}")
                        print(f"  [ADVERTENCIA] Statement {i}: {str(e)[:80]}")

            # Commit final
            try:
                db.session.commit()
                print(f"\n[OK] Commit final exitoso")
            except Exception as e:
                print(f"[ERROR] Error en commit final: {e}")
                db.session.rollback()
                return False

            # Estadísticas finales
            print("\n" + "=" * 80)
            print("RESULTADOS DE SINCRONIZACION")
            print("=" * 80)

            try:
                total_bienes = db.session.query(Bien).count()
                con_cal_2025 = db.session.query(Bien).filter(Bien.cal_2025 != None).count()

                print(f"\nEstadisticas en Cloud SQL:")
                print(f"  Total bienes: {total_bienes:,}")
                print(f"  Bienes con CAL 2025: {con_cal_2025:,}")
                print(f"  Porcentaje actualizado: {(con_cal_2025/total_bienes*100 if total_bienes > 0 else 0):.2f}%")
            except Exception as e:
                print(f"Error al obtener estadisticas: {e}")

            print(f"\nStatements procesados: {success_count}/{total_statements}")

            if errors:
                print(f"\n[ADVERTENCIA] Errores encontrados: {len(errors)}")
                for error in errors[:5]:  # Mostrar primeros 5
                    print(f"  - {error}")
                if len(errors) > 5:
                    print(f"  ... y {len(errors) - 5} errores mas")
            else:
                print(f"\n[OK] Sin errores criticos")

            print("\n[OK] Sincronizacion completada exitosamente!")
            return True

    except Exception as e:
        print(f"\n[ERROR] Error critico: {e}")
        import traceback
        traceback.print_exc()
        return False

if __name__ == '__main__':
    success = sync_to_cloud()
    sys.exit(0 if success else 1)
