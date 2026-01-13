from app import create_app, db
from app.models_sqlalchemy import Usuario, UsuarioApp, verify_password, hash_password
from config import ProductionConfig

app = create_app(ProductionConfig)

with app.app_context():
    print("=== DEBUG LOGIN ===")
    
    # 1. Check Usuario (Admin)
    admin = Usuario.query.filter_by(usuario='admin').first()
    if admin:
        print(f"[Usuario] Found 'admin': ID={admin.id}")
        print(f"  Password Hash: {admin.password[:10]}...")
        is_valid = verify_password('admin', admin.password)
        print(f"  Verify 'admin': {is_valid}")
    else:
        print("[Usuario] 'admin' NOT found in table 'usuarios'")

    # 2. Check UsuarioApp
    app_user = UsuarioApp.query.filter_by(username='admin').first()
    if app_user:
        print(f"[UsuarioApp] Found 'admin': Rol={app_user.rol}, Activo={app_user.activo}")
        print(f"  Password Hash: {app_user.password_hash[:10]}...")
        is_valid = verify_password('admin', app_user.password_hash)
        print(f"  Verify 'admin': {is_valid}")
    else:
        print("[UsuarioApp] 'admin' NOT found in table 'usuarios_app'")

    # 3. Test Hash
    test_hash = hash_password('admin')
    print(f"\nTest Hash 'admin': {test_hash[:10]}...")
    print(f"Verify Test: {verify_password('admin', test_hash)}")
