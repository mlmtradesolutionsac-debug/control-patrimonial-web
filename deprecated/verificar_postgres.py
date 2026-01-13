#!/usr/bin/env python3
"""
Verificar qué datos hay en PostgreSQL
"""

import sys
import os
sys.path.insert(0, '/home/patrimonio/control_patrimonial')
os.chdir('/home/patrimonio/control_patrimonial')

from wsgi import app
from app import db
from app.models_sqlalchemy import Bien

with app.app_context():
    print("\n" + "="*70)
    print("VERIFICACIÓN DE DATOS EN POSTGRESQL")
    print("="*70 + "\n")

    # Contar total
    total = db.session.query(Bien).count()
    print(f"Total de bienes en DB: {total}\n")

    # Ver primeros 5
    print("Primeros 5 bienes:")
    primeros = db.session.query(Bien).limit(5).all()
    for bien in primeros:
        print(f"  - ID {bien.id}: {bien.codigo_patrimonial} ({bien.denominacion[:30]}...)")

    # Buscar el bien específico
    print(f"\nBuscando bien 46220050E041...")
    bien = Bien.query.filter_by(codigo_patrimonial='46220050E041').first()
    if bien:
        print(f"  ENCONTRADO - ID {bien.id}")
        print(f"  Responsable: {bien.responsable}")
        print(f"  CAL 2025: {bien.cal_2025}")
    else:
        print(f"  NO ENCONTRADO")

    print("\n" + "="*70 + "\n")
