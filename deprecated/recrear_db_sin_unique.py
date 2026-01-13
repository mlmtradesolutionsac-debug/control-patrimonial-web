#!/usr/bin/env python3
"""
Script para recrear la BD sin la restricción UNIQUE en cal_2025
"""

import os
import sys
sys.path.insert(0, '/home/patrimonio/control_patrimonial')
os.chdir('/home/patrimonio/control_patrimonial')

from wsgi import app
from app import db
from app.models_sqlalchemy import Bien

print("\n" + "="*70)
print("RECREACIÓN DE TABLAS (sin restricción UNIQUE en cal_2025)")
print("="*70 + "\n")

with app.app_context():
    print("1. Eliminando todas las tablas...")
    db.drop_all()
    print("   ✓ Tablas eliminadas")

    print("\n2. Creando tablas nuevamente (con modelo actualizado)...")
    db.create_all()
    print("   ✓ Tablas creadas")

    print("\n3. Verificando estructura de tabla Bien...")
    from sqlalchemy import inspect
    inspector = inspect(db.engine)
    columns = inspector.get_columns('bienes')

    for col in columns:
        if col['name'] == 'cal_2025':
            print(f"   ✓ {col['name']}: {col['type']}")
            print(f"     - Nullable: {col['nullable']}")

    print("\n4. Verificando índices...")
    indexes = inspector.get_indexes('bienes')
    for idx in indexes:
        if 'cal' in idx['name'].lower():
            print(f"   {idx['name']}: {idx['column_names']}")

print("\n" + "="*70)
print("✓ Base de datos recreada exitosamente")
print("="*70 + "\n")
