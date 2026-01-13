import sqlite3

SEDES_LIST = [
    "SAENZ PEÑA 120",
    "SUPE",
    "SAENZ PEÑA 177",
    "TERRENO",
    "GRAU",
    "KING 1",
    "KING 2",
    "SAENZ PEÑA 284",
    "SAENZ PEÑA 155",
    "SAENZ PEÑA 157",
    "SAENZ PEÑA 181",
    "PJ 2 DE MAYO",
    "SAENZ PEÑA 175",
    "AEROPUERTO",
    "LINCE"
]

def update_sedes():
    db_path = 'data/inventario_patrimonial.db'
    conn = sqlite3.connect(db_path)
    cursor = conn.cursor()

    print("Current Sedes:")
    cursor.execute("SELECT * FROM sedes")
    for row in cursor.fetchall():
        print(row)

    # Insert new sedes if they don't exist
    print("\nInserting/Updating Sedes...")
    for nombre in SEDES_LIST:
        # Check if exists
        cursor.execute("SELECT id FROM sedes WHERE nombre = ?", (nombre,))
        exists = cursor.fetchone()
        if not exists:
            cursor.execute("INSERT INTO sedes (nombre) VALUES (?)", (nombre,))
            print(f"Inserted: {nombre}")
        else:
            print(f"Exists: {nombre}")

    conn.commit()
    
    print("\nNew Sedes List:")
    cursor.execute("SELECT * FROM sedes")
    for row in cursor.fetchall():
        print(row)

    conn.close()

if __name__ == "__main__":
    update_sedes()
