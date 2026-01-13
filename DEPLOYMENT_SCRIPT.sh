#!/bin/bash
# Script de instalación automática de Control Patrimonial
# Uso: sudo bash DEPLOYMENT_SCRIPT.sh

set -e

echo "=========================================="
echo "Control Patrimonial - Script de Instalación"
echo "=========================================="

# Variables
APP_DIR="/opt/control_patrimonial"
APP_USER="app"
DB_USER="control_patrimonial"
DB_NAME="control_patrimonial"
DB_PASSWORD="Control2025Patrimonial!"

# Colores
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Funciones
log_step() {
    echo -e "${GREEN}[PASO]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
    exit 1
}

log_warning() {
    echo -e "${YELLOW}[ADVERTENCIA]${NC} $1"
}

# 1. Verificar que somos root
if [[ $EUID -ne 0 ]]; then
   log_error "Este script debe ejecutarse como root (usa: sudo)"
fi

# 2. Crear usuario para la aplicación
log_step "Crear usuario de aplicación..."
if ! id "$APP_USER" &>/dev/null; then
    useradd -r -s /bin/bash -d $APP_DIR $APP_USER
    echo "[OK] Usuario $APP_USER creado"
else
    echo "[OK] Usuario $APP_USER ya existe"
fi

# 3. Crear directorio de aplicación
log_step "Crear directorio de aplicación..."
mkdir -p $APP_DIR
chown -R $APP_USER:$APP_USER $APP_DIR
chmod 750 $APP_DIR
echo "[OK] Directorio creado: $APP_DIR"

# 4. Instalar dependencias del sistema
log_step "Instalar dependencias del sistema..."
apt-get update
apt-get install -y \
    python3-pip \
    python3-venv \
    python3-dev \
    libpq-dev \
    git \
    curl \
    wget
echo "[OK] Dependencias instaladas"

# 5. Crear entorno virtual de Python
log_step "Crear entorno virtual de Python..."
cd $APP_DIR
sudo -u $APP_USER python3 -m venv venv
sudo -u $APP_USER bash -c "source venv/bin/activate && pip install --upgrade pip setuptools wheel"
echo "[OK] Entorno virtual creado"

# 6. Instalar paquetes de Python
log_step "Instalar paquetes de Python..."
sudo -u $APP_USER bash -c "source venv/bin/activate && pip install -r requirements.txt"
echo "[OK] Paquetes Python instalados"

# 7. Descargar Bootstrap localmente
log_step "Descargar Bootstrap 5.3 localmente..."
sudo -u $APP_USER bash -c "source venv/bin/activate && cd $APP_DIR && python scripts/download_bootstrap.py" || log_warning "Bootstrap local falló, continuando con CDN"
echo "[OK] Bootstrap configurado"

# 8. Ejecutar migraciones de BD
log_step "Ejecutar migraciones de base de datos..."
export FLASK_ENV=production
export DATABASE_URL="postgresql://$DB_USER:$DB_PASSWORD@localhost:5432/$DB_NAME"
export SECRET_KEY=$(python3 -c "import secrets; print(secrets.token_hex(32))")

sudo -u $APP_USER bash -c "source $APP_DIR/venv/bin/activate && cd $APP_DIR && python -m flask db upgrade"
echo "[OK] Migraciones ejecutadas"

# 9. Crear archivo .env.production
log_step "Crear archivo .env.production..."
cat > $APP_DIR/.env.production << EOF
FLASK_ENV=production
DEBUG=False
SECRET_KEY=$(python3 -c "import secrets; print(secrets.token_hex(32))")
DATABASE_URL=postgresql://$DB_USER:$DB_PASSWORD@localhost:5432/$DB_NAME
SESSION_COOKIE_SECURE=True
REMEMBER_COOKIE_SECURE=True
LOG_LEVEL=INFO
EOF
chown $APP_USER:$APP_USER $APP_DIR/.env.production
chmod 600 $APP_DIR/.env.production
echo "[OK] Archivo .env.production creado"

# 10. Crear archivo de servicio systemd
log_step "Crear servicio systemd..."
cat > /etc/systemd/system/control_patrimonial.service << 'EOF'
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
EOF

systemctl daemon-reload
systemctl enable control_patrimonial
echo "[OK] Servicio systemd creado"

# 11. Crear directorio de logs
log_step "Crear directorio de logs..."
mkdir -p /var/log/control_patrimonial
chown $APP_USER:$APP_USER /var/log/control_patrimonial
chmod 750 /var/log/control_patrimonial
echo "[OK] Directorio de logs creado"

# 12. Instalar y configurar Gunicorn
log_step "Instalar Gunicorn..."
sudo -u $APP_USER bash -c "source $APP_DIR/venv/bin/activate && pip install gunicorn"
echo "[OK] Gunicorn instalado"

# 13. Configurar Nginx
log_step "Configurar Nginx como reverse proxy..."
cat > /etc/nginx/sites-available/control_patrimonial << 'EOF'
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
    }
}
EOF

# Habilitar sitio
ln -sf /etc/nginx/sites-available/control_patrimonial /etc/nginx/sites-enabled/
rm -f /etc/nginx/sites-enabled/default

# Verificar configuración de Nginx
nginx -t || log_error "Error en configuración de Nginx"

# Reiniciar Nginx
systemctl restart nginx
echo "[OK] Nginx configurado y reiniciado"

# 14. Iniciar aplicación
log_step "Iniciar servicio Control Patrimonial..."
systemctl start control_patrimonial
sleep 3

# 15. Verificar estado
log_step "Verificar estado de la aplicación..."
if systemctl is-active --quiet control_patrimonial; then
    echo "[OK] Servicio está ejecutándose"
else
    log_error "El servicio no se inició correctamente"
fi

# 16. Health check
log_step "Ejecutar health check..."
sleep 2
if curl -s http://localhost/api/health | grep -q "ok"; then
    echo "[OK] API respondiendo correctamente"
else
    log_warning "Health check falló, revisa los logs"
fi

echo ""
echo "=========================================="
echo "INSTALACION COMPLETADA"
echo "=========================================="
echo ""
echo "Control Patrimonial está listo en:"
echo "  URL: http://10.28.106.250"
echo "  API: http://10.28.106.250/api/health"
echo ""
echo "Logs:"
echo "  Aplicación: tail -f /var/log/control_patrimonial/error.log"
echo "  Nginx: tail -f /var/log/nginx/control_patrimonial_error.log"
echo ""
echo "Comandos útiles:"
echo "  Ver estado: systemctl status control_patrimonial"
echo "  Reiniciar: systemctl restart control_patrimonial"
echo "  Ver logs: journalctl -u control_patrimonial -f"
echo ""
