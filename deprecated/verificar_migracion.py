import os
# Forzar entorno de producción ANTES de importar create_app
os.environ['FLASK_ENV'] = 'production'

from app import create_app
from app.models_sqlalchemy import db, Usuario, UsuarioApp, Bien, Historial, Sede, Unidad
from config import ProductionConfig

app = create_app(ProductionConfig)

with app.app_context():
    print("=== REPORTE DE DATOS EN POSTGRESQL ===")
    try: print(f"Usuarios Admin: {Usuario.query.count()}")
    except: print("Usuarios Admin: Error")
    
    try: print(f"Usuarios App:   {UsuarioApp.query.count()}")
    except: print("Usuarios App: Error")
    
    try: print(f"Sedes:          {Sede.query.count()}")
    except: print("Sedes: Error")
    
    try: print(f"Unidades:       {Unidad.query.count()}")
    except: print("Unidades: Error")
    
    try: print(f"Bienes:         {Bien.query.count()}")
    except: print("Bienes: Error")
    
    try: print(f"Historial:      {Historial.query.count()}")
    except: print("Historial: Error")
    print("======================================")
