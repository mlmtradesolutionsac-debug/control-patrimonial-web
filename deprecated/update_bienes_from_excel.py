#!/usr/bin/env python3
"""
Script para actualizar datos de bienes desde archivo Excel.
Actualiza registros existentes en la BD basándose en Codigo Patrimonial (unique key).
"""

import sqlite3
import pandas as pd
import os
import sys
from datetime import datetime
from pathlib import Path

def connect_db(db_path):
    """Conectar a la base de datos SQLite"""
    conn = sqlite3.connect(db_path)
    conn.row_factory = sqlite3.Row
    conn.execute("PRAGMA foreign_keys = ON")
    return conn

def read_excel(excel_path):
    """Leer el archivo Excel"""
    print(f"Leyendo Excel: {excel_path}")
    df = pd.read_excel(excel_path)
    print(f"Total de filas: {len(df)}")
    return df

def create_mapeos(conn):
    """Crear mapeos de Sede -> sede_id y Dependencia -> unidad_id"""
    cursor = conn.cursor()

    # Mapeo de sedes
    cursor.execute("SELECT id, nombre FROM sedes")
    sede_map = {row['nombre'].strip(): row['id'] for row in cursor.fetchall()}

    # Mapeo de unidades
    cursor.execute("SELECT id, nombre FROM unidades")
    unidad_map = {row['nombre'].strip(): row['id'] for row in cursor.fetchall()}

    return sede_map, unidad_map

def convertir_estado(valor):
    """Convertir estado de texto a código (b=bueno, r=regular, m=malo)"""
    if pd.isna(valor):
        return None
    valor = str(valor).lower().strip()
    if valor.startswith('b'):
        return 'b'
    elif valor.startswith('r'):
        return 'r'
    elif valor.startswith('m'):
        return 'm'
    return None

def update_bien(conn, row, sede_map, unidad_map):
    """Actualizar un bien existente"""
    cursor = conn.cursor()

    codigo_patrimonial = row.get('Codigo Patrimonial')
    if pd.isna(codigo_patrimonial):
        return 'skipped'

    codigo_patrimonial = str(codigo_patrimonial).strip()

    # Verificar si existe
    cursor.execute(
        "SELECT id FROM bienes WHERE codigo_patrimonial = ?",
        (codigo_patrimonial,)
    )
    existing = cursor.fetchone()

    # Obtener sede_id y unidad_id
    sede_nombre = row.get('Sede')
    sede_id = None
    if pd.notna(sede_nombre):
        sede_nombre = str(sede_nombre).strip()
        sede_id = sede_map.get(sede_nombre)

    dependencia_nombre = row.get('Dependencia')
    unidad_id = None
    if pd.notna(dependencia_nombre):
        dependencia_nombre = str(dependencia_nombre).strip()
        unidad_id = unidad_map.get(dependencia_nombre)

    # Convertir estado
    estado = convertir_estado(row.get('Estado'))

    # Valores a actualizar
    denominacion = row.get('Denominacion') if pd.notna(row.get('Denominacion')) else row.get('denominacion')
    descripcion = row.get('descripcion')
    marca = row.get('Marca')
    modelo = row.get('modelo')
    serie = row.get('Serie')
    cod_barras = row.get('Codigo de barras')
    verificado = 1 if row.get('Verificado') == 1 else 0
    ubicacion_texto = row.get('Siga UBICACIÓN')
    responsable = row.get('Responsable')
    usuario_registro = row.get('Usuario')
    observaciones = row.get('observaciones')
    codigo_siga_1 = row.get('SIGA TIPO')

    # Valores de calibración
    cal_2020 = row.get('CAL 2020')
    cal_2021 = row.get('CAL 2021')
    cal_2022 = row.get('CAL 2022')
    cal_2023 = row.get('CAL 2023')
    cal_2024 = row.get('CAL 2024')
    cal_2025 = row.get('CAL 2025')

    fecha_hora_actual = datetime.now().isoformat()

    if existing:
        # Actualizar registro existente
        update_query = """
        UPDATE bienes SET
            denominacion = ?,
            descripcion = ?,
            marca = ?,
            modelo = ?,
            serie = ?,
            estado = ?,
            verificado = ?,
            cod_barras = ?,
            cal_2025 = ?,
            cal_2024 = ?,
            cal_2023 = ?,
            cal_2022 = ?,
            cal_2021 = ?,
            cal_2020 = ?,
            ubicacion_texto = ?,
            responsable = ?,
            usuario_registro = ?,
            observaciones = ?,
            codigo_siga_1 = ?,
            fecha_inventario = ?
        WHERE codigo_patrimonial = ?
        """
        cursor.execute(update_query, (
            denominacion, descripcion, marca, modelo, serie, estado, verificado,
            cod_barras, cal_2025, cal_2024, cal_2023, cal_2022, cal_2021, cal_2020,
            ubicacion_texto, responsable, usuario_registro, observaciones,
            codigo_siga_1, fecha_hora_actual, codigo_patrimonial
        ))
        return 'updated'
    else:
        # Insertar nuevo registro
        # Usar sede_id y unidad_id por defecto si no se encuentran
        if sede_id is None:
            sede_id = 1  # Por defecto
        if unidad_id is None:
            unidad_id = 1  # Por defecto

        insert_query = """
        INSERT INTO bienes (
            codigo_patrimonial, denominacion, descripcion, marca, modelo, serie,
            estado, verificado, cod_barras, cal_2025, cal_2024, cal_2023, cal_2022,
            cal_2021, cal_2020, sede_id, unidad_id, ubicacion_texto, responsable,
            usuario_registro, observaciones, codigo_siga_1, fecha_inventario, fecha_registro
        ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
        """
        cursor.execute(insert_query, (
            codigo_patrimonial, denominacion, descripcion, marca, modelo, serie,
            estado, verificado, cod_barras, cal_2025, cal_2024, cal_2023, cal_2022,
            cal_2021, cal_2020, sede_id, unidad_id, ubicacion_texto, responsable,
            usuario_registro, observaciones, codigo_siga_1, fecha_hora_actual, fecha_hora_actual
        ))
        return 'inserted'

