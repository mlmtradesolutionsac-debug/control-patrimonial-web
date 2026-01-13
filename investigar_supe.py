#!/usr/bin/env python3
"""
Script de investigación: ¿Por qué falta inventario SUPE?
"""

import sys
import os
sys.path.insert(0, '/home/patrimonio/control_patrimonial')
os.chdir('/home/patrimonio/control_patrimonial')

from wsgi import app
from app.models_sqlalchemy import Bien, Sede
from sqlalchemy import func, text
from datetime import datetime, timedelta

with app.app_context():
    print("\n" + "="*80)
    print("INVESTIGACIÓN: INVENTARIO SEDE SUPE - FALTA DE REGISTROS")
    print("="*80)

    # 1. Buscar sede SUPE
    print("\n1. BUSCANDO SEDE SUPE:")
    print("-" * 80)
    sedes = Sede.query.filter(Sede.nombre.ilike('%supe%')).all()
    if sedes:
        for sede in sedes:
            print(f"  Sede ID: {sede.id}, Nombre: {sede.nombre}")
            bienes_sede = Bien.query.filter_by(sede_id=sede.id).count()
            print(f"  Bienes en esta sede: {bienes_sede}")
    else:
        print("  ALERTA: No se encontró sede con nombre SUPE")
        print("  Listando todas las sedes disponibles:")

    # 2. Ver todas las sedes disponibles
    print("\n2. TODAS LAS SEDES EN SISTEMA:")
    print("-" * 80)
    todas_sedes = Sede.query.order_by(Sede.nombre).all()

    supe_found = False
    for idx, sede in enumerate(todas_sedes, 1):
        bienes_count = Bien.query.filter_by(sede_id=sede.id).count()
        cal_count = Bien.query.filter_by(sede_id=sede.id).filter(
            Bien.cal_2025.isnot(None),
            Bien.cal_2025 != ''
        ).count()

        if 'supe' in sede.nombre.lower():
            print(f"  *** {sede.id}: {sede.nombre:<45} ({bienes_count:>5} bienes, {cal_count:>4} CAL 2025) ***")
            supe_found = True
        else:
            print(f"  {sede.id}: {sede.nombre:<45} ({bienes_count:>5} bienes, {cal_count:>4} CAL 2025)")

    if not supe_found:
        print("\n  ⚠️ NO SE ENCONTRÓ NINGUNA SEDE CON NOMBRE SUPE")
        print("  Posibles nombres alternativos para SUPE:")
        for sede in todas_sedes:
            if any(x in sede.nombre.upper() for x in ['SU', 'PE', 'SUPE', '120']):
                print(f"     → {sede.nombre}")

    # 3. Bienes registrados hoy
    print("\n3. BIENES REGISTRADOS HOY:")
    print("-" * 80)
    hoy_inicio = datetime.now().replace(hour=0, minute=0, second=0, microsecond=0)
    bienes_hoy = Bien.query.filter(Bien.fecha_registro >= hoy_inicio).count() if hasattr(Bien.query.first(), 'fecha_registro') else 0
    print(f"  Total bienes registrados hoy: {bienes_hoy}")

    # 4. Responsables de SUPE (si existe)
    print("\n4. TOP RESPONSABLES CON MÁS BIENES:")
    print("-" * 80)
    responsables = Bien.query.with_entities(
        Bien.responsable,
        func.count(Bien.id).label('total'),
        func.count(func.nullif(Bien.cal_2025, '')).label('con_cal')
    ).group_by(Bien.responsable).filter(
        Bien.responsable.isnot(None),
        Bien.responsable != ''
    ).order_by(
        func.count(Bien.id).desc()
    ).limit(15).all()

    for resp, total, con_cal in responsables:
        porcentaje = (con_cal / total * 100) if total > 0 else 0
        print(f"  {resp:<45} {total:>6} bienes ({con_cal:>5} CAL 2025) {porcentaje:>6.1f}%")

    # 5. Resumen por sede (ordenado por cantidad)
    print("\n5. RESUMEN POR SEDE (Top 20):")
    print("-" * 80)
    print(f"{'Sede':<45} {'Bienes':<8} {'CAL2025':<10} {'Avance':<10}")
    print("-" * 80)

    stats = Bien.query.with_entities(
        Sede.nombre,
        func.count(Bien.id).label('total'),
        func.count(func.nullif(Bien.cal_2025, '')).label('con_cal_2025')
    ).join(Sede).group_by(Sede.nombre).order_by(
        func.count(Bien.id).desc()
    ).all()

    for sede_nombre, total, con_cal in stats[:20]:
        porcentaje = (con_cal / total * 100) if total > 0 else 0
        marker = "***" if 'supe' in sede_nombre.lower() else "   "
        print(f"{marker} {sede_nombre:<42} {total:>8} {con_cal:>10} {porcentaje:>9.1f}%")

    # 6. Total global
    print("\n6. TOTALES GLOBALES:")
    print("-" * 80)
    total_global = Bien.query.count()
    cal_global = Bien.query.filter(Bien.cal_2025.isnot(None), Bien.cal_2025 != '').count()
    avance_global = (cal_global / total_global * 100) if total_global > 0 else 0
    print(f"  Total bienes: {total_global:,}")
    print(f"  Con CAL 2025: {cal_global:,}")
    print(f"  Avance: {avance_global:.2f}%")

    print("\n" + "="*80 + "\n")
