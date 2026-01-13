import os
os.environ['FLASK_ENV'] = 'production'
from app import create_app
from app.models_sqlalchemy import db, Usuario, Sede, Unidad, Bien, Historial
from config import ProductionConfig

app = create_app(ProductionConfig)

with app.app_context():
    print("\n" + "="*50)
    print("DIAGNÓSTICO DE CONEXIÓN")
    print("="*50)
    print(f"URI de Base de Datos: {app.config['SQLALCHEMY_DATABASE_URI']}")
    print("-" * 50)
    
    try:
        print(f"Sedes:     {Sede.query.count()}")
        print(f"Unidades:  {Unidad.query.count()}")
        print(f"Bienes:    {Bien.query.count()}")
        print(f"Historial: {Historial.query.count()}")
    except Exception as e:
        print(f"Error consultando BD: {e}")
    
    print("="*50 + "\n")