def main():
    if len(sys.argv) < 2:
        print("Uso: python update_bienes_from_excel.py <ruta_excel> [ruta_db]")
        print("\nEjemplo:")
        print("  python update_bienes_from_excel.py '/home/patrimonio/uploads/excel/DATA SIGA.xlsx'")
        sys.exit(1)

    excel_path = sys.argv[1]

    if len(sys.argv) >= 3:
        db_path = sys.argv[2]
    else:
        # Ruta por defecto
        db_path = os.path.expanduser("~/control_patrimonial/data/inventario_patrimonial.db")

    print(f"\n{'='*70}")
    print(f"ACTUALIZACIÓN DE BIENES DESDE EXCEL")
    print(f"{'='*70}")
    print(f"Excel: {excel_path}")
    print(f"BD: {db_path}")
    print(f"{'='*70}\n")

    # Validar que el Excel existe
    if not os.path.exists(excel_path):
        print(f"ERROR: No se encontró el archivo Excel: {excel_path}")
        sys.exit(1)

    # Crear BD si no existe (será creada automáticamente por SQLite)
    # El archivo será creado al hacer la primera conexión

    # Hacer backup de la BD
    backup_path = f"{db_path}.backup_{datetime.now().strftime('%Y%m%d_%H%M%S')}"
    import shutil
    shutil.copy2(db_path, backup_path)
    print(f"✓ Backup creado: {backup_path}\n")

    # Leer Excel
    df = read_excel(excel_path)

    # Conectar a BD
    conn = connect_db(db_path)

    try:
        print(f"Creando mapeos de Sedes y Unidades...")
        sede_map, unidad_map = create_mapeos(conn)
        print(f"✓ {len(sede_map)} sedes cargadas")
        print(f"✓ {len(unidad_map)} unidades cargadas\n")

        stats = {'inserted': 0, 'updated': 0, 'skipped': 0, 'errors': 0}

        # Procesar cada fila
        print(f"Procesando {len(df)} registros...")
        for idx, row in df.iterrows():
            try:
                result = update_bien(conn, row, sede_map, unidad_map)
                stats[result] += 1

                # Mostrar progreso cada 100 filas
                if (idx + 1) % 100 == 0:
                    print(f"  {idx + 1}/{len(df)} registros procesados...")

            except Exception as e:
                print(f"ERROR en fila {idx + 1}: {str(e)}")
                stats['errors'] += 1

        # Confirmar cambios
        conn.commit()
        print(f"\n{'='*70}")
        print(f"PROCESO COMPLETADO EXITOSAMENTE")
        print(f"{'='*70}")
        print(f"  ✓ Insertados: {stats['inserted']}")
        print(f"  ✓ Actualizados: {stats['updated']}")
        print(f"  ⊘ Omitidos: {stats['skipped']}")
        print(f"  ✗ Errores: {stats['errors']}")
        print(f"{'='*70}\n")

    except Exception as e:
        conn.rollback()
        print(f"\nERROR FATAL: {str(e)}")
        print(f"Los cambios han sido revertidos. BD restaurada desde backup.")
        sys.exit(1)

    finally:
        conn.close()

if __name__ == '__main__':
    main()
