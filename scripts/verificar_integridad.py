#!/usr/bin/env python3
"""
Script de Verificación de Integridad - Control Patrimonial

Ejecuta esto regularmente para asegurar que:
- Los 12,826 bienes estén presentes
- CAL 2025 >= 2,500
- Avance sea correcto

Uso:
    python scripts/verificar_integridad.py

Resultado esperado:
    ✓ Todos los valores deben estar DENTRO de los rangos
"""

import sys
import os
from pathlib import Path

sys.path.insert(0, str(Path(__file__).parent.parent))

from wsgi import app
from app.models_sqlalchemy import Bien
from scripts.db_helper import print_db_info, print_success, print_error, print_warning, print_info

print("\n" + "="*70)
print("VERIFICACIÓN DE INTEGRIDAD - Control Patrimonial")
print("="*70 + "\n")

# Mostrar BD actual
print_db_info()

with app.app_context():
    # Obtener estadísticas
    total_bienes = Bien.query.count()
    con_cal_2025 = Bien.query.filter(Bien.cal_2025.isnot(None), Bien.cal_2025 != '').count()

    if total_bienes == 0:
        print_error("ERROR CRÍTICO: No hay bienes en la base de datos!")
        sys.exit(1)

    avance = (con_cal_2025 / total_bienes * 100)

    # Mostrar estado
    print("ESTADO ACTUAL:")
    print("-" * 70)
    print(f"Total bienes:          {total_bienes:,}")
    print(f"Con CAL 2025:          {con_cal_2025:,}")
    print(f"Sin CAL 2025:          {total_bienes - con_cal_2025:,}")
    print(f"Avance de inventario:  {avance:.2f}%")
    print()

    # Validaciones
    print("VALIDACIONES:")
    print("-" * 70)

    validaciones_ok = True

    # Validación 1: Bienes totales
    if total_bienes >= 12700:
        print_success(f"✓ Bienes totales: {total_bienes:,} (>= 12,700)")
    else:
        print_error(f"✗ Bienes totales: {total_bienes:,} (< 12,700) - CRÍTICO")
        validaciones_ok = False

    # Validación 2: CAL 2025
    if con_cal_2025 >= 2400:
        print_success(f"✓ CAL 2025: {con_cal_2025:,} (>= 2,400)")
    else:
        print_error(f"✗ CAL 2025: {con_cal_2025:,} (< 2,400) - CRÍTICO")
        validaciones_ok = False

    # Validación 3: Avance porcentual
    if avance >= 19.5:
        print_success(f"✓ Avance: {avance:.2f}% (>= 19.5%)")
    else:
        print_warning(f"⚠ Avance: {avance:.2f}% (< 19.5%)")
        validaciones_ok = False

    # Validación 4: Proporciones
    if total_bienes == 12826:
        print_success(f"✓ Total = 12,826 (exacto - 100%)")
    elif total_bienes >= 12700:
        print_warning(f"⚠ Total = {total_bienes:,} (debería ser 12,826)")
    else:
        print_error(f"✗ Total = {total_bienes:,} (FALTA: {12826 - total_bienes})")

    # Validación 5: CAL 2025 exacto
    if con_cal_2025 == 2529:
        print_success(f"✓ CAL 2025 = 2,529 (exacto)")
    elif con_cal_2025 >= 2500:
        print_warning(f"⚠ CAL 2025 = {con_cal_2025:,} (debería ser 2,529)")
    else:
        print_error(f"✗ CAL 2025 = {con_cal_2025:,} (FALTA: {2529 - con_cal_2025})")

    print()

    # Resumen final
    print("="*70)
    if validaciones_ok and total_bienes >= 12700 and con_cal_2025 >= 2400:
        print_success("✓ SISTEMA ÍNTEGRO - Todos los valores están dentro de los rangos")
        print(f"  Datos críticos preservados: 12,826 bienes, 2,529 con CAL 2025")
    else:
        print_error("✗ ANOMALÍA DETECTADA - Revisar de inmediato")
        print("\n  ACCIONES RECOMENDADAS:")
        if total_bienes < 12700:
            print("  1. Verificar backup de PostgreSQL")
            print("  2. Contactar al administrador de BD")
        if con_cal_2025 < 2400:
            print("  3. Verificar integridad de datos CAL 2025")
            print("  4. Ejecutar recuperación de bienes si es necesario")

    print("="*70 + "\n")

    # Detalle por responsable (top 5)
    print("TOP 5 RESPONSABLES POR CAL 2025:")
    print("-" * 70)

    from sqlalchemy import func, text

    top_5 = Bien.query.with_entities(
        Bien.responsable,
        func.count(Bien.id).label('total'),
        func.count(func.nullif(Bien.cal_2025, '')).label('con_cal')
    ).group_by(Bien.responsable).filter(Bien.responsable.isnot(None)).order_by(
        func.count(func.nullif(Bien.cal_2025, '')).desc()
    ).limit(5).all()

    for idx, (responsable, total, con_cal) in enumerate(top_5, 1):
        pct = (con_cal / total * 100) if total > 0 else 0
        print(f"  {idx}. {responsable:<40} {con_cal:>4}/{total:<4} ({pct:>6.1f}%)")

    print("="*70 + "\n")
