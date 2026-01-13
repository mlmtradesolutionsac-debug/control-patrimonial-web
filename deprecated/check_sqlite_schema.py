import sqlite3
import os

db_path = 'data/inventario_patrimonial.db'

if not os.path.exists(db_path):
    print(f"Error: No se encuentra {db_path}")
    exit(1)

conn = sqlite3.connect(db_path)
cursor = conn.cursor()

print(f"--- ESQUEMA DE LA TABLA 'bienes' EN SQLITE ---")
try:
    cursor.execute("PRAGMA table_info(bienes)")
    columns = cursor.fetchall()
    for col in columns:
        print(col)
except Exception as e:
    print(f"Error: {e}")

conn.close()
