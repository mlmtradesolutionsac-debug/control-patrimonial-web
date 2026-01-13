#!/usr/bin/env python3
"""
Script para inicializar PostgreSQL y luego importar bienes desde Excel
"""

import sys
import os
sys.path.insert(0, '/home/patrimonio/control_patrimonial')
os.chdir('/home/patrimonio/control_patrimonial')

import pandas as pd
from datetime import datetime
from wsgi import app
from app import db
from app.models_sqlalchemy import Bien, Sede, Unidad

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
    excel_path = '/home/patrimonio/uploads/excel/DATA SIGA 03-12-2025 ARREGLADO.xlsx'

    print(f"\n{'='*70}")
    print("INICIALIZACIÓN DE POSTGRESQL E IMPORTACIÓN DE BIENES")
    print(f"{'='*70}\n")

    if not os.path.exists(excel_path):
        print(f"ERROR: No se encontró el archivo Excel: {excel_path}")
        sys.exit(1)

    # Leer Excel
    print("Leyendo Excel...")
    df = pd.read_excel(excel_path)
    print(f"Total de filas: {len(df)}\n")

    with app.app_context():
        try:
            # PASO 1: Crear tabla base (Sede por defecto)
            print("PASO 1: Inicializando tablas base...")

            # Verificar si ya existe sede
            sede_defecto = db.session.query(Sede).filter_by(id=1).first()
            if not sede_defecto:
                print("  Creando sede por defecto...")
                sede = Sede(id=1, nombre="SAENZ PEÑA 120")
                db.session.add(sede)
                db.session.commit()
                print("  ✓ Sede creada")
            else:
                print("  ✓ Sede ya existe")

            # Verificar si existen unidades
            total_unidades = db.session.query(Unidad).count()
            if total_unidades == 0:
                print("  Creando unidades por defecto...")
                unidad = Unidad(id=1, nombre="ADMINISTRACIÓN - CONTROL PATRIMONIAL")
                db.session.add(unidad)
                db.session.commit()
                print("  ✓ Unidad creada")
            else:
                print(f"  ✓ Existen {total_unidades} unidades")

            print("\nPASO 2: Importando bienes desde Excel...\n")

            stats = {'insertados': 0, 'actualizados': 0, 'errores': 0}

            for idx, row in df.iterrows():
                codigo = row.get('Codigo Patrimonial')
                if pd.isna(codigo):
                    continue

                codigo = str(codigo).strip()

                try:
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
                        stats['actualizados'] += 1
                    else:
                        # INSERTAR nuevo bien
                        bien_nuevo = Bien()
                        bien_nuevo.codigo_patrimonial = codigo
                        bien_nuevo.denominacion = row.get('Denominacion')
                        bien_nuevo.marca = row.get('Marca')
                        bien_nuevo.modelo = row.get('modelo')
                        # Convertir NaN a None para serie
                        serie_val = row.get('Serie')
                        bien_nuevo.serie = None if pd.isna(serie_val) else serie_val
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
                        stats['insertados'] += 1

                    if (idx + 1) % 100 == 0:
                        try:
                            db.session.commit()
                        except Exception as commit_error:
                            db.session.rollback()
                            print(f"ERROR al guardar batch en fila {idx + 1}: {str(commit_error)}")
                            # Continuar de todas formas
                        print(f"  {idx + 1}/{len(df)} registros procesados...")

                except Exception as e:
                    db.session.rollback()
                    print(f"ERROR en fila {idx + 1} ({codigo}): {str(e)[:100]}")
                    stats['errores'] += 1

            # Confirmar cambios finales
            try:
                db.session.commit()
            except Exception as e:
                db.session.rollback()
                print(f"ERROR al confirmar cambios: {str(e)}")

            print(f"\n{'='*70}")
            print("PROCESO COMPLETADO EXITOSAMENTE")
            print(f"{'='*70}")
            print(f"  Insertados: {stats['insertados']}")
            print(f"  Actualizados: {stats['actualizados']}")
            print(f"  Errores: {stats['errores']}")
            print(f"{'='*70}\n")

        except Exception as e:
            db.session.rollback()
            print(f"\nERROR FATAL: {str(e)}")
            import traceback
            traceback.print_exc()
            sys.exit(1)

if __name__ == '__main__':
    main()
