#!/usr/bin/env python3
"""
Script para crear un nuevo usuario en la BD local
"""

import os
import sys
from pathlib import Path

# Agregar el directorio al path
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

# Configurar entorno para desarrollo
os.environ['FLASK_ENV'] = 'development'

def crear_usuario():
    """Crear nuevo usuario"""

    print("=" * 80)
    print("CREAR NUEVO USUARIO EN BASE DE DATOS")
    print("=" * 80)

    try:
        from app import create_app, db
        from app.models_sqlalchemy import UsuarioApp, hash_password
        from config import DevelopmentConfig

        # Crear app con configuración de desarrollo (SQLite)
        app = create_app(DevelopmentConfig)

        with app.app_context():
            print("\n[1/3] Verificando conexión a la BD local...")

            try:
                count = UsuarioApp.query.count()
                print(f"[OK] Conectado a BD local (SQLite)")
                print(f"  Usuarios actuales: {count}\n")
            except Exception as e:
                print(f"[ERROR] Error de conexión: {e}")
                return False

            # Datos del nuevo usuario
            username = "jsanchez"
            nombre = "SANCHEZ SAENZ JHON FLAVIO"
            rol = "inventariador"
            password = "jsanchez123"  # Contraseña temporal

            print("[2/3] Validando datos del usuario...")

            # Verificar si ya existe
            usuario_existe = UsuarioApp.query.filter_by(username=username).first()
            if usuario_existe:
                print(f"[ADVERTENCIA] El usuario '{username}' ya existe en la BD")
                return False

            print(f"  Username: {username}")
            print(f"  Nombre: {nombre}")
            print(f"  Rol: {rol}\n")

            print("[3/3] Creando usuario...")

            # Crear nuevo usuario
            nuevo_usuario = UsuarioApp(
                username=username,
                nombre=nombre,
                password_hash=hash_password(password),
                rol=rol,
                activo=1
            )

            db.session.add(nuevo_usuario)
            db.session.commit()

            print("[OK] Usuario creado exitosamente!\n")

            print("=" * 80)
            print("DATOS DEL NUEVO USUARIO")
            print("=" * 80)
            print(f"Username: {username}")
            print(f"Nombre completo: {nombre}")
            print(f"Rol: {rol}")
            print(f"Contraseña temporal: {password}")
            print(f"Estado: Activo")
            print("\n⚠️  IMPORTANTE:")
            print("  1. El usuario debe cambiar su contraseña en el primer login")
            print("  2. URL de login: https://control-patrimonial-195522615542.us-central1.run.app/auth/login")
            print(f"  3. Compartir credenciales de forma segura")
            print("=" * 80)

            return True

    except Exception as e:
        print(f"\n[ERROR] Error al crear usuario: {e}")
        import traceback
        traceback.print_exc()
        return False

if __name__ == '__main__':
    success = crear_usuario()
    sys.exit(0 if success else 1)
