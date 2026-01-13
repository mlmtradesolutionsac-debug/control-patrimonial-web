#!/usr/bin/env python3
"""
Utilidad de Detección y Manejo de Base de Datos
Detecta automáticamente si se está usando SQLite (desarrollo) o PostgreSQL (producción)
y proporciona funciones comunes para scripts.

Uso:
    from scripts.db_helper import get_db_info, require_confirmation
"""

import os
import sys
from pathlib import Path

# Agregar directorio raíz al path
sys.path.insert(0, str(Path(__file__).parent.parent))

from wsgi import app
from app import db


def get_db_info():
    """
    Detecta y retorna información sobre la base de datos actual.

    Retorna: dict con keys 'type', 'name', 'host', 'is_production'
    """
    with app.app_context():
        engine = db.engine
        url = str(engine.url)

        info = {
            'url': url,
            'is_production': False,
            'is_sqlite': False,
            'is_postgresql': False,
            'database': None,
            'host': None,
            'port': None,
            'user': None,
        }

        if 'sqlite' in url:
            info['is_sqlite'] = True
            info['type'] = 'SQLite (Desarrollo)'
            # Extraer ruta de base de datos
            db_path = url.split('sqlite:///')[-1]
            info['database'] = db_path

        elif 'postgresql' in url or 'postgres' in url:
            info['is_postgresql'] = True
            info['is_production'] = True
            info['type'] = 'PostgreSQL (Producción)'

            # Extraer componentes de URL
            try:
                # Formato: postgresql://user:password@host:port/database
                parts = url.split('://')[-1]  # Quitar postgresql://

                if '@' in parts:
                    creds, host_db = parts.split('@')
                    if ':' in creds:
                        user, password = creds.split(':')
                    else:
                        user = creds
                        password = None
                    info['user'] = user

                    if ':' in host_db:
                        host_port, database = host_db.rsplit('/', 1)
                        if ':' in host_port:
                            host, port = host_port.split(':')
                            info['port'] = int(port)
                        else:
                            host = host_port
                            info['port'] = 5432
                    else:
                        database = host_db
                        host = 'localhost'
                        info['port'] = 5432

                    info['host'] = host
                    info['database'] = database.split('?')[0]  # Quitar parámetros
            except:
                pass
        else:
            info['type'] = 'Desconocida'

        return info


def print_db_info():
    """Imprime información sobre la base de datos actual."""
    info = get_db_info()

    print("\n" + "="*70)
    print("INFORMACIÓN DE BASE DE DATOS")
    print("="*70)

    if info['is_sqlite']:
        print(f"Tipo:       {info['type']}")
        print(f"Ruta:       {info['database']}")
        print(f"Ambiente:   DESARROLLO (SQLite)")

    elif info['is_postgresql']:
        print(f"Tipo:       {info['type']}")
        print(f"Host:       {info['host']}")
        print(f"Puerto:     {info['port']}")
        print(f"Usuario:    {info['user']}")
        print(f"Base Datos: {info['database']}")
        print(f"Ambiente:   PRODUCCIÓN (PostgreSQL)")
    else:
        print(f"Tipo:       {info['type']} (no soportada)")

    print("="*70 + "\n")


def require_confirmation(message, default=False):
    """
    Pide confirmación del usuario para operaciones críticas.

    Args:
        message (str): Mensaje a mostrar
        default (bool): Valor por defecto si el usuario solo presiona Enter

    Returns:
        bool: True si el usuario confirma, False si cancela
    """
    options = "[SÍ/no]" if default else "[sí/NO]"
    default_text = "SÍ" if default else "NO"

    response = input(f"\n⚠️  {message}\n    Responde {options} (default: {default_text}): ").strip().lower()

    if not response:
        return default

    return response in ['s', 'sí', 'si', 'yes', 'y']


def backup_sqlite():
    """Crea un backup de SQLite antes de operaciones destructivas."""
    info = get_db_info()

    if not info['is_sqlite']:
        return None

    db_path = Path(info['database'])
    if not db_path.exists():
        return None

    backup_path = db_path.parent / f"{db_path.name}.backup.{datetime.now().strftime('%Y%m%d_%H%M%S')}"

    import shutil
    try:
        shutil.copy2(db_path, backup_path)
        print(f"✓ Backup creado: {backup_path}")
        return backup_path
    except Exception as e:
        print(f"✗ Error creando backup: {e}")
        return None


def get_db_stats():
    """Retorna estadísticas de la base de datos."""
    from app.models_sqlalchemy import Bien, Usuario, UsuarioApp, Sede, Unidad

    with app.app_context():
        return {
            'bienes': Bien.query.count(),
            'usuarios_admin': Usuario.query.count(),
            'usuarios_operadores': UsuarioApp.query.count(),
            'sedes': Sede.query.count(),
            'unidades': Unidad.query.count(),
        }


def print_separator(title=None):
    """Imprime un separador formateado."""
    if title:
        print(f"\n{'='*70}")
        print(f"{title.center(70)}")
        print(f"{'='*70}\n")
    else:
        print("\n" + "="*70 + "\n")


def print_success(message):
    """Imprime un mensaje de éxito."""
    print(f"✓ {message}")


def print_error(message):
    """Imprime un mensaje de error."""
    print(f"✗ {message}")


def print_warning(message):
    """Imprime un mensaje de advertencia."""
    print(f"⚠️  {message}")


def print_info(message):
    """Imprime un mensaje de información."""
    print(f"ℹ️  {message}")


if __name__ == '__main__':
    # Cuando se ejecuta directamente, mostrar info de la BD
    from datetime import datetime
    print_db_info()

    stats = get_db_stats()
    print("ESTADÍSTICAS:")
    print(f"  Bienes:            {stats['bienes']}")
    print(f"  Sedes:             {stats['sedes']}")
    print(f"  Unidades:          {stats['unidades']}")
    print(f"  Usuarios Admin:    {stats['usuarios_admin']}")
    print(f"  Usuarios Operadores: {stats['usuarios_operadores']}")
    print()
