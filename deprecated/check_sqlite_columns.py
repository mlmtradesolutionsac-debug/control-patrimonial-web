import sqlite3

DB_PATH = 'data/inventario_patrimonial.db'

def check_columns():
    conn = sqlite3.connect(DB_PATH)
    cursor = conn.cursor()
    cursor.execute("PRAGMA table_info(bienes)")
    columns = [row[1] for row in cursor.fetchall()]
    conn.close()
    
    print("Columnas en SQLite 'bienes':")
    for col in columns:
        print(f"- {col}")
        
    if 'sede' in columns:
        print("\n¡CONFIRMADO! Existe la columna 'sede' que entra en conflicto con la relación ORM.")

if __name__ == '__main__':
    check_columns()
