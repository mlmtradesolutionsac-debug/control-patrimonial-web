#!/usr/bin/env python3
"""
Script para crear usuario admin en PostgreSQL
"""

import sys
import os
sys.path.insert(0, '/home/patrimonio/control_patrimonial')
os.chdir('/home/patrimonio/control_patrimonial')

from wsgi import app
from app import db
import hashlib
from datetime import datetime

print("\n" + "="*70)
print("CREAR USUARIO ADMINISTRADOR")
print("="*70 + "\n")

with app.app_context():
    try:
        # Crear usuario admin con werkzeug
        username = "admin"
        nueva_password = "admin123456"
        nombre = "Administrador Sistema"

        # Usar SHA256 que es más compacto que pbkdf2
        password_hash = hashlib.sha256(nueva_password.encode()).hexdigest()

        # Insertar directamente con SQL (solo los campos que existen)
        db.session.execute(db.text("""
            INSERT INTO usuarios_app (username, password_hash, nombre, rol, activo)
            VALUES (:username, :password_hash, :nombre, :rol, :activo)
            ON CONFLICT (username) DO UPDATE
            SET password_hash = EXCLUDED.password_hash
        """), {
            "username": username,
            "password_hash": password_hash,
            "nombre": nombre,
            "rol": "admin",
            "activo": 1
        })

        db.session.commit()

        print("✓ Usuario administrador creado/actualizado exitosamente:")
        print(f"\n  Usuario: {username}")
        print(f"  Contraseña: {nueva_password}")
        print(f"  Rol: admin")
        print(f"  Estado: Activo")

        print("\n" + "="*70)
        print("Puedes ingresar con estas credenciales")
        print("="*70 + "\n")

    except Exception as e:
        db.session.rollback()
        print(f"ERROR: {str(e)}")
        import traceback
        traceback.print_exc()
        sys.exit(1)
