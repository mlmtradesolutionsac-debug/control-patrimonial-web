#!/usr/bin/env python3
"""
Script de diagnóstico para verificar qué está sucediendo con el bien 46220050E041
"""

import sqlite3
import sys

def connect_db(db_path):
    conn = sqlite3.connect(db_path)
    conn.row_factory = sqlite3.Row
    return conn

def main():
    db_path = "/home/patrimonio/control_patrimonial/data/inventario_patrimonial.db"

    conn = connect_db(db_path)
    cursor = conn.cursor()

    print("\n" + "="*70)
    print("DIAGNÓSTICO DE BIEN 46220050E041")
    print("="*70 + "\n")

    # 1. Buscar por código patrimonial
    print("1. BÚSQUEDA POR CÓDIGO PATRIMONIAL (46220050E041):")
    cursor.execute("SELECT id, codigo_patrimonial, responsable, cal_2025, serie FROM bienes WHERE codigo_patrimonial = '46220050E041'")
    row = cursor.fetchone()
    if row:
        print(f"   ✓ ID: {row['id']}")
        print(f"   ✓ Código: {row['codigo_patrimonial']}")
        print(f"   ✓ Responsable: {row['responsable']}")
        print(f"   ✓ CAL 2025: {row['cal_2025']}")
        print(f"   ✓ Serie: {row['serie']}")
    else:
        print("   ✗ NO ENCONTRADO")

    # 2. Verificar si hay duplicados con ese código
    print("\n2. VERIFICACIÓN DE DUPLICADOS:")
    cursor.execute("SELECT COUNT(*) as cnt FROM bienes WHERE codigo_patrimonial = '46220050E041'")
    cnt = cursor.fetchone()['cnt']
    print(f"   Total de registros: {cnt}")

    # 3. Buscar por serie
    print("\n3. BÚSQUEDA POR SERIE (EL6324800784):")
    cursor.execute("SELECT id, codigo_patrimonial, responsable FROM bienes WHERE serie = 'EL6324800784'")
    rows = cursor.fetchall()
    print(f"   Encontrados: {len(rows)}")
    for row in rows:
        print(f"   - ID {row['id']}: {row['codigo_patrimonial']} → {row['responsable']}")

    # 4. Buscar bienes con denominación similar
    print("\n4. BÚSQUEDA DE ACUMULADORES DE UPS CON DE LA CRUZ:")
    cursor.execute("SELECT id, codigo_patrimonial, responsable FROM bienes WHERE denominacion LIKE '%ACUMULADOR%' AND responsable LIKE '%DE LA CRUZ%' LIMIT 5")
    rows = cursor.fetchall()
    print(f"   Encontrados: {len(rows)}")
    for row in rows:
        print(f"   - ID {row['id']}: {row['codigo_patrimonial']} → {row['responsable']}")

    # 5. Datos completos del bien correcto
    print("\n5. DATOS COMPLETOS DEL BIEN CORRECTO (ID 17994):")
    cursor.execute("SELECT * FROM bienes WHERE id = 17994")
    row = cursor.fetchone()
    if row:
        for key in row.keys():
            print(f"   {key}: {row[key]}")

    print("\n" + "="*70 + "\n")
    conn.close()

if __name__ == '__main__':
    main()
