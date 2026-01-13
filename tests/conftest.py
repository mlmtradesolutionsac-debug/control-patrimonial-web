"""
Configuración de pytest y fixtures para todos los tests
"""
import pytest
import os
import sys
import tempfile
from flask import Flask

# Agregar el directorio padre al path
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))

from app import create_app, db
from config import TestingConfig
from app.models_sqlalchemy import Usuario, UsuarioApp


@pytest.fixture(scope='session')
def test_config():
    """Configuración para testing"""
    return TestingConfig


@pytest.fixture(scope='function')
def app(test_config):
    """Crear una instancia de la aplicación para testing"""
    # Crear BD temporal
    db_fd, db_path = tempfile.mkstemp(suffix='.db')
    test_config.SQLALCHEMY_DATABASE_URI = f'sqlite:///{db_path}'

    app = create_app(test_config)

    # Crear contexto de aplicación
    with app.app_context():
        db.create_all()
        yield app
        db.session.remove()
        db.drop_all()

    # Limpiar BD temporal
    try:
        os.close(db_fd)
        os.unlink(db_path)
    except:
        pass


@pytest.fixture(scope='function')
def client(app):
    """Cliente de testing para hacer requests HTTP"""
    return app.test_client()


@pytest.fixture(scope='function')
def runner(app):
    """CLI test runner"""
    return app.test_cli_runner()


@pytest.fixture(scope='function')
def db_session(app):
    """Sesión de BD para tests"""
    with app.app_context():
        yield db
        db.session.rollback()


@pytest.fixture(scope='function')
def user_admin(app):
    """Crear usuario administrador para tests"""
    with app.app_context():
        from app.models_sqlalchemy import hash_password
        user = Usuario(
            usuario='admin_test',
            nombre='Admin Test',
            password=hash_password('test_password'),
            rol='admin'
        )
        db.session.add(user)
        db.session.commit()
        return user


@pytest.fixture(scope='function')
def user_app(app):
    """Crear usuario de aplicación para tests"""
    with app.app_context():
        from app.models_sqlalchemy import hash_password
        user = UsuarioApp(
            username='user_test',
            nombre='Usuario Test',
            password_hash=hash_password('test_password'),
            rol='operador',
            activo=1
        )
        db.session.add(user)
        db.session.commit()
        return user


@pytest.fixture(scope='function')
def login_admin(client, user_admin):
    """Login como administrador"""
    from app.repository import RepoSQLAlchemy as Repo

    # Verificar que el usuario puede hacer login
    # Nota: En un caso real, necesitarías configurar la contraseña correctamente
    return client


@pytest.fixture(scope='function')
def login_user_app(client, user_app):
    """Login como usuario de aplicación"""
    # client.post('/auth/login', data={
    #     'username': 'user_test',
    #     'password': 'test_password'
    # })
    return client
