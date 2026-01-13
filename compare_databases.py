#!/usr/bin/env python3
import sqlite3
import os

# Archivos a verificar
databases = [
    'data/inventario_patrimonial.db',
    'data/inventario_patrimonial.db.backup_20251203_193132',
    'data/inventario_patrimonial.db.backup_20251203_193259',
    'data/inventario_patrimonial.db.backup_20251203_195911',
    'data/inventario_patrimonial.db.backup_before_restructure',
    'data/inventario.db.backup_20251114_121206',
]

print('=== COMPARACIÓN DE BASES DE DATOS - CÓDIGO DE BARRAS ===\n')

results = []

for db_path in databases:
    if os.path.exists(db_path):
        try:
            conn = sqlite3.connect(db_path)
            cursor = conn.cursor()

            # Contar bienes con código de barras (no nulos, no vacíos, no 'None')
            cursor.execute("SELECT COUNT(*) FROM bienes WHERE cod_barras IS NOT NULL AND cod_barras != '' AND cod_barras != 'None'")
            con_codigo = cursor.fetchone()[0]

            # Total de bienes
            cursor.execute("SELECT COUNT(*) FROM bienes")
            total = cursor.fetchone()[0]

            # Muestra de algunos códigos
            cursor.execute("SELECT DISTINCT cod_barras FROM bienes WHERE cod_barras IS NOT NULL AND cod_barras != '' LIMIT 5")
            samples = [row[0] for row in cursor.fetchall()]

            conn.close()

            result = {
                'path': db_path,
                'total': total,
                'con_codigo': con_codigo,
                'sin_codigo': total - con_codigo,
                'samples': samples,
                'status': 'OK'
            }
            results.append(result)

        except Exception as e:
            result = {
                'path': db_path,
                'status': f'ERROR: {str(e)}'
            }
            results.append(result)
    else:
        result = {
            'path': db_path,
            'status': 'NO EXISTE'
        }
        results.append(result)

# Mostrar resultados
for r in results:
    print(f'{r["path"]}:')
    if r['status'] == 'OK':
        print(f'  Total bienes: {r["total"]}')
        print(f'  Con código: {r["con_codigo"]}')
        print(f'  Sin código: {r["sin_codigo"]}')
        if r['samples']:
            print(f'  Ejemplos: {r["samples"][:3]}')
    else:
        print(f'  Status: {r["status"]}')
    print()
