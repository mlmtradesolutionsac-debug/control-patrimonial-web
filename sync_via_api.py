#!/usr/bin/env python3
"""
Sincroniza datos a través del endpoint de importación de la API
usando sesión HTTP con cookies
"""

import requests
import json
from datetime import datetime
from bs4 import BeautifulSoup
import warnings

# Suprimir advertencias de SSL
warnings.filterwarnings('ignore')

# Configuración
API_URL = "https://control-patrimo-web-195522615542.us-central1.run.app"
LOGIN_URL = f"{API_URL}/auth/login"
IMPORT_URL = f"{API_URL}/api/importar/excel"
EXCEL_PATH = r"E:\PROYECTOS WEB\control_patrimonial_web\excel\DATA SIGA 15-12-2025.xlsx"

# Credenciales (usar admin)
USERNAME = "admin"
PASSWORD = "Admin2025"

def main():
    print("="*80)
    print("SINCRONIZACION VIA API")
    print("="*80)

    # Crear sesión
    session = requests.Session()
    session.verify = False  # Para HTTPS sin validación (útil en desarrollo)

    try:
        # Paso 0: Obtener formulario de login para el CSRF token
        print("\n0. Obteniendo CSRF token...")
        login_page = session.get(LOGIN_URL)

        # Extraer token CSRF
        csrf_token = None
        if login_page.status_code == 200:
            soup = BeautifulSoup(login_page.text, 'html.parser')
            csrf_input = soup.find('input', {'name': 'csrf_token'})
            if csrf_input:
                csrf_token = csrf_input.get('value')
                print(f"[OK] Token CSRF obtenido")

        if not csrf_token:
            print("[ERROR] No se pudo obtener el CSRF token")
            return

        # Paso 1: Login
        print("\n1. Autenticando en la API...")
        login_data = {
            'usuario': USERNAME,
            'password': PASSWORD,
            'csrf_token': csrf_token
        }

        # Intentar login
        response = session.post(LOGIN_URL, data=login_data)

        if response.status_code != 200:
            print(f"[ERROR] No se pudo hacer login: {response.status_code}")
            print(f"Response: {response.text}")
            return

        print("[OK] Autenticado correctamente")

        # Paso 2: Verificar estado actual
        print("\n2. Verificando estado actual de la BD en la nube...")
        health_response = session.get(f"{API_URL}/api/health")

        if health_response.status_code == 200:
            print("[OK] API en la nube operacional")
        else:
            print(f"[ERROR] API no disponible: {health_response.status_code}")
            return

        # Paso 3: Importar Excel
        print("\n3. Importando archivo Excel...")
        print(f"   Archivo: {EXCEL_PATH}")

        # Obtener nuevo token CSRF para la importación
        import_page = session.get(IMPORT_URL)
        csrf_token_import = None
        if import_page.status_code == 200:
            soup = BeautifulSoup(import_page.text, 'html.parser')
            csrf_input = soup.find('input', {'name': 'csrf_token'})
            if csrf_input:
                csrf_token_import = csrf_input.get('value')

        with open(EXCEL_PATH, 'rb') as f:
            files = {'archivo': f}
            headers = {}
            if csrf_token_import:
                headers['X-CSRFToken'] = csrf_token_import

            import_response = session.post(IMPORT_URL, files=files, headers=headers)

        if import_response.status_code == 200:
            result = import_response.json()
            print("[OK] Importación completada")

            if 'data' in result:
                data = result['data']
                print(f"\nResultados:")
                print(f"  Creados: {data.get('creados', 0)}")
                print(f"  Actualizados: {data.get('actualizados', 0)}")
                print(f"  Errores: {data.get('errores', 0)}")
                print(f"  Total procesados: {data.get('total_procesados', 0)}")

                if data.get('success'):
                    print("\n[OK] Sincronizacion exitosa")
                else:
                    print("[ADVERTENCIA] Importación completada con errores")

        else:
            print(f"[ERROR] Importación fallida: {import_response.status_code}")
            print(f"Response: {import_response.text}")

    except requests.exceptions.RequestException as e:
        print(f"[ERROR] Error de conexión: {e}")
    except Exception as e:
        print(f"[ERROR] {e}")
        import traceback
        traceback.print_exc()

if __name__ == '__main__':
    main()
