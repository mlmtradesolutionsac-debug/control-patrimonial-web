#!/usr/bin/env python3
"""
Script para migrar usuario admin a la tabla correcta (usuarios)
"""

import sys
import os
sys.path.insert(0, '/home/patrimonio/control_patrimonial')
os.chdir('/home/patrimonio/control_patrimonial')

from wsgi import app
from app import db
from app.models_sqlalchemy import Usuario, UsuarioApp
import hashlib

def sha256(texto):
    return hashlib.sha256(texto.encode("utf-8")).hexdigest()

print("\n" + "="*70)
print("MIGRAR ADMIN A TABLA USUARIOS")
print("="*70 + "\n")

with app.app_context():
    try:
        # 1. Buscar admin en usuarios_app
        admin_app = UsuarioApp.query.filter_by(username='admin').first()

        if not admin_app:
            print("ERROR: No existe usuario admin en usuarios_app")
            sys.exit(1)

        print(f"✓ Encontrado admin en usuarios_app:")
        print(f"  - Username: {admin_app.username}")
        print(f"  - Nombre: {admin_app.nombre}")
        print(f"  - Password hash: {admin_app.password_hash[:20]}...")

        # 2. Verificar si ya existe en usuarios
        admin_users = Usuario.query.filter_by(usuario='admin').first()
        if admin_users:
            print("\nADVERTENCIA: Admin ya existe en tabla usuarios")
            print(f"  - Usuario: {admin_users.usuario}")
            print(f"  - Nombre: {admin_users.nombre}")
            print("\nNo se realizará migración (ya existe en ambas tablas)")
            sys.exit(0)

        # 3. Crear nuevo admin en tabla usuarios
        print("\nCreando admin en tabla usuarios...")
        nuevo_admin = Usuario(
            usuario='admin',
            nombre=admin_app.nombre,
            password=admin_app.password_hash,  # Usar mismo hash
            rol='admin'
        )

        db.session.add(nuevo_admin)
        db.session.flush()  # Ejecutar INSERT pero no commit aún

        print(f"✓ Admin creado en tabla usuarios")

        # 4. Eliminar admin de usuarios_app
        print("\nEliminando admin de usuarios_app...")
        db.session.delete(admin_app)

        # 5. Confirmar cambios
        db.session.commit()

        print(f"✓ Admin eliminado de usuarios_app")

        print("\n" + "="*70)
        print("MIGRACIÓN COMPLETADA EXITOSAMENTE")
        print("="*70)
        print("\nVerificación:")

        # Verificar resultado
        admin_check = Usuario.query.filter_by(usuario='admin').first()
        if admin_check:
            print(f"✓ Admin en tabla usuarios: {admin_check.usuario}")

        admin_app_check = UsuarioApp.query.filter_by(username='admin').first()
        if not admin_app_check:
            print(f"✓ Admin NO está en usuarios_app (eliminado correctamente)")

        print(f"\n{'='*70}\n")

    except Exception as e:
        db.session.rollback()
        print(f"ERROR: {str(e)}")
        import traceback
        traceback.print_exc()
        sys.exit(1)
