#!/usr/bin/env python3
"""
Script para importar SOLO los bienes que faltaron - VERSION 2
Maneja truncamiento de strings largos
"""

import sys
import os
sys.path.insert(0, '/home/patrimonio/control_patrimonial')
os.chdir('/home/patrimonio/control_patrimonial')

from wsgi import app
from app import db
from app.models_sqlalchemy import Bien
import sqlite3
from datetime import datetime

SQLITE_PATH = 'data/inventario_patrimonial.db'

# Límites de campos
FIELD_LIMITS = {
    'codigo_patrimonial': 50,
    'cod_barras': 100,
    'denominacion': 200,
    'descripcion': None,  # Text
    'marca': 100,
    'modelo': 100,
    'serie': 100,
    'estado': 1,
    'responsable': 200,
    'ubicacion_texto': None,  # Text
    'observaciones': None,  # Text
    'usuario_registro': 50,
}

def truncate_field(field_name, value):
    """Truncar valores que exceden el límite del campo"""
    if not value:
        return value

    limit = FIELD_LIMITS.get(field_name)
    if limit and len(str(value)) > limit:
        return str(value)[:limit]
    return value

print("\n" + "="*70)
print("IMPORTAR BIENES FALTANTES v2 (truncamiento de strings largos)")
print("="*70 + "\n")

# Conectar a SQLite
conn_sqlite = sqlite3.connect(SQLITE_PATH)
conn_sqlite.row_factory = sqlite3.Row
cursor = conn_sqlite.cursor()

with app.app_context():
    try:
        # Obtener códigos que ya existen en PostgreSQL
        codigos_pg = set(bien.codigo_patrimonial for bien in Bien.query.all())
        print(f"Bienes ya en PostgreSQL: {len(codigos_pg)}")

        # Leer todos los bienes de SQLite
        cursor.execute("SELECT * FROM bienes")
        bienes_sqlite = cursor.fetchall()
        print(f"Bienes en SQLite: {len(bienes_sqlite)}")

        # Encontrar faltantes
        bienes_faltantes = [b for b in bienes_sqlite if b['codigo_patrimonial'] not in codigos_pg]
        print(f"Bienes faltantes: {len(bienes_faltantes)}\n")

        stats = {'insertados': 0, 'errores': 0}

        # Rastrear series y cal_2025 para evitar nuevos duplicados
        series_usadas = set(bien.serie for bien in Bien.query.filter(Bien.serie != None).all())
        cal_2025_usadas = set(bien.cal_2025 for bien in Bien.query.filter(Bien.cal_2025 != None).all())

        print(f"Series ya usadas: {len(series_usadas)}")
        print(f"Cal_2025 ya usadas: {len(cal_2025_usadas)}\n")

        print("Importando bienes faltantes...")

        for idx, row in enumerate(bienes_faltantes, 1):
            try:
                codigo = row['codigo_patrimonial']
                serie_val = row['serie']
                cal_2025_val = row['cal_2025']

                # Limpiar nulls
                if not serie_val or serie_val == '':
                    serie_val = None
                if not cal_2025_val or cal_2025_val == '':
                    cal_2025_val = None

                # Evitar duplicados
                if serie_val and serie_val in series_usadas:
                    serie_val = None
                else:
                    if serie_val:
                        series_usadas.add(serie_val)

                if cal_2025_val and cal_2025_val in cal_2025_usadas:
                    cal_2025_val = None
                else:
                    if cal_2025_val:
                        cal_2025_usadas.add(cal_2025_val)

                # Validar que sede_id existe
                sede_id = row['sede_id']
                if not sede_id or sede_id <= 0:
                    sede_id = 1  # Default

                # Validar que unidad_id existe
                unidad_id = row['unidad_id']
                if not unidad_id or unidad_id <= 0:
                    unidad_id = 1  # Default

                # Truncar campos si es necesario
                denominacion = truncate_field('denominacion', row['denominacion'])
                responsable = truncate_field('responsable', row['responsable'])
                usuario_registro = truncate_field('usuario_registro', row['usuario_registro'])
                marca = truncate_field('marca', row['marca'])
                modelo = truncate_field('modelo', row['modelo'])

                # Crear bien
                nuevo_bien = Bien(
                    codigo_patrimonial=codigo,
                    denominacion=denominacion,
                    marca=marca,
                    modelo=modelo,
                    serie=serie_val,
                    estado=row['estado'],
                    responsable=responsable,
                    usuario_registro=usuario_registro,
                    ubicacion_texto=row['ubicacion_texto'],
                    observaciones=row['observaciones'],
                    cal_2020=row['cal_2020'],
                    cal_2021=row['cal_2021'],
                    cal_2022=row['cal_2022'],
                    cal_2023=row['cal_2023'],
                    cal_2024=row['cal_2024'],
                    cal_2025=cal_2025_val,
                    sede_id=sede_id,
                    unidad_id=unidad_id,
                    fecha_registro=datetime.now()
                )

                db.session.add(nuevo_bien)
                stats['insertados'] += 1

                # Commit cada 100 registros (uno por uno fue lento)
                if idx % 100 == 0:
                    db.session.commit()
                    pct = int(idx / len(bienes_faltantes) * 100)
                    print(f"  {idx}/{len(bienes_faltantes)} ({pct}%) - Insertados: {stats['insertados']}, Errores: {stats['errores']}")

            except Exception as e:
                db.session.rollback()
                stats['errores'] += 1
                if stats['errores'] <= 5:
                    print(f"  [ERROR] {codigo}: {str(e)[:60]}")

        # Commit final
        db.session.commit()

        # Resumen
        print("\n" + "="*70)
        print("IMPORTACION COMPLETADA")
        print("="*70)
        print(f"  Bienes faltantes:  {len(bienes_faltantes)}")
        print(f"  Bienes insertados: {stats['insertados']}")
        print(f"  Errores:           {stats['errores']}")

        # Verificación
        total_final = Bien.query.count()
        print(f"\n  Total en PostgreSQL ANTES:  11458")
        print(f"  Total en PostgreSQL AHORA:  {total_final}")
        print(f"  Diferencia:                 {total_final - 11458}")

        if total_final >= 12000:
            print("\n[OK] MIGRACION COMPLETADA EXITOSAMENTE")
        else:
            print(f"\n[ADVERTENCIA] Faltaron {len(bienes_faltantes) - stats['insertados']} bienes")

        print("="*70 + "\n")

    except Exception as e:
        print(f"ERROR FATAL: {str(e)}")
        import traceback
        traceback.print_exc()
    finally:
        cursor.close()
        conn_sqlite.close()
