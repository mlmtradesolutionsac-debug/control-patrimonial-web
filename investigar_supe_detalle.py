#!/usr/bin/env python3
"""
Investigación detallada: Bienes SUPE y CAL 2025
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
    print("INVESTIGACIÓN DETALLADA: SUPE - ¿POR QUÉ FALTA INVENTARIO?")
    print("="*80)

    # Obtener sede SUPE
    sede_supe = Sede.query.filter(Sede.nombre.ilike('SUPE')).first()

    if not sede_supe:
        print("ERROR: Sede SUPE no encontrada")
        sys.exit(1)

    print(f"\nSede: {sede_supe.nombre} (ID: {sede_supe.id})")
    print("-" * 80)

    # 1. Estadísticas SUPE
    print("\n1. ESTADÍSTICAS SEDE SUPE:")
    print("-" * 80)

    total_supe = Bien.query.filter_by(sede_id=sede_supe.id).count()
    con_cal_supe = Bien.query.filter_by(sede_id=sede_supe.id).filter(
        Bien.cal_2025.isnot(None),
        Bien.cal_2025 != ''
    ).count()
    sin_cal_supe = total_supe - con_cal_supe

    avance_supe = (con_cal_supe / total_supe * 100) if total_supe > 0 else 0

    print(f"  Total bienes en SUPE:           {total_supe:,}")
    print(f"  Con CAL 2025:                   {con_cal_supe:,}")
    print(f"  SIN CAL 2025 (no inventariados):{sin_cal_supe:,}")
    print(f"  Avance:                         {avance_supe:.2f}%")

    # 2. Responsables en SUPE
    print("\n2. RESPONSABLES EN SUPE:")
    print("-" * 80)

    responsables_supe = Bien.query.filter_by(sede_id=sede_supe.id).with_entities(
        Bien.responsable,
        func.count(Bien.id).label('total'),
        func.count(func.nullif(Bien.cal_2025, '')).label('con_cal')
    ).group_by(Bien.responsable).filter(
        Bien.responsable.isnot(None),
        Bien.responsable != ''
    ).order_by(
        func.count(Bien.id).desc()
    ).all()

    print(f"{'Responsable':<50} {'Total':<8} {'CAL 2025':<10} {'Avance':<10}")
    print("-" * 80)
    for resp, total, con_cal in responsables_supe:
        porcentaje = (con_cal / total * 100) if total > 0 else 0
        print(f"{resp:<50} {total:>8} {con_cal:>10} {porcentaje:>9.1f}%")

    # 3. Comparar con otras sedes
    print("\n3. COMPARACIÓN CON OTRAS SEDES (¿Tienen CAL 2025?):")
    print("-" * 80)

    estadisticas = Bien.query.with_entities(
        Sede.nombre,
        func.count(Bien.id).label('total'),
        func.count(func.nullif(Bien.cal_2025, '')).label('con_cal')
    ).join(Sede).group_by(Sede.nombre).order_by(
        func.count(Bien.id).desc()
    ).all()

    print(f"{'Sede':<40} {'Bienes':<10} {'CAL 2025':<10} {'Avance %':<10}")
    print("-" * 80)
    for sede_name, total, con_cal in estadisticas:
        porcentaje = (con_cal / total * 100) if total > 0 else 0
        marker = ">>>" if 'supe' in sede_name.lower() else "   "
        print(f"{marker} {sede_name:<37} {total:>10} {con_cal:>10} {porcentaje:>9.1f}%")

    # 4. Ver algunos bienes de SUPE sin CAL 2025
    print("\n4. PRIMEROS 10 BIENES DE SUPE SIN CAL 2025:")
    print("-" * 80)

    bienes_sin_cal = Bien.query.filter_by(sede_id=sede_supe.id).filter(
        Bien.cal_2025.is_(None) | (Bien.cal_2025 == '')
    ).limit(10).all()

    print(f"{'Código Patrimonial':<20} {'Denominación':<50} {'Responsable':<40}")
    print("-" * 80)
    for bien in bienes_sin_cal:
        print(f"{bien.codigo_patrimonial:<20} {(bien.denominacion[:48] if bien.denominacion else 'N/A'):<50} {(bien.responsable[:38] if bien.responsable else 'N/A'):<40}")

    # 5. Investigar si hay registros nuevos de ayer
    print("\n5. REGISTROS NUEVOS EN ÚLTIMAS 24 HORAS:")
    print("-" * 80)

    ayer = datetime.now() - timedelta(days=1)
    bienes_ayer_todas = Bien.query.filter(Bien.fecha_registro >= ayer).count() if hasattr(Bien.query.first(), 'fecha_registro') else 0
    bienes_supe_ayer = Bien.query.filter_by(sede_id=sede_supe.id).filter(Bien.fecha_registro >= ayer).count() if hasattr(Bien.query.first(), 'fecha_registro') else 0

    print(f"  Bienes REGISTRADOS en últimas 24h (TODAS sedes): {bienes_ayer_todas}")
    print(f"  Bienes REGISTRADOS en últimas 24h (SUPE): {bienes_supe_ayer}")

    # 6. Conclusión
    print("\n" + "="*80)
    print("ANÁLISIS:")
    print("="*80)

    if total_supe > 0 and con_cal_supe == 0:
        print("""
  ⚠️ HALLAZGO IMPORTANTE:

  ✓ SUPE tiene 2,125 BIENES en el sistema
  ✗ PERO NINGUNO (0%) tiene CAL 2025 capturado

  POSIBLES CAUSAS:

  1. Los operadores estuvieron en SUPE AYER haciendo inventario físico
     PERO AÚN NO han ingresado los valores CAL 2025 en el sistema
     → Esperan para confirmar/guardar los datos

  2. Los operadores capturaron datos en un formulario/tabla temporal
     QUE AÚN NO fue guardado en la base de datos
     → Necesitan completar el proceso de sincronización

  3. Los operadores intentaron guardar datos pero hubo error silencioso
     → Revisar logs de la aplicación y formularios

  RECOMENDACIÓN:

  Pregunta a los operadores que estuvieron en SUPE ayer:
  ¿Ya subieron los datos de CAL 2025 al sistema?
  ¿Ven algún mensaje de error o confirmación?
  ¿Los datos están en algún formulario sin guardar?
        """)
    else:
        print(f"""
  INFORMACIÓN:
  - SUPE ya tiene {total_supe} bienes en el sistema
  - {con_cal_supe} de ellos ya tienen CAL 2025 (avance: {avance_supe:.1f}%)
        """)

    print("="*80 + "\n")
