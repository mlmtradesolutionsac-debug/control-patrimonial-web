#!/usr/bin/env python3
"""
Script para actualizar datos de bienes en PostgreSQL desde archivo Excel
"""

import sys
import os
sys.path.insert(0, '/home/patrimonio/control_patrimonial')
os.chdir('/home/patrimonio/control_patrimonial')

import pandas as pd
from datetime import datetime
from wsgi import app
from app import db
from app.models_sqlalchemy import Bien

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

def main():
    if len(sys.argv) < 2:
        print("Uso: python update_bienes_postgresql.py <ruta_excel>")
        sys.exit(1)

    excel_path = sys.argv[1]

    print(f"\n{'='*70}")
    print(f"ACTUALIZACIÓN DE BIENES EN POSTGRESQL DESDE EXCEL")
    print(f"{'='*70}")
    print(f"Excel: {excel_path}\n")

    if not os.path.exists(excel_path):
        print(f"ERROR: No se encontró el archivo Excel: {excel_path}")
        sys.exit(1)

    # Leer Excel
    print(f"Leyendo Excel...")
    df = pd.read_excel(excel_path)
    print(f"Total de filas: {len(df)}\n")

    with app.app_context():
        try:
            stats = {'updated': 0, 'errors': 0}

            print(f"Procesando {len(df)} registros...\n")

            for idx, row in df.iterrows():
                try:
                    codigo = row.get('Codigo Patrimonial')
                    if pd.isna(codigo):
                        continue

                    codigo = str(codigo).strip()

                    # Buscar bien por código
                    bien = Bien.query.filter_by(codigo_patrimonial=codigo).first()

                    if bien:
                        # Actualizar campos
                        bien.denominacion = row.get('Denominacion') or bien.denominacion
                        bien.marca = row.get('Marca')
                        bien.modelo = row.get('modelo')
                        bien.serie = row.get('Serie')
                        bien.responsable = row.get('Responsable')
                        bien.usuario_registro = row.get('Usuario')
                        bien.estado = convertir_estado(row.get('Estado'))
                        bien.ubicacion_texto = row.get('Siga UBICACIÓN')
                        bien.observaciones = row.get('observaciones')
                        bien.codigo_siga_1 = row.get('SIGA TIPO')
                        bien.cal_2020 = row.get('CAL 2020')
                        bien.cal_2021 = row.get('CAL 2021')
                        bien.cal_2022 = row.get('CAL 2022')
                        bien.cal_2023 = row.get('CAL 2023')
                        bien.cal_2024 = row.get('CAL 2024')
                        bien.cal_2025 = row.get('CAL 2025')
                        bien.fecha_inventario = datetime.now()

                        stats['updated'] += 1
                    else:
                        # INSERTAR nuevo bien (crear objeto y luego asignar atributos)
                        bien_nuevo = Bien()
                        bien_nuevo.codigo_patrimonial = codigo
                        bien_nuevo.denominacion = row.get('Denominacion')
                        bien_nuevo.marca = row.get('Marca')
                        bien_nuevo.modelo = row.get('modelo')
                        bien_nuevo.serie = row.get('Serie')
                        bien_nuevo.responsable = row.get('Responsable')
                        bien_nuevo.usuario_registro = row.get('Usuario')
                        bien_nuevo.estado = convertir_estado(row.get('Estado'))
                        bien_nuevo.ubicacion_texto = row.get('Siga UBICACIÓN')
                        bien_nuevo.observaciones = row.get('observaciones')
                        bien_nuevo.codigo_siga_1 = row.get('SIGA TIPO')
                        bien_nuevo.cal_2020 = row.get('CAL 2020')
                        bien_nuevo.cal_2021 = row.get('CAL 2021')
                        bien_nuevo.cal_2022 = row.get('CAL 2022')
                        bien_nuevo.cal_2023 = row.get('CAL 2023')
                        bien_nuevo.cal_2024 = row.get('CAL 2024')
                        bien_nuevo.cal_2025 = row.get('CAL 2025')
                        bien_nuevo.fecha_inventario = datetime.now()
                        bien_nuevo.sede_id = 1  # Por defecto
                        bien_nuevo.unidad_id = 1  # Por defecto

                        db.session.add(bien_nuevo)
                        stats['updated'] += 1

                        if (idx + 1) % 100 == 0:
                            print(f"  {idx + 1}/{len(df)} registros procesados...")

                except Exception as e:
                    print(f"ERROR en fila {idx + 1}: {str(e)}")
                    stats['errors'] += 1

            # Confirmar cambios
            db.session.commit()

            print(f"\n{'='*70}")
            print(f"PROCESO COMPLETADO")
            print(f"{'='*70}")
            print(f"  Actualizados: {stats['updated']}")
            print(f"  Errores: {stats['errors']}")
            print(f"{'='*70}\n")

        except Exception as e:
            db.session.rollback()
            print(f"\nERROR FATAL: {str(e)}")
            sys.exit(1)

if __name__ == '__main__':
    main()
