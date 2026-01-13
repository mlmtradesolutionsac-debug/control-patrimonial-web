#!/usr/bin/env python
"""
Script de importación que REEMPLAZA todos los bienes con datos del Excel
Uso: python import_excel_replace.py
"""

import sys
import os
import pandas as pd
from datetime import datetime

# Configurar encoding para Windows
sys.stdout.reconfigure(encoding='utf-8')

# Cargar variables de entorno
from dotenv import load_dotenv
load_dotenv()

from app import create_app
from app.models_sqlalchemy import db, Bien, Sede, Unidad
from app.utils import log_action

def backup_database():
    """Crear backup de la base de datos actual"""
    db_file = 'data/inventario_patrimonial.db'
    backup_file = f'data/inventario_patrimonial.db.BACKUP_{datetime.now().strftime("%Y%m%d_%H%M%S")}'

    if os.path.exists(db_file):
        import shutil
        shutil.copy2(db_file, backup_file)
        print(f"[BACKUP] Base de datos respaldada en: {backup_file}")
        return backup_file
    return None

def clear_bienes():
    """Borrar todos los bienes actuales"""
    try:
        count = Bien.query.count()
        Bien.query.delete()
        db.session.commit()
        print(f"[CLEAN] Eliminados {count} bienes anteriores")
        return True
    except Exception as e:
        print(f"[ERROR] No se pudieron eliminar los bienes: {e}")
        db.session.rollback()
        return False

def get_or_create_sede(nombre):
    """Obtener o crear una sede"""
    if not nombre or pd.isna(nombre):
        return None

    nombre = str(nombre).strip()
    if not nombre:
        return None

    sede = Sede.query.filter_by(nombre=nombre).first()
    if not sede:
        sede = Sede(nombre=nombre)
        db.session.add(sede)
        db.session.flush()

    return sede

def get_or_create_unidad(nombre):
    """Obtener o crear una unidad (dependencia)"""
    if not nombre or pd.isna(nombre):
        return None

    nombre = str(nombre).strip()
    if not nombre:
        return None

    unidad = Unidad.query.filter_by(nombre=nombre).first()
    if not unidad:
        unidad = Unidad(nombre=nombre)
        db.session.add(unidad)
        db.session.flush()

    return unidad

def map_estado(estado_str):
    """Mapear estado del Excel al formato de BD (b, r, m)"""
    if not estado_str or pd.isna(estado_str):
        return 'b'

    estado = str(estado_str).strip().lower()

    # Mapeos comunes
    if 'bueno' in estado or 'bien' in estado:
        return 'b'
    elif 'regular' in estado or 'reg' in estado or 'medio' in estado:
        return 'r'
    elif 'malo' in estado or 'defec' in estado or 'dañ' in estado:
        return 'm'
    elif 'nuevo' in estado:
        return 'b'  # Nuevo = Bueno
    else:
        return 'b'  # Default a bueno

def get_default_sede():
    """Obtener sede por defecto (Distrito Fiscal del Callao)"""
    sede = Sede.query.filter_by(nombre='Distrito Fiscal del Callao').first()
    if not sede:
        # Si no existe, crear la primera sede disponible como defecto
        sede = Sede.query.first()
    return sede

