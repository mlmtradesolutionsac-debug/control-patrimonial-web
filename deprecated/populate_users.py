import sqlite3
import hashlib

def sha256(texto):
    return hashlib.sha256(texto.encode("utf-8")).hexdigest()

USUARIOS = [
    ("acajas", "Alexis Bruno Cajas Garbozo", "operador"),
    ("afernandez", "Amalia Felicita Fernández Huayas", "operador"),
    ("equiñonez", "Enita elena Quiñones Fernández", "operador"),
    ("jcoronado", "Julio José Coronado Araujo", "operador"),
    ("osandi", "Oscar Antonio Sandi Panduro", "operador"),
    ("rcalderon", "Richard Romano Calderón Ydrogo", "operador")
]

def populate():
    db_path = 'data/inventario_patrimonial.db'
    conn = sqlite3.connect(db_path)
    cursor = conn.cursor()

    print("Insertando usuarios...")
    for username, nombre, rol in USUARIOS:
        # Check if exists
        cursor.execute("SELECT username FROM usuarios_app WHERE username = ?", (username,))
        if not cursor.fetchone():
            # Password default: 123456
            pwd_hash = sha256("123456")
            cursor.execute("""
                INSERT INTO usuarios_app (username, nombre, rol, password_hash, activo, require_password_change)
                VALUES (?, ?, ?, ?, 1, 1)
            """, (username, nombre, rol, pwd_hash))
            print(f"Insertado: {username}")
        else:
            print(f"Ya existe: {username}")

    conn.commit()
    conn.close()
    print("Hecho.")

if __name__ == "__main__":
    populate()
