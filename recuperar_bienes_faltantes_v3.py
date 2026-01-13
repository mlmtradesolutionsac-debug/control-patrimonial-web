#!/usr/bin/env python3
"""
Script para recuperar los 668 bienes faltantes - VERSION 3
Trunca TODOS los campos CAL_* que pueden exceder VARCHAR(50)
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

# Límites de campos - INCLUYENDO TODOS LOS CAL_*
FIELD_LIMITS = {
    'codigo_patrimonial': 50,
    'cod_barras': 100,
    'denominacion': 200,
    'marca': 100,
    'modelo': 100,
    'serie': 100,
    'estado': 1,
    'responsable': 200,
    'usuario_registro': 50,
    'cal_2020': 50,
    'cal_2021': 50,
    'cal_2022': 50,  # ¡IMPORTANTE! Tiene valores de hasta 84 chars
    'cal_2023': 50,  # ¡IMPORTANTE! Tiene valores de hasta 84 chars
    'cal_2024': 50,
    'cal_2025': 50,
}

def truncate_field(field_name, value):
    """Truncar valores que exceden el límite del campo"""
    if not value or value == '':
        return value

    limit = FIELD_LIMITS.get(field_name)
    if limit:
        value_str = str(value)
        if len(value_str) > limit:
            # Mostrar advertencia solo para campos críticos
            if field_name in ['cal_2022', 'cal_2023']:
                print(f"    TRUNCANDO {field_name}: {len(value_str)} -> {limit} chars")
            return value_str[:limit]

    return value

print("\n" + "="*70)
print("RECUPERAR BIENES FALTANTES v3 (TRUNCAMIENTO MEJORADO)")
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

        # Analizar cuántos faltantes tienen CAL 2025
        faltantes_con_cal = sum(1 for b in bienes_faltantes if b['cal_2025'] and str(b['cal_2025']).strip())
        print(f"Faltantes CON CAL 2025: {faltantes_con_cal}")
        print(f"Faltantes SIN CAL 2025: {len(bienes_faltantes) - faltantes_con_cal}\n")

        stats = {'insertados': 0, 'errores': 0}

        # Rastrear series y cal_2025 para evitar duplicados UNIQUE
        series_usadas = set(bien.serie for bien in Bien.query.filter(Bien.serie != None).all())
        cal_2025_usadas = set(bien.cal_2025 for bien in Bien.query.filter(Bien.cal_2025 != None).all())

        print(f"Series ya usadas: {len(series_usadas)}")
        print(f"CAL 2025 ya usadas: {len(cal_2025_usadas)}\n")

        print("Importando bienes faltantes...\n")

        for idx, row in enumerate(bienes_faltantes, 1):
            try:
                codigo = row['codigo_patrimonial']
                serie_val = row['serie']
                cal_2025_val = row['cal_2025']

                # Limpiar nulls
                if not serie_val or str(serie_val).strip() == '':
                    serie_val = None
                if not cal_2025_val or str(cal_2025_val).strip() == '':
                    cal_2025_val = None

                # Evitar duplicados en campos UNIQUE
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

                # Validar sede_id y unidad_id
                sede_id = row['sede_id']
                if not sede_id or sede_id <= 0:
                    sede_id = 1
                unidad_id = row['unidad_id']
                if not unidad_id or unidad_id <= 0:
                    unidad_id = 1

                # Truncar TODOS los campos que pueden exceder límites
                denominacion = truncate_field('denominacion', row['denominacion'])
                responsable = truncate_field('responsable', row['responsable'])
                usuario_registro = truncate_field('usuario_registro', row['usuario_registro'])
                marca = truncate_field('marca', row['marca'])
                modelo = truncate_field('modelo', row['modelo'])
                codigo_patrimonial = truncate_field('codigo_patrimonial', row['codigo_patrimonial'])

                # ¡IMPORTANTE! Truncar campos CAL_* que pueden exceder 50
                cal_2020 = truncate_field('cal_2020', row['cal_2020'])
                cal_2021 = truncate_field('cal_2021', row['cal_2021'])
                cal_2022 = truncate_field('cal_2022', row['cal_2022'])  # Puede tener 84 chars
                cal_2023 = truncate_field('cal_2023', row['cal_2023'])  # Puede tener 84 chars
                cal_2024 = truncate_field('cal_2024', row['cal_2024'])
                cal_2025_trunc = truncate_field('cal_2025', cal_2025_val) if cal_2025_val else None

                # Crear bien
                nuevo_bien = Bien(
                    codigo_patrimonial=codigo_patrimonial,
                    denominacion=denominacion,
                    marca=marca,
                    modelo=modelo,
                    serie=serie_val,
                    estado=row['estado'],
                    responsable=responsable,
                    usuario_registro=usuario_registro,
                    ubicacion_texto=row['ubicacion_texto'],
                    observaciones=row['observaciones'],
                    cal_2020=cal_2020,
                    cal_2021=cal_2021,
                    cal_2022=cal_2022,
                    cal_2023=cal_2023,
                    cal_2024=cal_2024,
                    cal_2025=cal_2025_trunc,
                    sede_id=sede_id,
                    unidad_id=unidad_id,
                    fecha_registro=datetime.now()
                )

                db.session.add(nuevo_bien)
                stats['insertados'] += 1

                # Commit cada 50 registros
                if idx % 50 == 0:
                    db.session.commit()
                    pct = int(idx / len(bienes_faltantes) * 100)
                    print(f"  {idx}/{len(bienes_faltantes)} ({pct}%) - Insertados: {stats['insertados']}, Errores: {stats['errores']}")

            except Exception as e:
                db.session.rollback()
                stats['errores'] += 1
                if stats['errores'] <= 10:
                    error_msg = str(e)[:100]
                    print(f"  [ERROR] {codigo}: {error_msg}")

        # Commit final
        try:
            db.session.commit()
        except Exception as e:
            db.session.rollback()
            print(f"\n[ERROR en commit final] {str(e)[:100]}")

        # Resumen
        print("\n" + "="*70)
        print("RECUPERACIÓN COMPLETADA")
        print("="*70)
        print(f"  Bienes faltantes encontrados: {len(bienes_faltantes)}")
        print(f"  Bienes insertados:            {stats['insertados']}")
        print(f"  Errores:                      {stats['errores']}")

        # Verificación
        total_final = Bien.query.count()
        con_cal_final = Bien.query.filter(Bien.cal_2025.isnot(None)).count()

        print(f"\n  Total en PostgreSQL ANTES:    12,158")
        print(f"  Total en PostgreSQL AHORA:    {total_final}")
        print(f"  Bienes recuperados:           {total_final - 12158}")

        print(f"\n  CAL 2025 ANTES:               2,312")
        print(f"  CAL 2025 AHORA:               {con_cal_final}")
        print(f"  CAL 2025 recuperados:         {con_cal_final - 2312}")

        avance_actual = (con_cal_final / total_final * 100) if total_final > 0 else 0
        print(f"\n  AVANCE ACTUAL:                {avance_actual:.2f}%")

        if total_final >= 12800:
            print("\n[✓ OK] RECUPERACIÓN EXITOSA - Todos los bienes recuperados")
        else:
            faltantes_aun = len(bienes_faltantes) - stats['insertados']
            print(f"\n[✓ PROGRESO] {stats['insertados']} de {len(bienes_faltantes)} recuperados")
            if faltantes_aun > 0:
                print(f"[!] Aún faltán {faltantes_aun} bienes por recuperar")

        print("="*70 + "\n")

    except Exception as e:
        print(f"ERROR FATAL: {str(e)}")
        import traceback
        traceback.print_exc()
    finally:
        cursor.close()
        conn_sqlite.close()
