import os
from sqlalchemy import create_engine, text

# URI Hardcoded (la misma de app/__init__.py)
pg_uri = 'postgresql://control_patrimonial:5e365a257260b0d6cac9687c189ad05c11cd251aedf3ac81@localhost:5432/control_patrimonial'

try:
    engine = create_engine(pg_uri)
    with engine.connect() as conn:
        print("--- DIAGNÓSTICO DE USUARIOS ---")
        
        # 1. Verificar Usuarios Admin
        try:
            count_admin = conn.execute(text("SELECT count(*) FROM usuarios")).scalar()
            print(f"Usuarios Admin (tabla 'usuarios'): {count_admin}")
            if count_admin > 0:
                users = conn.execute(text("SELECT usuario, rol FROM usuarios LIMIT 5")).fetchall()
                for u in users:
                    print(f"  - {u[0]} ({u[1]})")
        except Exception as e:
            print(f"Error consultando usuarios: {e}")

        # 2. Verificar Usuarios App
        try:
            count_app = conn.execute(text("SELECT count(*) FROM usuarios_app")).scalar()
            print(f"\nUsuarios App (tabla 'usuarios_app'): {count_app}")
            if count_app > 0:
                users = conn.execute(text("SELECT username, rol FROM usuarios_app LIMIT 5")).fetchall()
                for u in users:
                    print(f"  - {u[0]} ({u[1]})")
        except Exception as e:
            print(f"Error consultando usuarios_app: {e}")

except Exception as e:
    print(f"Error de conexión: {e}")
