import sys
import os
import sys

# Agregar el directorio raíz al path para poder importar app
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))

from dotenv import load_dotenv
load_dotenv()

from app import create_app
from app.models_sqlalchemy import Usuario, UsuarioApp
from config import DevelopmentConfig, ProductionConfig

def check_users():
    flask_env = os.environ.get('FLASK_ENV', 'development')
    print(f"Ambiente detectado: {flask_env}")
    
    if flask_env == 'production':
        app = create_app(ProductionConfig)
    else:
        app = create_app(DevelopmentConfig)

    with app.app_context():
        print("\n=== USUARIOS ADMINISTRADORES (Tabla: usuarios) ===")
        try:
            admins = Usuario.query.all()
            if not admins:
                print("No hay usuarios administradores creados.")
            for u in admins:
                print(f"User: {u.usuario} | Nombre: {u.nombre} | Rol: {u.rol}")
        except Exception as e:
            print(f"Error consultando tabla usuarios: {e}")
            print("Probablemente la tabla no existe. Ejecuta 'flask db upgrade'.")

        print("\n=== USUARIOS APP (Tabla: usuarios_app) ===")
        try:
            apps = UsuarioApp.query.all()
            if not apps:
                print("No hay usuarios de app creados.")
            for u in apps:
                print(f"User: {u.username} | Nombre: {u.nombre} | Rol: {u.rol} | Activo: {u.activo}")
        except Exception as e:
            print(f"Error consultando tabla usuarios_app: {e}")
            print("Probablemente la tabla no existe. Ejecuta 'flask db upgrade'.")

if __name__ == "__main__":
    check_users()
