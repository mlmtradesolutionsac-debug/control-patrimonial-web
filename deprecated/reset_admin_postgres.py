#!/usr/bin/env python3
"""
Script para resetear la contraseña del admin en PostgreSQL
"""

import sys
import os
sys.path.insert(0, '/home/patrimonio/control_patrimonial')
os.chdir('/home/patrimonio/control_patrimonial')

from wsgi import app
from app import db
from werkzeug.security import generate_password_hash

print("\n" + "="*70)
print("RESETEAR CONTRASEÑA DEL ADMINISTRADOR")
print("="*70 + "\n")

with app.app_context():
    # Ejecutar SQL directo para ver qué tablas de usuarios existen
    inspector_result = db.session.execute(db.text("""
        SELECT table_name
        FROM information_schema.tables
        WHERE table_schema = 'public'
        AND table_name LIKE '%user%'
    """)).fetchall()

    print("Tablas encontradas:")
    for table in inspector_result:
        print(f"  - {table[0]}")

    # Intentar encontrar la tabla de usuarios
    try:
        # Probar si existe tabla 'usuarios_app'
        resultado = db.session.execute(db.text("SELECT id, username FROM usuarios_app LIMIT 1")).fetchall()
        print("\n✓ Tabla 'usuarios_app' encontrada")

        # Crear o actualizar usuario admin
        nueva_password = "admin123456"
        password_hash = generate_password_hash(nueva_password, method='pbkdf2:sha256')

        # Intentar actualizar
        db.session.execute(db.text("""
            UPDATE usuarios_app
            SET password_hash = :password_hash
            WHERE username = 'admin'
        """), {"password_hash": password_hash})

        db.session.commit()

        print(f"\n✓ Contraseña del admin actualizada:")
        print(f"  Usuario: admin")
        print(f"  Contraseña: {nueva_password}")

    except Exception as e:
        print(f"\nError: {str(e)}")
        print("\nIntentando con tabla 'usuarios'...")

        try:
            # Probar si existe tabla 'usuarios'
            resultado = db.session.execute(db.text("SELECT id, usuario FROM usuarios LIMIT 1")).fetchall()
            print("✓ Tabla 'usuarios' encontrada")

            # Para esta tabla usamos SHA256
            import hashlib
            nueva_password = "admin123456"
            password_hash = hashlib.sha256(nueva_password.encode()).hexdigest()

            db.session.execute(db.text("""
                UPDATE usuarios
                SET password = :password
                WHERE usuario = 'admin'
            """), {"password": password_hash})

            db.session.commit()

            print(f"\n✓ Contraseña del admin actualizada:")
            print(f"  Usuario: admin")
            print(f"  Contraseña: {nueva_password}")

        except Exception as e2:
            print(f"Error: {str(e2)}")
            print("\nNo se pudo resetear la contraseña. Por favor verifica:")
            print("- Que PostgreSQL está corriendo")
            print("- Que la BD está poblada con usuarios")
            sys.exit(1)

print("\n" + "="*70 + "\n")
