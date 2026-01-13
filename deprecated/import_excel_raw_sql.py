#!/usr/bin/env python
"""
Script de importación usando SQL directo (sin ORM)
Para respetar la estructura real de la BD
"""

import sys
import os
import pandas as pd
import sqlite3
from datetime import datetime

sys.stdout.reconfigure(encoding='utf-8')

def backup_database():
    """Crear backup de la BD"""
    db_file = 'data/inventario_patrimonial.db'
    backup_file = f'data/inventario_patrimonial.db.BACKUP_{datetime.now().strftime("%Y%m%d_%H%M%S")}'

    if os.path.exists(db_file):
        import shutil
        shutil.copy2(db_file, backup_file)
        print(f"[BACKUP] Base de datos respaldada en: {backup_file}")
        return backup_file
    return None

def get_sede_id(conn, sede_nombre):
    """Obtener ID de sede o crear si no existe"""
    if not sede_nombre or pd.isna(sede_nombre):
        # Retornar sede por defecto
        cursor = conn.execute("SELECT id FROM sedes WHERE nombre = 'Distrito Fiscal del Callao' LIMIT 1")
        row = cursor.fetchone()
        return row[0] if row else 1

    sede_nombre = str(sede_nombre).strip()

    cursor = conn.execute("SELECT id FROM sedes WHERE nombre = ? LIMIT 1", (sede_nombre,))
    row = cursor.fetchone()

    if row:
        return row[0]

    # Crear nueva sede
    cursor = conn.execute("INSERT INTO sedes (nombre) VALUES (?)", (sede_nombre,))
    conn.commit()
    return cursor.lastrowid

def get_unidad_id(conn, unidad_nombre, sede_id):
    """Obtener ID de unidad o crear si no existe"""
    if not unidad_nombre or pd.isna(unidad_nombre):
        return None

    unidad_nombre = str(unidad_nombre).strip()

    cursor = conn.execute("SELECT id FROM unidades WHERE nombre = ? LIMIT 1", (unidad_nombre,))
    row = cursor.fetchone()

    if row:
        return row[0]

    # Crear nueva unidad (con sede_id y tipo por defecto)
    cursor = conn.execute(
        "INSERT INTO unidades (nombre, sede_id, tipo) VALUES (?, ?, ?)",
        (unidad_nombre, sede_id, 'Fiscalía')  # tipo con acento (CHECK constraint)
    )
    conn.commit()
    return cursor.lastrowid

def map_estado(estado_str):
    """Mapear estado a código BD"""
    if not estado_str or pd.isna(estado_str):
        return 'b'

    estado = str(estado_str).strip().lower()
    if 'bueno' in estado or 'bien' in estado or 'nuevo' in estado:
        return 'b'
    elif 'regular' in estado or 'reg' in estado or 'medio' in estado:
        return 'r'
    elif 'malo' in estado or 'defec' in estado or 'dañ' in estado:
        return 'm'
    else:
        return 'b'

def clear_bienes(conn):
    """Limpiar todos los bienes"""
    cursor = conn.execute("SELECT COUNT(*) FROM bienes")
    count = cursor.fetchone()[0]

    conn.execute("DELETE FROM bienes")
    conn.commit()

    print(f"[CLEAN] Eliminados {count} bienes")
    return count

