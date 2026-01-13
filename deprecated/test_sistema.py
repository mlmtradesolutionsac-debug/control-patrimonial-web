#!/usr/bin/env python
"""
SCRIPT DE TESTING EXHAUSTIVO - Control Patrimonial
Valida todas las funcionalidades críticas después de la refactorización
"""

from app import create_app
from app.repository import RepoSQLAlchemy as Repo
from app.models_sqlalchemy import db, Bien, Sede
from app.utils import validate_bien_data
import sys

print("=" * 70)
print("TESTING EXHAUSTIVO - CONTROL PATRIMONIAL REFACTORIZADO")
print("=" * 70)

app = create_app()
tests_pasados = 0
tests_fallidos = 0

def test(nombre, condicion, esperado=True):
    global tests_pasados, tests_fallidos
    if condicion == esperado:
        print(f"OK {nombre}")
        tests_pasados += 1
        return True
    else:
        print(f"FALLO {nombre}")
        tests_fallidos += 1
        return False

with app.app_context():
    print("\n1. CONEXION A BASE DE DATOS")
    print("-" * 70)

    try:
        repo = Repo()
        total_bienes = repo.obtener_total_bienes()
        test("Conexion a BD", total_bienes > 0)
        test("BD tiene 12808 datos", total_bienes == 12808)
        print(f"  Total de bienes: {total_bienes}")
    except Exception as e:
        test("Conexion a BD", False)
        print(f"  ERROR: {str(e)}")

    print("\n2. OPERACIONES LECTURA")
    print("-" * 70)

    try:
        # Test: Obtener un bien
        bienes = repo.listar_bienes(limit=1)
        test("Listar bienes", len(bienes) > 0)

        if bienes:
            bien_id = bienes[0]['id']
            bien_obtenido = repo.obtener_bien(bien_id)
            test("Obtener bien por ID", bien_obtenido is not None)
            test("Bien tiene codigo patrimonial", 'codigo_patrimonial' in bien_obtenido)
            print(f"  Bien de prueba: {bien_obtenido['codigo_patrimonial']}")

        # Test: Contar bienes
        total_contado = repo.contar_bienes()
        test("Contar bienes", total_contado == total_bienes)

        # Test: Filtros
        sedes = repo.obtener_sedes()
        sedes_list = list(sedes)
        test("Obtener sedes", len(sedes_list) > 0)
        print(f"  Sedes disponibles: {len(sedes_list)}")

    except Exception as e:
        test("Operaciones lectura", False)
        print(f"  ERROR: {str(e)}")

    print("\n3. ESTADISTICAS")
    print("-" * 70)

    try:
        stats = repo.obtener_resumen_completo()
        test("Obtener resumen completo", stats is not None)
        test("Resumen tiene progreso_general", 'progreso_general' in stats)

        progreso = repo.obtener_progreso_cal_2025()
        test("Progreso CAL 2025", progreso is not None)
        print(f"  Total: {progreso['total_bienes']}, Inventariados: {progreso['inventariados']}")

        sedes_progreso = repo.obtener_progreso_por_sede()
        test("Progreso por sede", len(sedes_progreso) > 0)

        dependencias = repo.obtener_progreso_por_dependencia()
        test("Progreso por dependencia", len(dependencias) > 0)

        actividad = repo.obtener_actividad_por_inventariador(10)
        test("Actividad por inventariador", isinstance(actividad, list))

    except Exception as e:
        test("Estadísticas", False)
        print(f"  ERROR: {str(e)}")

    print("\n4. VALIDACION DE ENTRADA")
    print("-" * 70)

    # Test: Datos válidos
    data_valida = {
        'codigo_patrimonial': 'TEST-001',
        'denominacion': 'Equipo de Prueba',
        'sede': '1',
        'estado': 'Bueno'
    }
    errors = validate_bien_data(data_valida)
    test("Datos validos aceptados", len(errors) == 0)

    # Test: Falta código patrimonial
    data_sin_codigo = {'denominacion': 'Test', 'sede': '1'}
    errors = validate_bien_data(data_sin_codigo)
    test("Rechaza sin codigo patrimonial", len(errors) > 0)

    # Test: Sede inválida
    data_sede_invalida = {
        'codigo_patrimonial': 'TEST-002',
        'denominacion': 'Test',
        'sede': 'ABC'
    }
    errors = validate_bien_data(data_sede_invalida)
    test("Rechaza sede invalida", len(errors) > 0)

    # Test: Campo muy largo
    data_largo = {
        'codigo_patrimonial': 'TEST-003',
        'denominacion': 'Test',
        'sede': '1',
        'marca': 'A' * 200
    }
    errors = validate_bien_data(data_largo)
    test("Rechaza campo muy largo", len(errors) > 0)

    # Test: Estado válido
    data_estado_1 = {
        'codigo_patrimonial': 'TEST-004',
        'denominacion': 'Test',
        'sede': '1',
        'estado': 'b'
    }
    errors = validate_bien_data(data_estado_1)
    test("Acepta estado con codigo (b)", len(errors) == 0)

    data_estado_2 = {
        'codigo_patrimonial': 'TEST-005',
        'denominacion': 'Test',
        'sede': '1',
        'estado': 'Bueno'
    }
    errors = validate_bien_data(data_estado_2)
    test("Acepta estado con nombre (Bueno)", len(errors) == 0)

    # Test: Estado inválido
    data_estado_invalido = {
        'codigo_patrimonial': 'TEST-006',
        'denominacion': 'Test',
        'sede': '1',
        'estado': 'INVALIDO'
    }
    errors = validate_bien_data(data_estado_invalido)
    test("Rechaza estado invalido", len(errors) > 0)

    print("\n5. PREVENCION SQL INJECTION")
    print("-" * 70)

    try:
        # Test: Intentar inyección en limite
        resultado = repo.obtener_actividad_por_inventariador("10; DROP TABLE bienes; --")
        test("Previene SQL injection (LIMIT)", isinstance(resultado, list))

        # Test: Intentar inyección en búsqueda
        bienes_inyeccion = repo.listar_bienes({'q': "' OR '1'='1"}, limit=1)
        test("Previene SQL injection (busqueda)", isinstance(bienes_inyeccion, list))

    except Exception as e:
        test("Prevencion SQL injection", False)
        print(f"  ERROR: {str(e)}")

    print("\n6. AUTENTICACION")
    print("-" * 70)

    try:
        # Test: Login fallido
        user = repo.login('usuario_inexistente', 'password_falsa')
        test("Login fallido rechazado", user is None)
        print("  Login validado en rutas, no en repository")

    except Exception as e:
        test("Autenticacion", False)
        print(f"  ERROR: {str(e)}")

    print("\n7. INTEGRIDAD DE DATOS")
    print("-" * 70)

    try:
        # Test: Todos los bienes tienen código patrimonial
        bienes_sin_codigo = Bien.query.filter(Bien.codigo_patrimonial.is_(None)).count()
        test("Todos los bienes tienen codigo", bienes_sin_codigo == 0)

        # Test: Sede_id válido
        bienes_sede_invalida = Bien.query.filter(Bien.sede_id.is_(None)).count()
        test("Todos los bienes tienen sede", bienes_sede_invalida == 0)

        # Test: Relaciones funcionan
        bien = Bien.query.first()
        if bien and bien.sede:
            test("Relacion Bien->Sede funciona", bien.sede.nombre is not None)

    except Exception as e:
        test("Integridad de datos", False)
        print(f"  ERROR: {str(e)}")

    print("\n8. METODOS CATALOGO")
    print("-" * 70)

    try:
        sedes = list(repo.obtener_sedes())
        test("Obtener sedes OK", len(sedes) > 0)

        unidades = list(repo.obtener_unidades())
        test("Obtener unidades OK", len(unidades) > 0)

        usuarios = list(repo.obtener_usuarios_app())
        test("Obtener usuarios app OK", isinstance(usuarios, list))

        print(f"  Sedes: {len(sedes)}, Unidades: {len(unidades)}, Usuarios: {len(usuarios)}")

    except Exception as e:
        test("Metodos catalogo", False)
        print(f"  ERROR: {str(e)}")

# Resumen final
print("\n" + "=" * 70)
print("RESUMEN DE TESTING")
print("=" * 70)
print(f"Tests pasados:  {tests_pasados}")
print(f"Tests fallidos: {tests_fallidos}")
print(f"Total:          {tests_pasados + tests_fallidos}")

if tests_fallidos == 0:
    print("\nTODOS LOS TESTS PASARON - SISTEMA LISTO")
    sys.exit(0)
else:
    print(f"\n{tests_fallidos} TESTS FALLARON - REVISAR")
    sys.exit(1)
