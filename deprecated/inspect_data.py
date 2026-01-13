import sqlite3

def inspect():
    conn = sqlite3.connect('data/inventario_patrimonial.db')
    cursor = conn.cursor()
    
    print("--- Columns in bienes ---")
    cursor.execute("PRAGMA table_info(bienes)")
    columns = [row[1] for row in cursor.fetchall()]
    print(columns)
    
    print("\n--- Sample Data (first 3 rows) ---")
    cursor.execute("SELECT * FROM bienes LIMIT 3")
    rows = cursor.fetchall()
    for row in rows:
        print(row)

    print("\n--- Sedes ---")
    cursor.execute("SELECT * FROM sedes")
    print(cursor.fetchall())

    conn.close()

if __name__ == "__main__":
    inspect()
