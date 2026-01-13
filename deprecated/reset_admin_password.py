import os
import bcrypt
from sqlalchemy import create_engine, text

# URI Hardcoded
pg_uri = 'postgresql://control_patrimonial:5e365a257260b0d6cac9687c189ad05c11cd251aedf3ac81@localhost:5432/control_patrimonial'

def hash_password(password: str) -> str:
    salt = bcrypt.gensalt(rounds=12)
    return bcrypt.hashpw(password.encode('utf-8'), salt).decode('utf-8')

try:
    engine = create_engine(pg_uri)
    with engine.connect() as conn:
        print("--- RESTABLECIENDO CONTRASEÑA DE ADMIN ---")
        
        # 1. Generar nuevo hash para 'admin'
        new_password = 'admin'
        new_hash = hash_password(new_password)
        
        # 2. Actualizar usuario 'admin'
        result = conn.execute(
            text("UPDATE usuarios SET password = :pwd WHERE usuario = 'admin'"),
            {"pwd": new_hash}
        )
        conn.commit()
        
        print(f"Contraseña actualizada para 'admin'. Nueva clave: {new_password}")
        print("Intenta iniciar sesión ahora.")

except Exception as e:
    print(f"Error: {e}")
