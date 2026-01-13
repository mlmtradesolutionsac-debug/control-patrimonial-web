
import sys
import os
from flask import Flask

# Add project root to path
sys.path.append(os.getcwd())

from dotenv import load_dotenv
load_dotenv()

from app import create_app
from app.utils import validate_bien_data
from config import DevelopmentConfig

app = create_app(DevelopmentConfig)

def test_validation():
    with app.app_context():
        print("Testing validation with dummy data...")
        
        # Simulate form data
        data = {
            'codigo_patrimonial': 'TEST-001',
            'denominacion': 'Test Item',
            'sede': '1',
            'dependencia': '1',
            'estado': 'b',
            'cod_barras': '',
            'serie': '',
            'cal_2025': ''
        }
        
        try:
            errors = validate_bien_data(data, bien_id=1)
            print(f"Validation result: {errors}")
        except Exception as e:
            print(f"CRASH in validation: {e}")
            import traceback
            traceback.print_exc()

if __name__ == "__main__":
    test_validation()
