import sqlite3
import os

db_path = 'data/inventario_patrimonial.db'

def check_duplicates(cursor, field, label):
    print(f"\n--- Verificando duplicados en '{label}' ({field}) ---")
    query = f"""
        SELECT {field}, COUNT(*) 
        FROM bienes 
        WHERE {field} IS NOT NULL AND {field} != '' 
        GROUP BY {field} 
        HAVING COUNT(*) > 1
        ORDER BY COUNT(*) DESC
        LIMIT 10
    """
    try:
        cursor.execute(query)
        dupes = cursor.fetchall()
        if dupes:
            print(f"⚠ SE ENCONTRARON DUPLICADOS EN {label}!")
            total_dupes = 0
            for val, count in dupes:
                print(f"  - '{val}': {count} veces")
                total_dupes += count
            print(f"  (Y más...)")
        else:
            print(f"✓ No hay duplicados en {label}")
    except Exception as e:
        print(f"Error verificando {label}: {e}")

if not os.path.exists(db_path):
    print("No se encuentra la DB")
else:
    conn = sqlite3.connect(db_path)
    cursor = conn.cursor()
    
    # Contar total
    cursor.execute("SELECT COUNT(*) FROM bienes")
    total = cursor.fetchone()[0]
    print(f"Total de bienes en SQLite: {total}")

    # Chequear campos únicos
    check_duplicates(cursor, 'codigo_patrimonial', 'CÓDIGO PATRIMONIAL')
    check_duplicates(cursor, 'cod_barras', 'CÓDIGO DE BARRAS')
    check_duplicates(cursor, 'serie', 'SERIE')
    check_duplicates(cursor, 'cal_2025', 'CAL 2025')

    conn.close()
