#!/usr/bin/env python3
"""
Gestor de usuario administrador para SQLite y PostgreSQL

IMPORTANTE: El admin debe estar en tabla 'usuarios', NO en 'usuarios_app'

Uso:
    python scripts/manage_admin.py create    # Crear/resetear admin
    python scripts/manage_admin.py check     # Verificar admin
    python scripts/manage_admin.py reset     # Resetear contraseña del admin
"""

import sys
import os
from pathlib import Path
from datetime import datetime

# Agregar directorio raíz al path
sys.path.insert(0, str(Path(__file__).parent.parent))

from wsgi import app
from app import db
from app.models_sqlalchemy import Usuario
from scripts.db_helper import (
    print_db_info, require_confirmation, print_success,
    print_error, print_warning, print_info, print_separator,
    get_db_info
)


def hash_password(password, method='sha256'):
    """
    Genera hash de la contraseña.

    Soporta dos métodos:
    - sha256: Para la mayoría de casos
    - bcrypt: Para nuevas implementaciones (requiere bcrypt)
    """
    if method == 'sha256':
        import hashlib
        return hashlib.sha256(password.encode()).hexdigest()

    elif method == 'bcrypt':
        try:
            from werkzeug.security import generate_password_hash
            return generate_password_hash(password, method='pbkdf2:sha256')
        except:
            print_warning("bcrypt no disponible, usando SHA-256 como fallback")
            import hashlib
            return hashlib.sha256(password.encode()).hexdigest()

    else:
        raise ValueError(f"Método de hash desconocido: {method}")


def check_admin():
    """Verifica el estado del administrador."""
    print_separator("VERIFICAR ADMINISTRADOR")

    with app.app_context():
        # Buscar en tabla correcta (usuarios)
        admin_en_usuarios = Usuario.query.filter_by(username='admin').first()

        # Buscar en tabla incorrecta (usuarios_app)
        from app.models_sqlalchemy import UsuarioApp
        admin_en_usuarios_app = UsuarioApp.query.filter_by(usuario='admin').first()

        print("Estado:")
        if admin_en_usuarios:
            print_success(f"  Admin EN TABLA CORRECTA (usuarios)")
            print(f"    Username:    admin")
            print(f"    is_admin:    {admin_en_usuarios.is_admin}")
            print(f"    Creado:      {admin_en_usuarios.date_created if hasattr(admin_en_usuarios, 'date_created') else 'N/A'}")

        else:
            print_warning(f"  Admin NO en tabla usuarios")

        if admin_en_usuarios_app:
            print_warning(f"  Admin EN TABLA INCORRECTA (usuarios_app) ⚠️")
            print(f"    Este admin NO tiene acceso a panel de administración")
            print_info(f"    Se debe migrar a tabla 'usuarios'")

        if not admin_en_usuarios and not admin_en_usuarios_app:
            print_error(f"  No hay admin configurado en ninguna tabla")
            return False

        return bool(admin_en_usuarios)


def create_admin(password, username='admin'):
    """Crea un nuevo administrador (o sobrescribe uno existente)."""
    print_separator(f"CREAR/RESETEAR ADMINISTRADOR")

    with app.app_context():
        # Verificar si ya existe
        admin_existing = Usuario.query.filter_by(username=username).first()

        if admin_existing:
            print_warning(f"Admin '{username}' ya existe, se actualizará")

            if not require_confirmation("¿Deseas continuar?"):
                print_warning("Operación cancelada")
                return False

            try:
                password_hash = hash_password(password)
                admin_existing.password = password_hash
                admin_existing.is_admin = True
                db.session.commit()

                print_success(f"Contraseña del admin '{username}' actualizada")
                print_info(f"Username:   {username}")
                print_info(f"Contraseña: {password}")
                print_info(f"is_admin:   True")

                return True

            except Exception as e:
                db.session.rollback()
                print_error(f"Error actualizando admin: {str(e)}")
                return False
        else:
            # Crear nuevo
            try:
                password_hash = hash_password(password)

                nuevo_admin = Usuario(
                    username=username,
                    password=password_hash,
                    is_admin=True
                )

                if hasattr(nuevo_admin, 'date_created'):
                    nuevo_admin.date_created = datetime.now()

                db.session.add(nuevo_admin)
                db.session.commit()

                print_success(f"Administrador '{username}' creado exitosamente")
                print_info(f"Username:   {username}")
                print_info(f"Contraseña: {password}")
                print_info(f"is_admin:   True")

                return True

            except Exception as e:
                db.session.rollback()
                print_error(f"Error creando admin: {str(e)}")
                return False


