#!/usr/bin/env python3
"""
Gestor universal de usuarios para SQLite y PostgreSQL

Funciona automáticamente en desarrollo (SQLite) y producción (PostgreSQL)

Uso:
    python scripts/manage_users.py list                    # Listar usuarios
    python scripts/manage_users.py create <user> <pass>    # Crear usuario
    python scripts/manage_users.py delete <user>           # Eliminar usuario
    python scripts/manage_users.py change-pass <user> <pass>  # Cambiar contraseña
"""

import sys
import os
from pathlib import Path
from datetime import datetime

# Agregar directorio raíz al path
sys.path.insert(0, str(Path(__file__).parent.parent))

from wsgi import app
from app import db
from app.models_sqlalchemy import UsuarioApp
from scripts.db_helper import (
    print_db_info, require_confirmation, print_success,
    print_error, print_warning, print_info, print_separator,
    get_db_info, get_db_stats
)


def hash_password(password):
    """Genera hash SHA-256 de la contraseña."""
    import hashlib
    return hashlib.sha256(password.encode()).hexdigest()


def list_users():
    """Lista todos los usuarios existentes."""
    print_separator("USUARIOS EN LA BASE DE DATOS")

    with app.app_context():
        usuarios = UsuarioApp.query.all()

        if not usuarios:
            print_warning("No hay usuarios registrados")
            return

        print(f"{'Usuario':<20} {'Cargo':<20} {'Activo':<10} {'Creado':<20}")
        print("-" * 70)

        for user in usuarios:
            activo = "Sí" if user.activo else "No"
            creado = user.fecha_creacion.strftime('%Y-%m-%d %H:%M') if user.fecha_creacion else "N/A"
            print(f"{user.usuario:<20} {user.cargo:<20} {activo:<10} {creado:<20}")

        print(f"\nTotal de usuarios: {len(usuarios)}")


def create_user(username, password, cargo="OPERADOR"):
    """Crea un nuevo usuario."""
    print_separator(f"CREAR NUEVO USUARIO: {username}")

    with app.app_context():
        # Verificar si ya existe
        user_exists = UsuarioApp.query.filter_by(usuario=username).first()
        if user_exists:
            print_error(f"El usuario '{username}' ya existe")
            return False

        try:
            password_hash = hash_password(password)

            nuevo_usuario = UsuarioApp(
                usuario=username,
                password=password_hash,
                cargo=cargo.upper(),
                activo=True,
                fecha_creacion=datetime.now()
            )

            db.session.add(nuevo_usuario)
            db.session.commit()

            print_success(f"Usuario '{username}' creado exitosamente")
            print_info(f"Cargo:        {cargo.upper()}")
            print_info(f"Contraseña:   {password}")
            print_info(f"Activo:       Sí")

            return True

        except Exception as e:
            db.session.rollback()
            print_error(f"Error al crear usuario: {str(e)}")
            return False


def delete_user(username):
    """Elimina un usuario."""
    print_separator(f"ELIMINAR USUARIO: {username}")

    with app.app_context():
        usuario = UsuarioApp.query.filter_by(usuario=username).first()

        if not usuario:
            print_error(f"Usuario '{username}' no encontrado")
            return False

        # Pedir confirmación
        if not require_confirmation(f"¿Estás seguro de que deseas eliminar el usuario '{username}'?"):
            print_warning("Operación cancelada")
            return False

        try:
            db.session.delete(usuario)
            db.session.commit()
            print_success(f"Usuario '{username}' eliminado")
            return True

        except Exception as e:
            db.session.rollback()
            print_error(f"Error al eliminar usuario: {str(e)}")
            return False


def change_password(username, new_password):
    """Cambia la contraseña de un usuario."""
    print_separator(f"CAMBIAR CONTRASEÑA: {username}")

    with app.app_context():
        usuario = UsuarioApp.query.filter_by(usuario=username).first()

        if not usuario:
            print_error(f"Usuario '{username}' no encontrado")
            return False

        try:
            password_hash = hash_password(new_password)
            usuario.password = password_hash
            db.session.commit()

            print_success(f"Contraseña actualizada para '{username}'")
            print_info(f"Nueva contraseña: {new_password}")
            return True

        except Exception as e:
            db.session.rollback()
            print_error(f"Error al cambiar contraseña: {str(e)}")
            return False


