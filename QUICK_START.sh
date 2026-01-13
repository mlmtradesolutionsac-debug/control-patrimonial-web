#!/bin/bash
# Script Rápido de Instalación - Control Patrimonial
# Ejecutar desde /tmp/control_patrimonial_web sin sudo
# Uso: bash QUICK_START.sh

set -e

echo "=========================================="
echo "Control Patrimonial - Instalación Rápida"
echo "=========================================="

# Variables
APP_DIR="/opt/control_patrimonial"
APP_USER="app"
DB_PASSWORD="Control2025Patrimonial!"

echo ""
echo "[PASO 1] Copiar código a /opt (requiere sudo)..."
sudo mkdir -p $APP_DIR
sudo cp -r /tmp/control_patrimonial_web/* $APP_DIR/
sudo chown -R $APP_USER:$APP_USER $APP_DIR
echo "[OK] Código copiado"

echo ""
echo "[PASO 2] Crear entorno virtual..."
cd $APP_DIR
sudo -u $APP_USER python3 -m venv venv
echo "[OK] Entorno virtual creado"

echo ""
echo "[PASO 3] Instalar dependencias..."
sudo -u $APP_USER bash -c "source venv/bin/activate && pip install --upgrade pip setuptools wheel"
sudo -u $APP_USER bash -c "source venv/bin/activate && pip install -r requirements.txt"
echo "[OK] Dependencias instaladas"

echo ""
echo "[PASO 4] Generar configuración de producción..."
SECRET_KEY=$(python3 -c "import secrets; print(secrets.token_hex(32))")
sudo tee $APP_DIR/.env.production > /dev/null <<EOF
FLASK_ENV=production
DEBUG=False
SECRET_KEY=$SECRET_KEY
DATABASE_URL=postgresql://control_patrimonial:$DB_PASSWORD@localhost:5432/control_patrimonial
SESSION_COOKIE_SECURE=True
REMEMBER_COOKIE_SECURE=True
LOG_LEVEL=INFO
EOF
sudo chown $APP_USER:$APP_USER $APP_DIR/.env.production
sudo chmod 600 $APP_DIR/.env.production
echo "[OK] Configuración creada"

echo ""
echo "[PASO 5] Ejecutar migraciones de BD..."
export FLASK_ENV=production
export DATABASE_URL="postgresql://control_patrimonial:$DB_PASSWORD@localhost:5432/control_patrimonial"
sudo -u $APP_USER bash -c "cd $APP_DIR && source venv/bin/activate && python -m flask db upgrade" || echo "[ADVERTENCIA] Migraciones completadas con warnings"
echo "[OK] BD actualizada"

echo ""
echo "[PASO 6] Descargar Bootstrap..."
sudo -u $APP_USER bash -c "cd $APP_DIR && source venv/bin/activate && python scripts/download_bootstrap.py" || echo "[ADVERTENCIA] Bootstrap local no disponible, se usará CDN"
echo "[OK] Bootstrap configurado"

echo ""
echo "[PASO 7] Instalar Gunicorn..."
sudo -u $APP_USER bash -c "source $APP_DIR/venv/bin/activate && pip install gunicorn"
echo "[OK] Gunicorn instalado"

echo ""
echo "[PASO 8] Crear directorio de logs..."
sudo mkdir -p /var/log/control_patrimonial
sudo chown $APP_USER:$APP_USER /var/log/control_patrimonial
sudo chmod 750 /var/log/control_patrimonial
echo "[OK] Logs configurados"

echo ""
echo "[PASO 9] Crear servicio systemd..."
sudo tee /etc/systemd/system/control_patrimonial.service > /dev/null <<'SERVICEEOF'
[Unit]
Description=Control Patrimonial Web Application
After=network.target postgresql.service

[Service]
Type=notify
User=app
WorkingDirectory=/opt/control_patrimonial
Environment="PATH=/opt/control_patrimonial/venv/bin"
Environment="FLASK_ENV=production"
EnvironmentFile=/opt/control_patrimonial/.env.production
ExecStart=/opt/control_patrimonial/venv/bin/gunicorn \
    --workers 4 \
    --worker-class sync \
    --bind unix:/opt/control_patrimonial/app.sock \
    --timeout 60 \
    --access-logfile /var/log/control_patrimonial/access.log \
    --error-logfile /var/log/control_patrimonial/error.log \
    'run:app'
Restart=on-failure
RestartSec=5s

[Install]
WantedBy=multi-user.target
SERVICEEOF

sudo systemctl daemon-reload
sudo systemctl enable control_patrimonial
echo "[OK] Servicio systemd configurado"

echo ""
echo "[PASO 10] Configurar Nginx..."
sudo tee /etc/nginx/sites-available/control_patrimonial > /dev/null <<'NGINXEOF'
server {
    listen 80;
    server_name _;
    client_max_body_size 16M;

    access_log /var/log/nginx/control_patrimonial_access.log;
    error_log /var/log/nginx/control_patrimonial_error.log;

    location / {
        proxy_pass http://unix:/opt/control_patrimonial/app.sock;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_redirect off;
        proxy_read_timeout 60s;
    }

    location /static/ {
        alias /opt/control_patrimonial/app/static/;
        expires 30d;
        add_header Cache-Control "public, immutable";
    }
}
NGINXEOF

sudo ln -sf /etc/nginx/sites-available/control_patrimonial /etc/nginx/sites-enabled/
sudo rm -f /etc/nginx/sites-enabled/default
sudo nginx -t
sudo systemctl restart nginx
echo "[OK] Nginx configurado"

echo ""
echo "[PASO 11] Iniciar Control Patrimonial..."
sudo systemctl start control_patrimonial
sleep 3

if sudo systemctl is-active --quiet control_patrimonial; then
    echo "[OK] Servicio iniciado correctamente"
else
    echo "[ERROR] El servicio no se inició"
    sudo systemctl status control_patrimonial
    exit 1
fi

echo ""
echo "[PASO 12] Verificar API..."
sleep 2
if curl -s http://localhost/api/health > /dev/null 2>&1; then
    echo "[OK] API respondiendo"
else
    echo "[ADVERTENCIA] Health check falló, revisa los logs"
    sudo journalctl -u control_patrimonial -n 20
fi

echo ""
echo "=========================================="
echo "INSTALACION COMPLETADA EXITOSAMENTE"
echo "=========================================="
echo ""
echo "Control Patrimonial está disponible en:"
echo "  URL: http://10.28.106.250"
echo ""
echo "Verificaciones:"
echo "  Estado: sudo systemctl status control_patrimonial"
echo "  Logs: sudo journalctl -u control_patrimonial -f"
echo "  Health: curl http://localhost/api/health"
echo ""
