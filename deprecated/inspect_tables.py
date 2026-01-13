import sqlite3
import os

db_path = r"e:\PROYECTOS WEB\control_patrimonial_web\data\inventario_patrimonial.db"

conn = sqlite3.connect(db_path)
cursor = conn.cursor()

tables = ['sedes', 'unidades', 'ambientes', 'usuarios', 'usuarios_app']

for t in tables:
    print(f"--- Table: {t} ---")
    try:
        cursor.execute(f"PRAGMA table_info({t})")
        columns = cursor.fetchall()
        if not columns:
            print("Table does not exist.")
        else:
            for c in columns:
                print(c)
                
        # Show first 5 rows
        if columns:
            print("Content sample:")
            cursor.execute(f"SELECT * FROM {t} LIMIT 5")
            rows = cursor.fetchall()
            for r in rows:
                print(r)
    except Exception as e:
        print(f"Error: {e}")
    print("\n")

conn.close()
