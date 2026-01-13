import sqlite3

def inspect_users():
    conn = sqlite3.connect('data/inventario_patrimonial.db')
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM usuarios_app LIMIT 1")
    print([d[0] for d in cursor.description])
    conn.close()

if __name__ == "__main__":
    inspect_users()
