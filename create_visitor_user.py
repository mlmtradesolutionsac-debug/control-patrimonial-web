#!/usr/bin/env python
"""Script para crear usuario visitor con permisos de solo lectura"""

import os
from dotenv import load_dotenv

# Cargar variables de entorno
basedir = os.path.abspath(os.path.dirname(__file__))
load_dotenv(os.path.join(basedir, '.env'))

from config import Config
from app.models_sqlalchemy import db, UsuarioApp, hash_password
from flask import Flask

print("=" * 60)
print("CREAR USUARIO: visitor")
print("=" * 60)

# Crear app
app = Flask(__name__)
app.config.from_object(Config)

# Asegurar que SQLALCHEMY_DATABASE_URI esté configurado
if not app.config.get('SQLALCHEMY_DATABASE_URI'):
    app.config['SQLALCHEMY_DATABASE_URI'] = os.environ.get('DATABASE_URL')
    print(f"   DATABASE_URL desde env: {app.config['SQLALCHEMY_DATABASE_URI'][:50]}...")

db.init_app(app)

with app.app_context():
    try:
        # Verificar si el usuario visitor ya existe
        usuario_existente = db.session.query(UsuarioApp).filter_by(username='visitor').first()

        if usuario_existente:
            print("✓ Usuario 'visitor' ya existe")
            print(f"  Username: {usuario_existente.username}")
            print(f"  Nombre: {usuario_existente.nombre}")
            print(f"  Rol: {usuario_existente.rol}")
            print(f"  Activo: {usuario_existente.activo}")
        else:
            print("! Usuario 'visitor' NO existe. Creando...")

            # Crear usuario visitor con hash bcrypt
            password_hash = hash_password('visitor')

            usuario_visitor = UsuarioApp(
                username='visitor',
                nombre='Usuario Visitante',
                password_hash=password_hash,
                rol='visitor',
                activo=1
            )

            db.session.add(usuario_visitor)
            db.session.commit()

            print("✓ Usuario 'visitor' creado exitosamente")
            print(f"  Username: visitor")
            print(f"  Contraseña: visitor")
            print(f"  Rol: visitor")
            print(f"  Permisos: Solo lectura (sin crear, editar, eliminar)")

        print("\n" + "=" * 60)
        print("USUARIO VISITOR LISTO")
        print("=" * 60)
        print("\nPara usar:")
        print("  Usuario: visitor")
        print("  Contraseña: visitor")
        print("\nPermisos:")
        print("  ✓ Ver bienes")
        print("  ✓ Ver fichas")
        print("  ✓ Ver responsables")
        print("  ✓ Ver estadísticas")
        print("  ✗ Crear/Editar/Eliminar")
        print("  ✗ Cambiar datos")

    except Exception as e:
        print(f"\n❌ ERROR: {str(e)}")
        import traceback
        traceback.print_exc()
        import sys
        sys.exit(1)