def import_excel(excel_path, conn):
    """Importar Excel a la BD"""

    if not os.path.exists(excel_path):
        print(f"[ERROR] Archivo no encontrado: {excel_path}")
        return False

    print(f"[INFO] Leyendo Excel: {excel_path}")

    try:
        df = pd.read_excel(excel_path)
        print(f"[INFO] Total de registros: {len(df)}")

        creados = 0
        errores = 0
        batch_size = 100

        for idx, row in df.iterrows():
            try:
                # Extraer datos
                codigo = str(row.get('Codigo Patrimonial', '')).strip()
                denominacion = str(row.get('Denominacion', '')).strip()

                if not codigo or not denominacion:
                    errores += 1
                    continue

                # Verificar duplicado
                cursor = conn.execute("SELECT id FROM bienes WHERE codigo_patrimonial = ? LIMIT 1", (codigo,))
                if cursor.fetchone():
                    errores += 1
                    continue

                # Obtener IDs
                sede_nombre = str(row.get('Sede', '')).strip() if not pd.isna(row.get('Sede')) else None
                unidad_nombre = str(row.get('Dependencia', '')).strip() if not pd.isna(row.get('Dependencia')) else None

                sede_id = get_sede_id(conn, sede_nombre)
                unidad_id = get_unidad_id(conn, unidad_nombre, sede_id)

                # Si no hay unidad, crear una por defecto
                if not unidad_id:
                    unidad_id = get_unidad_id(conn, f'Administrativos Sede {sede_id}', sede_id)

                # Preparar datos
                cod_barras = str(row.get('Codigo de barras', '')).strip() if not pd.isna(row.get('Codigo de barras')) else ''
                marca = str(row.get('Marca', '')).strip() if not pd.isna(row.get('Marca')) else ''
                modelo = str(row.get('modelo', '')).strip() if not pd.isna(row.get('modelo')) else ''
                serie = str(row.get('Serie', '')).strip() if not pd.isna(row.get('Serie')) else ''
                responsable = str(row.get('Responsable', '')).strip() if not pd.isna(row.get('Responsable')) else ''
                estado = map_estado(row.get('Estado'))
                observaciones = str(row.get('observaciones', '')).strip() if not pd.isna(row.get('observaciones')) else ''
                verificado = 1 if str(row.get('Verificado', 'No')).upper() == 'SI' else 0
                cal_2025 = str(row.get('CAL 2025', '')).strip() if not pd.isna(row.get('CAL 2025')) else ''

                # Insertar bien
                conn.execute("""
                    INSERT INTO bienes (
                        codigo_patrimonial, denominacion, marca, modelo, serie,
                        estado, sede_id, unidad_id, responsable, observaciones,
                        cod_barras, verificado, cal_2025, fecha_registro
                    ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
                """, (
                    codigo, denominacion, marca, modelo, serie,
                    estado, sede_id, unidad_id, responsable, observaciones,
                    cod_barras, verificado, cal_2025, datetime.now().isoformat()
                ))

                creados += 1

                if creados % batch_size == 0:
                    conn.commit()
                    print(f"[PROGRESS] {creados} bienes importados...")

            except Exception as e:
                errores += 1
                if errores <= 5:
                    print(f"[ERROR] Fila {idx+2}: {str(e)[:100]}")

        # Commit final
        conn.commit()

        print(f"\n[RESULTADO] {creados} bienes creados, {errores} errores")
        print(f"[FINAL] Total en BD: {conn.execute('SELECT COUNT(*) FROM bienes').fetchone()[0]}")

        return creados > 0

    except Exception as e:
        print(f"[ERROR] Error fatal: {e}")
        import traceback
        traceback.print_exc()
        return False

def main():
    print("=" * 60)
    print("IMPORTADOR EXCEL - SQL DIRECTO")
    print("=" * 60)

    excel_file = 'DATA SIGA 27-11-2025.xlsx'
    db_file = 'data/inventario_patrimonial.db'

    # Paso 1: Backup
    print("\n[PASO 1] Creando backup...")
    backup = backup_database()

    if not backup:
        print("[WARN] No se pudo crear backup")

    # Paso 2: Conectar a BD
    print("\n[PASO 2] Conectando a BD...")
    try:
        conn = sqlite3.connect(db_file)
        conn.row_factory = sqlite3.Row
        print("[OK] Conectado a BD")
    except Exception as e:
        print(f"[ERROR] No se pudo conectar: {e}")
        return False

    # Paso 3: Limpiar bienes
    print("\n[PASO 3] Limpiando bienes...")
    clear_bienes(conn)

    # Paso 4: Importar
    print("\n[PASO 4] Importando datos...")
    success = import_excel(excel_file, conn)

    # Cerrar BD
    conn.close()

    if success:
        print("\n" + "=" * 60)
        print("[EXITO] Importacion completada!")
        print("=" * 60)
        return True
    else:
        print("\n" + "=" * 60)
        print("[ERROR] Importacion fallo!")
        print("=" * 60)
        return False

if __name__ == '__main__':
    try:
        success = main()
        sys.exit(0 if success else 1)
    except KeyboardInterrupt:
        print("\n\n[CANCELADO] Por el usuario")
        sys.exit(1)
    except Exception as e:
        print(f"\n[ERROR FATAL] {e}")
        import traceback
        traceback.print_exc()
        sys.exit(1)