def reset_password(new_password, username='admin'):
    """Resetea la contraseña del admin."""
    print_separator(f"RESETEAR CONTRASEÑA DEL ADMIN")

    with app.app_context():
        admin = Usuario.query.filter_by(username=username).first()

        if not admin:
            print_error(f"Admin '{username}' no encontrado en tabla 'usuarios'")
            print_info("¿Quizás esté en tabla 'usuarios_app'? Usa 'manage_users.py' para ese caso.")
            return False

        try:
            password_hash = hash_password(new_password)
            admin.password = password_hash
            db.session.commit()

            print_success(f"Contraseña del admin '{username}' reseteada")
            print_info(f"Contraseña: {new_password}")

            return True

        except Exception as e:
            db.session.rollback()
            print_error(f"Error reseteando contraseña: {str(e)}")
            return False


def remove_conflicting_admin():
    """Elimina admin de tabla incorrecta (usuarios_app) si existe."""
    print_separator("LIMPIAR ADMIN DE TABLA INCORRECTA")

    with app.app_context():
        from app.models_sqlalchemy import UsuarioApp
        admin_wrong = UsuarioApp.query.filter_by(usuario='admin').first()

        if not admin_wrong:
            print_info("No hay admin en tabla 'usuarios_app'")
            return True

        print_warning(f"Encontrado admin en tabla incorrecta 'usuarios_app'")

        if not require_confirmation("¿Deseas eliminarlo de la tabla incorrecta?"):
            print_warning("Operación cancelada")
            return False

        try:
            db.session.delete(admin_wrong)
            db.session.commit()

            print_success("Admin eliminado de tabla 'usuarios_app'")
            return True

        except Exception as e:
            db.session.rollback()
            print_error(f"Error eliminando admin: {str(e)}")
            return False


def show_help():
    """Muestra ayuda."""
    help_text = """
GESTOR DE ADMINISTRADOR - Control Patrimonial

Gestiona el usuario administrativo. IMPORTANTE: El admin DEBE estar en tabla 'usuarios'

COMANDOS:

  python scripts/manage_admin.py create [contraseña]
    Crear administrador o resetear su contraseña
    Si no das contraseña, se pedirá interactivamente
    Ejemplo: python scripts/manage_admin.py create AdminPass123

  python scripts/manage_admin.py check
    Verificar estado del administrador
    Verifica que esté en tabla correcta

  python scripts/manage_admin.py reset [contraseña]
    Resetear contraseña del admin
    Ejemplo: python scripts/manage_admin.py reset NuevaPass456

IMPORTANTE:
- Admin DEBE estar en tabla 'usuarios' (no en 'usuarios_app')
- Si admin estaba en 'usuarios_app', use 'create' para migrarlo
- Username del admin es siempre: admin
- Los cambios se aplican inmediatamente
"""
    print(help_text)


def main():
    """Función principal."""
    if len(sys.argv) < 2:
        print_db_info()
        print_info("Use: python scripts/manage_admin.py --help")
        show_help()
        return

    comando = sys.argv[1].lower()

    if comando == 'check':
        print_db_info()
        check_admin()

    elif comando == 'create':
        password = None

        if len(sys.argv) > 2:
            password = sys.argv[2]
        else:
            # Pedir contraseña interactivamente
            import getpass
            print()
            password = getpass.getpass("Ingresa contraseña para admin: ")
            password2 = getpass.getpass("Confirma contraseña: ")

            if password != password2:
                print_error("Las contraseñas no coinciden")
                return

        print_db_info()

        # Primero crear/resetear el admin en tabla correcta
        success = create_admin(password)

        if success:
            # Luego remover de tabla incorrecta si existe
            remove_conflicting_admin()

    elif comando == 'reset':
        if len(sys.argv) < 3:
            import getpass
            print()
            password = getpass.getpass("Ingresa nueva contraseña para admin: ")
            password2 = getpass.getpass("Confirma contraseña: ")

            if password != password2:
                print_error("Las contraseñas no coinciden")
                return
        else:
            password = sys.argv[2]

        print_db_info()
        reset_password(password)

    elif comando in ['help', '--help', '-h']:
        show_help()

    else:
        print_error(f"Comando desconocido: {comando}")
        print_info("Use: python scripts/manage_admin.py --help")


if __name__ == '__main__':
    main()
