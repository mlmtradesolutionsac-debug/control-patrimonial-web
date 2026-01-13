import sys
import os
from dotenv import load_dotenv

# Cargar entorno
load_dotenv()

from app import create_app
from app.repository import RepoSQLAlchemy
from app.models_sqlalchemy import Bien

app = create_app('config.DevelopmentConfig')

def diagnosticar():
    with app.app_context():
        print("=== DIAGNÓSTICO DE BACKEND ===")
        
        # 1. Verificar total de bienes
        total = RepoSQLAlchemy.contar_bienes()
        print(f"Total de bienes en BD: {total}")
        
        # 2. Verificar bienes con cal_2025 (Verificados reales)
        verificados_reales = Bien.query.filter(
            Bien.cal_2025.isnot(None),
            Bien.cal_2025 != ''
        ).count()
        print(f"Bienes con cal_2025 (Verificados reales en DB): {verificados_reales}")
        
        if verificados_reales == 0:
            print("ALERTA: No hay bienes verificados en la base de datos. El filtro devolverá 0 resultados correctamente.")
        
        # 3. Probar Repo con filtro 'verificados'
        filtros = {'verificados': '1'}
        resultados_repo = RepoSQLAlchemy.listar_bienes(filtros)
        count_repo = RepoSQLAlchemy.contar_bienes(filtros)
        
        print(f"Repo.listar_bienes(verificados='1') devolvió: {len(resultados_repo)} items")
        print(f"Repo.contar_bienes(verificados='1') devolvió: {count_repo} items")
        
        if len(resultados_repo) != verificados_reales:
            print("ERROR: El repositorio no está filtrando correctamente.")
        else:
            print("ÉXITO: El repositorio filtra correctamente según la DB.")

        # 4. Probar filtro vacío (simulando 'Limpiar')
        filtros_limpios = {}
        resultados_limpios = RepoSQLAlchemy.listar_bienes(filtros_limpios, limit=5)
        print(f"Repo con filtros vacíos devolvió {len(resultados_limpios)} items (limit 5).")
        
        print("=== FIN DIAGNÓSTICO ===")

if __name__ == "__main__":
    diagnosticar()
