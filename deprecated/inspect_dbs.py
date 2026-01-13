import sqlite3
import os

paths = [
    r"e:\PROYECTOS WEB\control_patrimonial_web\data\inventario_patrimonial.db",
    r"e:\PROYECTOS WEB\inventario2025\data\inventario_patrimonial.db"
]

for p in paths:
    print(f"--- Checking {p} ---")
    if not os.path.exists(p):
        print("File does not exist")
        continue
        
    try:
        conn = sqlite3.connect(p)
        cursor = conn.cursor()
        cursor.execute("PRAGMA table_info(bienes)")
        columns = cursor.fetchall()
        col_names = [c[1] for c in columns]
        print(f"Columns in 'bienes': {col_names}")
        
        if 'sede' in col_names:
            print("Has 'sede' column: YES")
        else:
            print("Has 'sede' column: NO")
            
        if 'sede_id' in col_names:
            print("Has 'sede_id' column: YES")
        else:
            print("Has 'sede_id' column: NO")
            
        conn.close()
    except Exception as e:
        print(f"Error: {e}")
    print("\n")
