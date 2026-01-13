#!/bin/bash
# Script Final de Instalación - Control Patrimonial en Producción
# Uso: sudo bash INSTALL_PRODUCTION.sh
# Ejecutar en el servidor después de que el archivo esté en /tmp/control_patrimonial_web

set -e

echo "=========================================="
echo "Control Patrimonial - Instalación Final"
echo "=========================================="

# Verificar que somos root
if [[ $EUID -ne 0 ]]; then
   echo "[ERROR] Este script debe ejecutarse como root"
   exit 1
fi

# 1. Preparar directorio /opt
echo "[1] Preparando directorio de instalación..."
mkdir -p /opt/control_patrimonial
rm -rf /opt/control_patrimonial/*
cp -r /tmp/control_patrimonial_web/* /opt/control_patrimonial/
chown -R root:root /opt/control_patrimonial
chmod 755 /opt/control_patrimonial
echo "[OK] Directorio preparado"

# 2. Crear usuario de aplicación
echo "[2] Creando usuario de aplicación..."
useradd -r -s /bin/bash -d /opt/control_patrimonial -m app 2>/dev/null || echo "[OK] Usuario app ya existe"
chown -R app:app /opt/control_patrimonial
echo "[OK] Usuario app configurado"

# 3. Crear entorno virtual
echo "[3] Creando entorno virtual de Python..."
cd /opt/control_patrimonial
sudo -u app python3 -m venv venv
sudo -u app bash -c "source venv/bin/activate && pip install --upgrade pip setuptools wheel"
sudo -u app bash -c "source venv/bin/activate && pip install -r requirements.txt"
echo "[OK] Entorno virtual y dependencias instaladas"

# 4. Generar SECRET_KEY y crear .env.production
echo "[4] Generando configuración de producción..."
SECRET_KEY=$(python3 -c "import secrets; print(secrets.token_hex(32))")
cat > /opt/control_patrimonial/.env.production << EOF
FLASK_ENV=production
DEBUG=False
SECRET_KEY=$SECRET_KEY
DATABASE_URL=postgresql://control_patrimonial:Control2025Patrimonial!@localhost:5432/control_patrimonial
SESSION_COOKIE_SECURE=True
REMEMBER_COOKIE_SECURE=True
LOG_LEVEL=INFO
EOF
chown app:app /opt/control_patrimonial/.env.production
chmod 600 /opt/control_patrimonial/.env.production
echo "[OK] Configuración creada (SECRET_KEY: ${SECRET_KEY:0:20}...)"

# 5. Ejecutar migraciones de BD
echo "[5] Ejecutando migraciones de base de datos..."
cd /opt/control_patrimonial
export FLASK_ENV=production
export DATABASE_URL="postgresql://control_patrimonial:Control2025Patrimonial!@localhost:5432/control_patrimonial"
sudo -u app bash -c "source venv/bin/activate && python -m flask db upgrade" || echo "[WARNING] Las migraciones podrían no haber funcionado correctamente"
echo "[OK] Base de datos actualizada"

# 6. Descargar Bootstrap localmente
echo "[6] Descargando Bootstrap localmente..."
sudo -u app bash -c "source /opt/control_patrimonial/venv/bin/activate && cd /opt/control_patrimonial && python scripts/download_bootstrap.py" || echo "[WARNING] Bootstrap local no disponible, se usará CDN"
echo "[OK] Bootstrap configurado"

# 7. Crear servicio systemd
echo "[7] Configurando servicio systemd..."
mkdir -p /var/log/control_patrimonial
chown app:app /var/log/control_patrimonial
chmod 750 /var/log/control_patrimonial

cat > /etc/systemd/system/control_patrimonial.service << 'SERVICEEOF'
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

systemctl daemon-reload
systemctl enable control_patrimonial
echo "[OK] Servicio systemd configurado"

# 8. Instalar Gunicorn
echo "[8] Instalando Gunicorn..."
sudo -u app bash -c "source /opt/control_patrimonial/venv/bin/activate && pip install gunicorn"
echo "[OK] Gunicorn instalado"

# 9. Configurar Nginx
echo "[9] Configurando Nginx..."
cat > /etc/nginx/sites-available/control_patrimonial << 'NGINXEOF'
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

ln -sf /etc/nginx/sites-available/control_patrimonial /etc/nginx/sites-enabled/
rm -f /etc/nginx/sites-enabled/default

# Verificar configuración
nginx -t
systemctl restart nginx
echo "[OK] Nginx configurado"

# 10. Iniciar servicio
echo "[10] Iniciando Control Patrimonial..."
systemctl start control_patrimonial
sleep 3

# 11. Verificar estado
echo "[11] Verificando estado..."
if systemctl is-active --quiet control_patrimonial; then
    echo "[OK] Servicio está ejecutándose"
else
    echo "[ERROR] El servicio no se inició"
    systemctl status control_patrimonial
    exit 1
fi

# 12. Health check
sleep 2
if curl -s http://localhost/api/health > /dev/null 2>&1; then
    echo "[OK] API respondiendo correctamente"
else
    echo "[WARNING] Health check falló, revisa los logs"
fi

echo ""
echo "=========================================="
echo "INSTALACIÓN COMPLETADA"
echo "=========================================="
echo ""
echo "Control Patrimonial está listo en:"
echo "  URL: http://10.28.106.250"
echo "  API Health: http://10.28.106.250/api/health"
echo ""
echo "Información útil:"
echo "  - Logs de aplicación: tail -f /var/log/control_patrimonial/error.log"
echo "  - Logs de Nginx: tail -f /var/log/nginx/control_patrimonial_error.log"
echo "  - Ver estado: systemctl status control_patrimonial"
echo "  - Ver logs en vivo: journalctl -u control_patrimonial -f"
echo ""
echo "Próximos pasos:"
echo "  1. Configurar HTTPS con certificado SSL/TLS"
echo "  2. Configurar un firewall"
echo "  3. Realizar backups automáticos de la BD"
echo "  4. Monitorear logs regularmente"
echo ""
