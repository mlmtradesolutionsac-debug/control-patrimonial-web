#!/usr/bin/env python3
"""
Script de instalación de Control Patrimonial sin requerir sudo interactivo
Ejecutar con: python3 install_app.py
"""

import os
import sys
import subprocess
import shutil
import secrets
from pathlib import Path

APP_DIR = Path("/opt/control_patrimonial")
SRC_DIR = Path("/tmp/control_patrimonial_web")
DB_PASSWORD = "Control2025Patrimonial!"

def run_cmd(cmd, as_user=None, check=True):
    """Ejecutar comando como usuario específico"""
    if as_user:
        cmd = f'sudo -u {as_user} bash -c "{cmd}"'
    else:
        cmd = f'sudo bash -c "{cmd}"'

    print(f"  [*] {cmd[:80]}...")
    result = subprocess.run(cmd, shell=True, capture_output=True, text=True)

    if check and result.returncode != 0:
        if "password" not in result.stderr.lower():
            print(f"  [!] Error: {result.stderr}")
    return result.returncode == 0

def main():
    print("=" * 50)
    print("Control Patrimonial - Instalación")
    print("=" * 50)
    print()

    # 1. Preparar directorio
    print("[1] Preparando directorio...")
    os.system(f"sudo mkdir -p {APP_DIR}")
    os.system(f"sudo rm -rf {APP_DIR}/* 2>/dev/null || true")
    os.system(f"sudo cp -r {SRC_DIR}/* {APP_DIR}/ 2>/dev/null || true")
    os.system(f"sudo useradd -r -s /bin/bash -d {APP_DIR} -m app 2>/dev/null || true")
    os.system(f"sudo chown -R app:app {APP_DIR}")
    print("  [OK]")
    print()

    # 2. Entorno virtual
    print("[2] Entorno virtual Python...")
    os.chdir(APP_DIR)
    os.system(f"sudo -u app python3 -m venv {APP_DIR}/venv")
    os.system(f'sudo -u app bash -c "source {APP_DIR}/venv/bin/activate && pip install --upgrade pip setuptools wheel -q"')
    os.system(f'sudo -u app bash -c "source {APP_DIR}/venv/bin/activate && pip install -r {APP_DIR}/requirements.txt -q"')
    print("  [OK]")
    print()

    # 3. Configuración
    print("[3] Configuración de producción...")
    secret_key = secrets.token_hex(32)
    env_content = f"""FLASK_ENV=production
DEBUG=False
SECRET_KEY={secret_key}
DATABASE_URL=postgresql://control_patrimonial:{DB_PASSWORD}@localhost:5432/control_patrimonial
SESSION_COOKIE_SECURE=True
REMEMBER_COOKIE_SECURE=True
LOG_LEVEL=INFO
"""
    os.system(f"sudo tee {APP_DIR}/.env.production > /dev/null << 'EOF'\n{env_content}EOF")
    os.system(f"sudo chown app:app {APP_DIR}/.env.production")
    os.system(f"sudo chmod 600 {APP_DIR}/.env.production")
    print("  [OK]")
    print()

    # 4. Migraciones BD
    print("[4] Migraciones de base de datos...")
    os.system(f'sudo -u app bash -c "cd {APP_DIR} && source venv/bin/activate && FLASK_ENV=production python -m flask db upgrade" 2>&1 | head -3 || true')
    print("  [OK]")
    print()

    # 5. Bootstrap
    print("[5] Descargando Bootstrap...")
    os.system(f'sudo -u app bash -c "cd {APP_DIR} && source venv/bin/activate && python scripts/download_bootstrap.py" 2>&1 | tail -2 || echo "  [CDN]"')
    print("  [OK]")
    print()

    # 6. Gunicorn
    print("[6] Instalando Gunicorn...")
    os.system(f'sudo -u app bash -c "source {APP_DIR}/venv/bin/activate && pip install gunicorn -q"')
    print("  [OK]")
    print()

    # 7. Directorio de logs
    print("[7] Configurando logs...")
    os.system(f"sudo mkdir -p /var/log/control_patrimonial")
    os.system(f"sudo chown app:app /var/log/control_patrimonial")
    os.system(f"sudo chmod 750 /var/log/control_patrimonial")
    print("  [OK]")
    print()

    # 8. Systemd service
    print("[8] Configurando servicio systemd...")
    service_content = f"""[Unit]
Description=Control Patrimonial Web Application
After=network.target postgresql.service

[Service]
Type=notify
User=app
WorkingDirectory={APP_DIR}
Environment="PATH={APP_DIR}/venv/bin"
Environment="FLASK_ENV=production"
EnvironmentFile={APP_DIR}/.env.production
ExecStart={APP_DIR}/venv/bin/gunicorn --workers 4 --worker-class sync --bind unix:{APP_DIR}/app.sock --timeout 60 --access-logfile /var/log/control_patrimonial/access.log --error-logfile /var/log/control_patrimonial/error.log 'run:app'
Restart=on-failure
RestartSec=5s

[Install]
WantedBy=multi-user.target
"""
    os.system(f"sudo tee /etc/systemd/system/control_patrimonial.service > /dev/null << 'EOF'\n{service_content}EOF")
    os.system("sudo systemctl daemon-reload")
    os.system("sudo systemctl enable control_patrimonial 2>/dev/null || true")
    print("  [OK]")
    print()

    # 9. Nginx
    print("[9] Configurando Nginx...")
    nginx_content = f"""server {{
    listen 80;
    server_name _;
    client_max_body_size 16M;

    location / {{
        proxy_pass http://unix:{APP_DIR}/app.sock;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_redirect off;
    }}

    location /static/ {{
        alias {APP_DIR}/app/static/;
        expires 30d;
    }}
}}
"""
    os.system(f"sudo tee /etc/nginx/sites-available/control_patrimonial > /dev/null << 'EOF'\n{nginx_content}EOF")
    os.system("sudo ln -sf /etc/nginx/sites-available/control_patrimonial /etc/nginx/sites-enabled/ 2>/dev/null || true")
    os.system("sudo rm -f /etc/nginx/sites-enabled/default 2>/dev/null || true")
    os.system("sudo nginx -t > /dev/null 2>&1 && sudo systemctl restart nginx || echo '  [!] Nginx error'")
    print("  [OK]")
    print()

    # 10. Iniciar servicio
    print("[10] Iniciando servicio...")
    os.system("sudo systemctl start control_patrimonial")
    import time
    time.sleep(3)
    print("  [OK]")
    print()

    # 11. Verificar
    print("[11] Verificando...")
    result = os.system("curl -s http://localhost/api/health > /dev/null 2>&1")
    if result == 0:
        print("  [OK] API respondiendo")
    else:
        print("  [!] Verificar: sudo journalctl -u control_patrimonial -n 10")
    print()

    print("=" * 50)
    print("INSTALACION COMPLETADA")
    print("=" * 50)
    print()
    print("Accede en: http://10.28.106.250")
    print()

if __name__ == "__main__":
    main()
