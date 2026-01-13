import os
from sqlalchemy import create_engine, text

print("--- BUSCANDO DATOS ---")

# 1. Verificar SQLite (La base de datos original)
try:
    db_path = os.path.abspath('data/inventario_patrimonial.db')
    sqlite_uri = f"sqlite:///{db_path}"
    engine = create_engine(sqlite_uri)
    with engine.connect() as conn:
        count = conn.execute(text("SELECT count(*) FROM bienes")).scalar()
    print(f"[SQLite] {db_path}: {count} registros encontrados.")
except Exception as e:
    print(f"[SQLite] Error: {e}")

# 2. Verificar PostgreSQL (Con la URI que pusimos en el código)
try:
    # Esta es la URI que hardcodeamos
    pg_uri = 'postgresql://control_patrimonial:5e365a257260b0d6cac9687c189ad05c11cd251aedf3ac81@localhost:5432/control_patrimonial'
    engine = create_engine(pg_uri)
    with engine.connect() as conn:
        count = conn.execute(text("SELECT count(*) FROM bienes")).scalar()
    print(f"[PostgreSQL Hardcoded] {pg_uri}: {count} registros encontrados.")
except Exception as e:
    print(f"[PostgreSQL Hardcoded] Error: {e}")

# 3. Verificar PostgreSQL (Con contraseña por defecto 'password')
try:
    pg_uri_def = 'postgresql://control_patrimonial:password@localhost:5432/control_patrimonial'
    engine = create_engine(pg_uri_def)
    with engine.connect() as conn:
        count = conn.execute(text("SELECT count(*) FROM bienes")).scalar()
    print(f"[PostgreSQL Default] {pg_uri_def}: {count} registros encontrados.")
except Exception as e:
    print(f"[PostgreSQL Default] Error: {e}")