def import_excel(excel_path):
    """Importar datos del Excel a la BD"""

    if not os.path.exists(excel_path):
        print(f"[ERROR] Archivo no encontrado: {excel_path}")
        return False

    print(f"[INFO] Leyendo Excel: {excel_path}")

    try:
        df = pd.read_excel(excel_path)
        print(f"[INFO] Total de registros en Excel: {len(df)}")

        # Obtener sede por defecto para bienes sin sede
        sede_defecto = get_default_sede()
        print(f"[INFO] Sede por defecto: {sede_defecto.nombre if sede_defecto else 'NINGUNA'}")

        if not sede_defecto:
            print("[ERROR] No hay sedes registradas en la BD")
            return False

        errores = []
        creados = 0
        batch_size = 100

        for idx, row in df.iterrows():
            try:
                # Extraer datos del Excel
                codigo = str(row.get('Codigo Patrimonial', '')).strip()
                denominacion = str(row.get('Denominacion', '')).strip()

                # Validar datos críticos
                if not codigo or not denominacion:
                    errores.append(f"Fila {idx+2}: Código o Denominación vacíos")
                    continue

                # Verificar que no exista (aunque vamos a limpiar primero)
                bien_existe = Bien.query.filter_by(codigo_patrimonial=codigo).first()
                if bien_existe:
                    print(f"[WARN] Bien duplicado en Excel (fila {idx+2}): {codigo}")
                    continue

                # Obtener o crear sede y unidad (dependencia)
                sede_nombre = str(row.get('Sede', '')).strip() if not pd.isna(row.get('Sede')) else None
                unidad_nombre = str(row.get('Dependencia', '')).strip() if not pd.isna(row.get('Dependencia')) else None

                sede = get_or_create_sede(sede_nombre) or sede_defecto
                unidad = get_or_create_unidad(unidad_nombre)

                # Crear objeto Bien
                bien = Bien(
                    codigo_patrimonial=codigo,
                    denominacion=denominacion,
                    marca=str(row.get('Marca', '')).strip() if not pd.isna(row.get('Marca')) else None,
                    modelo=str(row.get('modelo', '')).strip() if not pd.isna(row.get('modelo')) else None,
                    serie=str(row.get('Serie', '')).strip() if not pd.isna(row.get('Serie')) else None,
                    responsable=str(row.get('Responsable', '')).strip() if not pd.isna(row.get('Responsable')) else None,
                    estado=map_estado(row.get('Estado')),
                    observaciones=str(row.get('observaciones', '')).strip() if not pd.isna(row.get('observaciones')) else None,
                    cod_barras=str(row.get('Codigo de barras', '')).strip() if not pd.isna(row.get('Codigo de barras')) else None,
                    verificado=1 if str(row.get('Verificado', 'No')).upper() == 'SI' else 0,
                )

                # Asignar referencias a sede y unidad si existen
                if sede:
                    bien.sede_id = sede.id
                if unidad:
                    bien.unidad_id = unidad.id

                db.session.add(bien)
                creados += 1

                # Hacer commit cada 100 registros
                if creados % batch_size == 0:
                    db.session.commit()
                    print(f"[PROGRESS] {creados} bienes importados...")

            except Exception as e:
                errores.append(f"Fila {idx+2}: {str(e)}")
                db.session.rollback()

        # Commit final
        if creados > 0:
            db.session.commit()
            print(f"[SUCCESS] {creados} bienes importados exitosamente")

        # Reporte de errores
        if errores:
            print(f"\n[ERRORES] Se encontraron {len(errores)} errores:")
            for error in errores[:10]:  # Mostrar primeros 10
                print(f"  - {error}")
            if len(errores) > 10:
                print(f"  ... y {len(errores) - 10} más")

        # Verificar conteo final
        total_final = Bien.query.count()
        print(f"\n[FINAL] Total de bienes en BD: {total_final}")

        log_action('IMPORT_EXCEL', f'Importados {creados} bienes, {len(errores)} errores')

        return creados > 0

    except Exception as e:
        print(f"[ERROR] Error al procesar Excel: {e}")
        import traceback
        traceback.print_exc()
        return False

def main():
    print("=" * 60)
    print("IMPORTADOR DE EXCEL - REEMPLAZAR TODOS LOS BIENES")
    print("=" * 60)

    excel_file = 'DATA SIGA 27-11-2025.xlsx'

    # Crear aplicación Flask
    app = create_app()

    with app.app_context():
        # Paso 1: Backup
        print("\n[PASO 1] Creando backup de la base de datos...")
        backup = backup_database()

        if not backup:
            print("[WARN] No se pudo crear backup (BD puede estar vacía)")

        # Paso 2: Limpiar bienes actuales
        print("\n[PASO 2] Eliminando bienes actuales...")
        if not clear_bienes():
            print("[ERROR] Fallo al limpiar la BD, abortando")
            return False

        # Paso 3: Importar datos nuevos
        print("\n[PASO 3] Importando datos del Excel...")
        success = import_excel(excel_file)

        if success:
            print("\n" + "=" * 60)
            print("[EXITO] Importacion completada correctamente!")
            print("=" * 60)
            print(f"\nArchivo: {excel_file}")
            print(f"Backup: {backup}")
            print(f"\nLa aplicacion esta lista con los nuevos datos.")
            return True
        else:
            print("\n" + "=" * 60)
            print("[ERROR] La importacion fallo!")
            print("=" * 60)

            # Ofrecer restauración de backup
            if backup and os.path.exists(backup):
                print(f"\nPuedes restaurar el backup manualmente:")
                print(f"  1. Detén la aplicación")
                print(f"  2. Borra: data/inventario_patrimonial.db")
                print(f"  3. Copia: {backup} -> data/inventario_patrimonial.db")
                print(f"  4. Reinicia la aplicación")

            return False

if __name__ == '__main__':
    try:
        success = main()
        sys.exit(0 if success else 1)
    except KeyboardInterrupt:
        print("\n\n[CANCELADO] Importacion cancelada por el usuario")
        sys.exit(1)
    except Exception as e:
        print(f"\n[ERROR FATAL] {e}")
        import traceback
        traceback.print_exc()
        sys.exit(1)
