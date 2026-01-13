#!/usr/bin/env python3
import sys
import os
sys.path.insert(0, '/home/patrimonio/control_patrimonial')
os.chdir('/home/patrimonio/control_patrimonial')

from wsgi import app
from app import db
from sqlalchemy import inspect

with app.app_context():
    inspector = inspect(db.engine)
    columns = inspector.get_columns('usuarios_app')

    print("\nColumnas en usuarios_app:")
    for col in columns:
        print(f"  - {col['name']}: {col['type']}")
    print()
