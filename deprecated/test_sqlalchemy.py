#!/usr/bin/env python3
"""
Script para probar si la aplicación Flask está retornando datos correctos
"""

from wsgi import app
from app.models_sqlalchemy import Bien

print("\n" + "="*70)
print("TEST DE SQLALCHEMY - BIEN 17994")
print("="*70 + "\n")

with app.app_context():
    # Obtener el bien directamente como lo hace la aplicación
    print("1. Obteniendo bien con Bien.query.get(17994)...")
    bien = Bien.query.get(17994)

    if bien:
        print(f"   ✓ Bien encontrado: {bien.codigo_patrimonial}")
        print(f"   ✓ Responsable: {bien.responsable}")
        print(f"   ✓ CAL 2025: {bien.cal_2025}")
        print(f"   ✓ Serie: {bien.serie}")

        print("\n2. Convertiendo a diccionario (to_dict())...")
        bien_dict = bien.to_dict()
        print(f"   ✓ Diccionario creado")
        print(f"   ✓ Responsable en dict: {bien_dict['responsable']}")
        print(f"   ✓ CAL 2025 en dict: {bien_dict['cal_2025']}")

        print("\n3. Primeros 10 datos del diccionario:")
        for i, (key, value) in enumerate(bien_dict.items()):
            if i < 10:
                print(f"   {key}: {value}")
    else:
        print("   ✗ Bien NO encontrado")

print("\n" + "="*70 + "\n")