def create_default_operadores():
    """Crea los 6 operadores por defecto."""
    print_separator("CREAR OPERADORES POR DEFECTO")

    operadores = [
        ('acajas', '123456'),
        ('afernandez', '123456'),
        ('equiñonez', '123456'),
        ('jcoronado', '123456'),
        ('osandi', '123456'),
        ('rcalderon', '123456'),
    ]

    created = 0
    skipped = 0

    with app.app_context():
        for usuario, password in operadores:
            user_exists = UsuarioApp.query.filter_by(usuario=usuario).first()

            if user_exists:
                print_warning(f"  {usuario}: Ya existe")
                skipped += 1
            else:
                try:
                    password_hash = hash_password(password)
                    nuevo_usuario = UsuarioApp(
                        usuario=usuario,
                        password=password_hash,
                        cargo="OPERADOR",
                        activo=True,
                        fecha_creacion=datetime.now()
                    )
                    db.session.add(nuevo_usuario)
                    created += 1
                    print_success(f"  {usuario}: Creado")

                except Exception as e:
                    print_error(f"  {usuario}: Error - {str(e)}")

        db.session.commit()

    print_separator()
    print(f"Creados: {created}")
    print(f"Saltados: {skipped}")
    print()


def show_help():
    """Muestra ayuda."""
    help_text = """
GESTOR DE USUARIOS - Control Patrimonial

Funciona automáticamente en Desarrollo (SQLite) y Producción (PostgreSQL)

COMANDOS:

  python scripts/manage_users.py list
    Listar todos los usuarios

  python scripts/manage_users.py create <usuario> <contraseña> [cargo]
    Crear un nuevo usuario
    Ejemplo: python scripts/manage_users.py create miusuario 123456 OPERADOR

  python scripts/manage_users.py delete <usuario>
    Eliminar un usuario (pide confirmación)

  python scripts/manage_users.py change-pass <usuario> <contraseña>
    Cambiar contraseña de un usuario

  python scripts/manage_users.py default
    Crear los 6 operadores por defecto (acajas, afernandez, etc.)

  python scripts/manage_users.py info
    Mostrar información de la base de datos actual

NOTAS:
- Los cambios se aplican inmediatamente en la base de datos actual
- Las contraseñas se almacenan hasheadas (SHA-256)
- Los operadores están en tabla 'usuarios_app'
- Los administradores están en tabla 'usuarios'
"""
    print(help_text)


def main():
    """Función principal."""
    if len(sys.argv) < 2:
        print_db_info()
        print_info("Use: python scripts/manage_users.py --help")
        show_help()
        return

    comando = sys.argv[1].lower()

    if comando == 'list':
        print_db_info()
        list_users()

    elif comando == 'create':
        if len(sys.argv) < 4:
            print_error("Uso: python scripts/manage_users.py create <usuario> <contraseña> [cargo]")
            return

        usuario = sys.argv[2]
        password = sys.argv[3]
        cargo = sys.argv[4] if len(sys.argv) > 4 else "OPERADOR"

        print_db_info()
        create_user(usuario, password, cargo)

    elif comando == 'delete':
        if len(sys.argv) < 3:
            print_error("Uso: python scripts/manage_users.py delete <usuario>")
            return

        usuario = sys.argv[2]
        print_db_info()
        delete_user(usuario)

    elif comando == 'change-pass':
        if len(sys.argv) < 4:
            print_error("Uso: python scripts/manage_users.py change-pass <usuario> <contraseña>")
            return

        usuario = sys.argv[2]
        password = sys.argv[3]

        print_db_info()
        change_password(usuario, password)

    elif comando == 'default':
        print_db_info()
        create_default_operadores()

    elif comando == 'info':
        print_db_info()
        stats = get_db_stats()
        print("ESTADÍSTICAS:")
        print(f"  Bienes:             {stats['bienes']}")
        print(f"  Sedes:              {stats['sedes']}")
        print(f"  Unidades:           {stats['unidades']}")
        print(f"  Usuarios Admin:     {stats['usuarios_admin']}")
        print(f"  Usuarios Operadores: {stats['usuarios_operadores']}")
        print()

    elif comando in ['help', '--help', '-h']:
        show_help()

    else:
        print_error(f"Comando desconocido: {comando}")
        print_info("Use: python scripts/manage_users.py --help")


if __name__ == '__main__':
    main()
