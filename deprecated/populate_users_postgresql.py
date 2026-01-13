#!/usr/bin/env python3
"""
Script para crear usuarios operadores e inventariadores en PostgreSQL
Reemplaza el populate_users.py que estaba usando SQLite
"""

import sys
import os
sys.path.insert(0, '/home/patrimonio/control_patrimonial')
os.chdir('/home/patrimonio/control_patrimonial')

from wsgi import app
from app import db
import hashlib

def sha256(texto):
    return hashlib.sha256(texto.encode("utf-8")).hexdigest()

# Datos de usuarios operadores e inventariadores
USUARIOS = [
    ("acajas", "Alexis Bruno Cajas Garbozo", "operador"),
    ("afernandez", "Amalia Felicita Fernández Huayas", "operador"),
    ("equiñonez", "Enita elena Quiñones Fernández", "operador"),
    ("jcoronado", "Julio José Coronado Araujo", "operador"),
    ("osandi", "Oscar Antonio Sandi Panduro", "operador"),
    ("rcalderon", "Richard Romano Calderón Ydrogo", "operador")
]

print("\n" + "="*70)
print("CREAR USUARIOS OPERADORES EN POSTGRESQL")
print("="*70 + "\n")

with app.app_context():
    try:
        stats = {'insertados': 0, 'actualizados': 0, 'errores': 0}

        for username, nombre, rol in USUARIOS:
            try:
                # Verificar si existe
                resultado = db.session.execute(db.text(
                    "SELECT username FROM usuarios_app WHERE username = :username"
                ), {"username": username}).fetchone()

                if resultado:
                    print(f"✓ Ya existe: {username}")
                    stats['actualizados'] += 1
                else:
                    # Password default: 123456
                    pwd_hash = sha256("123456")

                    # Insertar nuevo usuario
                    db.session.execute(db.text("""
                        INSERT INTO usuarios_app (username, nombre, rol, password_hash, activo)
                        VALUES (:username, :nombre, :rol, :password_hash, :activo)
                    """), {
                        "username": username,
                        "nombre": nombre,
                        "rol": rol,
                        "password_hash": pwd_hash,
                        "activo": 1
                    })

                    db.session.commit()
                    print(f"✓ Insertado: {username}")
                    stats['insertados'] += 1

            except Exception as e:
                db.session.rollback()
                print(f"ERROR con {username}: {str(e)}")
                stats['errores'] += 1

        print("\n" + "="*70)
        print("RESUMEN")
        print("="*70)
        print(f"  Insertados: {stats['insertados']}")
        print(f"  Actualizados: {stats['actualizados']}")
        print(f"  Errores: {stats['errores']}")
        print(f"\nContraseña default: 123456")
        print(f"{'='*70}\n")

    except Exception as e:
        print(f"ERROR FATAL: {str(e)}")
        import traceback
        traceback.print_exc()
        sys.exit(1)
