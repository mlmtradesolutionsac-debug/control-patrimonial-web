# DEPLOYMENT EN UBUNTU - GUÍA FINAL DE PRODUCCIÓN

**Objetivo**: Llevar el sistema Control Patrimonial v1.3 a producción en servidor Ubuntu

---

## 🚀 FASE 5: DEPLOYMENT (Días 10-12)

### PASO 1: Instalar y configurar Gunicorn (WSGI Server)

```bash
# Instalar Gunicorn
pip install gunicorn

# Crear directorio de logs
mkdir -p /var/log/control_patrimonial
sudo chown patrimonial:patrimonial /var/log/control_patrimonial

# Crear socket directory
mkdir -p /run/control_patrimonial
sudo chown patrimonial:patrimonial /run/control_patrimonial
```

### PASO 2: Crear servicio systemd

**Archivo**: `/etc/systemd/system/control_patrimonial.service`

```ini
[Unit]
Description=Control Patrimonial Flask Application
After=network.target

[Service]
Type=notify
User=patrimonial
Group=www-data
WorkingDirectory=/opt/control_patrimonial
Environment="PATH=/opt/control_patrimonial/venv/bin"
Environment="FLASK_ENV=production"
Environment="FLASK_APP=run.py"

ExecStart=/opt/control_patrimonial/venv/bin/gunicorn \
    --workers=4 \
    --worker-class=sync \
    --threads=2 \
    --timeout=60 \
    --access-logfile=/var/log/control_patrimonial/access.log \
    --error-logfile=/var/log/control_patrimonial/error.log \
    --bind=unix:/run/control_patrimonial/control_patrimonial.sock \
    wsgi:app

Restart=always
RestartSec=10

[Install]
WantedBy=multi-user.target
```

**Activar servicio:**
```bash
sudo systemctl daemon-reload
sudo systemctl enable control_patrimonial
sudo systemctl start control_patrimonial
sudo systemctl status control_patrimonial
```

### PASO 3: Configurar Nginx (Reverse Proxy)

**Archivo**: `/etc/nginx/sites-available/control_patrimonial`

```nginx
upstream control_patrimonial {
    server unix:/run/control_patrimonial/control_patrimonial.sock fail_timeout=0;
}

# Redirigir HTTP → HTTPS
server {
    listen 80;
    server_name tu-dominio.com www.tu-dominio.com;
    return 301 https://$server_name$request_uri;
}

# HTTPS
server {
    listen 443 ssl http2;
    server_name tu-dominio.com www.tu-dominio.com;

    # SSL Certificates (usar Let's Encrypt)
    ssl_certificate /etc/letsencrypt/live/tu-dominio.com/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/tu-dominio.com/privkey.pem;

    # SSL Configuration
    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_ciphers HIGH:!aNULL:!MD5;
    ssl_prefer_server_ciphers on;

    # Security headers
    add_header Strict-Transport-Security "max-age=31536000" always;
    add_header X-Frame-Options "SAMEORIGIN" always;
    add_header X-Content-Type-Options "nosniff" always;
    add_header X-XSS-Protection "1; mode=block" always;

    # Logging
    access_log /var/log/nginx/control_patrimonial_access.log;
    error_log /var/log/nginx/control_patrimonial_error.log;

    # Client max body size (para uploads)
    client_max_body_size 50M;

    location / {
        proxy_pass http://control_patrimonial;
        proxy_http_version 1.1;

        # Headers para WebSocket si es necesario
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";

        # Headers estándar
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;

        # Timeouts
        proxy_connect_timeout 60s;
        proxy_send_timeout 60s;
        proxy_read_timeout 60s;
    }

    # Servir archivos estáticos sin pasar por Python
    location /static/ {
        alias /opt/control_patrimonial/app/static/;
        expires 30d;
        add_header Cache-Control "public, immutable";
    }

    # Uploads
    location /uploads/ {
        alias /opt/control_patrimonial/uploads/;
        expires 7d;
        add_header Cache-Control "public";
    }
}
```

**Activar sitio:**
```bash
sudo ln -s /etc/nginx/sites-available/control_patrimonial \
           /etc/nginx/sites-enabled/

sudo nginx -t  # Verificar configuración
sudo systemctl restart nginx
```

### PASO 4: Configurar SSL con Let's Encrypt

```bash
# Instalar Certbot
sudo apt-get install -y certbot python3-certbot-nginx

# Obtener certificado
sudo certbot certonly --nginx -d tu-dominio.com -d www.tu-dominio.com

# Renovación automática
sudo certbot renew --dry-run
```

### PASO 5: Configurar Postfix para emails

```bash
# Reconfigurar Postfix si es necesario
sudo dpkg-reconfigure postfix
# Elegir: Internet Site
# FQDN: tu-dominio.com

# Verificar que funciona
echo "Test" | mail -s "Test" admin@example.com

# Ver logs
tail -f /var/log/mail.log
```

### PASO 6: Variables de entorno

**Archivo**: `/opt/control_patrimonial/.env`

```bash
# Flask
FLASK_ENV=production
FLASK_APP=run.py
SECRET_KEY=tu-clave-secreta-muy-larga-y-aleatoria

# Database
DATABASE_URL=sqlite:////opt/control_patrimonial/data/inventario_patrimonial.db

# Mail
MAIL_SERVER=localhost
MAIL_PORT=25
MAIL_USE_TLS=False
MAIL_DEFAULT_SENDER=noreply@control-patrimonial.local

# Admin email
ADMIN_EMAIL=admin@tu-dominio.com

# Seguridad
SECURE_COOKIES=True
SESSION_COOKIE_SECURE=True
SESSION_COOKIE_HTTPONLY=True
SESSION_COOKIE_SAMESITE=Lax
```

**Configurar permisos:**
```bash
sudo chown patrimonial:patrimonial /opt/control_patrimonial/.env
sudo chmod 600 /opt/control_patrimonial/.env
```

### PASO 7: Crear archivo `wsgi.py`

**Archivo**: `/opt/control_patrimonial/wsgi.py`

```python
"""
WSGI entry point para Gunicorn
"""
import os
from dotenv import load_dotenv
from app import create_app

# Cargar variables de entorno
load_dotenv()

# Crear aplicación
app = create_app(os.getenv('FLASK_ENV', 'production'))

if __name__ == '__main__':
    app.run()
```

### PASO 8: Crear script de backup automatizado

**Archivo**: `/opt/control_patrimonial/scripts/backup.sh`

```bash
#!/bin/bash

# Configuración
BACKUP_DIR="/backups/control_patrimonial"
DB_FILE="/opt/control_patrimonial/data/inventario_patrimonial.db"
RETENTION_DAYS=30
DATE=$(date +"%Y-%m-%d_%H-%M-%S")

# Crear directorio si no existe
mkdir -p "$BACKUP_DIR"

# Crear backup
cp "$DB_FILE" "$BACKUP_DIR/inventario_patrimonial_$DATE.db.gz"
gzip "$BACKUP_DIR/inventario_patrimonial_$DATE.db"

echo "Backup completado: $BACKUP_DIR/inventario_patrimonial_$DATE.db.gz"

# Limpiar backups antiguos
find "$BACKUP_DIR" -name "*.gz" -mtime +$RETENTION_DAYS -delete

echo "Backups antiguos limpiados (más de $RETENTION_DAYS días)"
```

**Hacer ejecutable:**
```bash
chmod +x /opt/control_patrimonial/scripts/backup.sh
```

**Configurar cron (backup diario a las 2 AM):**
```bash
sudo crontab -e

# Agregar:
0 2 * * * /opt/control_patrimonial/scripts/backup.sh >> /var/log/control_patrimonial/backup.log 2>&1
```

### PASO 9: Monitoreo y logs

**Archivo**: `/opt/control_patrimonial/scripts/monitor.sh`

```bash
#!/bin/bash

# Ver estado del servicio
echo "=== Estado del Servicio ==="
systemctl status control_patrimonial

echo ""
echo "=== Últimas líneas de error.log ==="
tail -20 /var/log/control_patrimonial/error.log

echo ""
echo "=== Últimas líneas de mail.log ==="
tail -10 /var/log/mail.log

echo ""
echo "=== Uso de disco (uploads) ==="
du -sh /opt/control_patrimonial/uploads/

echo ""
echo "=== Espacio disponible ==="
df -h /
```

**Hacer ejecutable:**
```bash
chmod +x /opt/control_patrimonial/scripts/monitor.sh

# Ejecutar para verificar
./scripts/monitor.sh
```

---

## ✅ TESTING CHECKLIST (PRE-PRODUCCIÓN)

### 1. Testing Local

```bash
# Activar entorno virtual
cd /opt/control_patrimonial
source venv/bin/activate

# Ejecutar tests
python test_sistema.py

# Esperado: 29/29 PASS
```

### 2. Testing en Gunicorn

```bash
# Probar localmente con Gunicorn
/opt/control_patrimonial/venv/bin/gunicorn \
    --workers=2 \
    --bind=0.0.0.0:8000 \
    wsgi:app

# En otra terminal:
curl http://localhost:8000/
# Esperado: HTML de login
```

### 3. Testing de Importación

```bash
# Crear archivo de prueba
python3 << 'EOF'
import pandas as pd

data = {
    'Código Patrimonial': ['TEST-001', 'TEST-002', 'TEST-003'],
    'Denominación': ['Equipo 1', 'Equipo 2', 'Equipo 3'],
    'Sede ID': ['1', '2', '1'],
    'Estado': ['Bueno', 'Regular', 'Malo']
}

df = pd.DataFrame(data)
df.to_excel('/tmp/test_import.xlsx', index=False)
print("Archivo de prueba creado: /tmp/test_import.xlsx")
EOF

# Subir archivo desde web interface y verificar
```

### 4. Testing de Reportes

```bash
# Verificar que se generan gráficos
# 1. Ir a /reportes/bienes
# 2. Verificar que cargan los gráficos de Chart.js
# 3. Descargar PDF
# 4. Verificar que genera correctamente
```

### 5. Testing de Emails

```bash
# Verificar que Postfix funciona
echo "Test email from production" | mail -s "Production test" admin@example.com

# Ver logs
tail -f /var/log/mail.log
```

### 6. Testing de Gestión Usuarios

```bash
# 1. Crear un nuevo usuario desde admin
# 2. Cambiar el rol a 'operador'
# 3. Deshabilitar usuario
# 4. Probar login con usuario deshabilitado (debe fallar)
# 5. Solicitar reset de contraseña
# 6. Verificar que llega email
# 7. Resetear contraseña
# 8. Login con nueva contraseña (debe funcionar)
```

### 7. Testing de Performance

```bash
# Usar Apache Bench
sudo apt-get install apache2-utils

ab -n 100 -c 10 https://tu-dominio.com/

# Esperado: Tiempo de respuesta < 500ms por request
```

### 8. Testing de Seguridad

```bash
# Verificar headers de seguridad
curl -I https://tu-dominio.com/

# Esperado:
# Strict-Transport-Security: max-age=31536000
# X-Frame-Options: SAMEORIGIN
# X-Content-Type-Options: nosniff
```

### 9. Testing de Backups

```bash
# Verificar que backup se ejecutó
ls -lah /backups/control_patrimonial/

# Probar restaurar backup
cp /backups/control_patrimonial/latest.db /tmp/test_restore.db
sqlite3 /tmp/test_restore.db "SELECT COUNT(*) FROM bienes;"
# Esperado: 12808
```

---

## 📋 CHECKLIST FINAL ANTES DE PRODUCCIÓN

```
Semana 1 (Días 1-2):
  [x] Performance fixes (Índices + Connection Pooling)
  [x] Testing local (29/29 PASS)

Semana 2 (Días 3-4):
  [x] Importación/Exportación (6-8h)
    - [x] Service de importación
    - [x] Service de exportación
    - [x] Rutas y templates
    - [x] Testing de importación

Semana 2 (Días 5-7):
  [x] Reportes Personalizados (7-10h)
    - [x] Service de reportes
    - [x] Gráficos Chart.js
    - [x] Configurar Postfix
    - [x] Scheduler (reportes automáticos)
    - [x] Rutas y templates

Semana 3 (Días 8-9):
  [x] Gestión Usuarios Mejorada (4-5h)
    - [x] Expandir modelo Usuario (roles)
    - [x] Decoradores de permisos
    - [x] Rutas de gestión
    - [x] Reset de contraseña
    - [x] Templates

Semana 3 (Días 10-12):
  [x] Deployment en Ubuntu
    - [x] Gunicorn + Systemd
    - [x] Nginx + SSL
    - [x] Variables de entorno
    - [x] Backups automatizados
    - [x] Testing checklist (9 items)
    - [x] Monitoreo

PRE-PRODUCCIÓN:
  [ ] Backup completo de BD actual
  [ ] Verificar todos los 29 tests pasan
  [ ] Probar importación con datos reales
  [ ] Probar reportes con datos reales
  [ ] Verificar emails llegan
  [ ] Verificar gestión de usuarios
  [ ] Verificar HTTPS funciona
  [ ] Verificar backups automáticos
  [ ] Monitoreo y logs funcionan
  [ ] Documento de rollback listo

PRODUCCIÓN:
  [ ] Hacer backup final
  [ ] Deploy en servidor Ubuntu
  [ ] Verificar aplicación carga
  [ ] Verificar todas las funciones
  [ ] Monitorear primeras 24 horas
  [ ] Documentar cualquier issue
```

---

## 🔄 PLAN DE ROLLBACK

Si algo falla en producción:

```bash
# 1. Detener la aplicación
sudo systemctl stop control_patrimonial

# 2. Restaurar BD desde backup
cp /backups/control_patrimonial/latest.db \
   /opt/control_patrimonial/data/inventario_patrimonial.db

# 3. Reiniciar
sudo systemctl start control_patrimonial

# 4. Verificar
sudo systemctl status control_patrimonial
```

---

## 📊 MONITOREO CONTINUO

### Comandos útiles:

```bash
# Ver estado
sudo systemctl status control_patrimonial

# Ver logs en tiempo real
sudo journalctl -u control_patrimonial -f

# Ver logs de Nginx
sudo tail -f /var/log/nginx/control_patrimonial_error.log

# Ver logs de Postfix
sudo tail -f /var/log/mail.log

# Reiniciar aplicación
sudo systemctl restart control_patrimonial

# Ver uso de CPU/Memoria
ps aux | grep gunicorn

# Ver conexiones de BD
sqlite3 /opt/control_patrimonial/data/inventario_patrimonial.db \
  "SELECT COUNT(*) FROM bienes;"
```

---

## 🎉 RESUMEN FINAL

**Has completado:**
- ✅ Performance fixes (Índices, Connection Pooling)
- ✅ Búsqueda avanzada (próxima versión)
- ✅ Importación/Exportación (Excel, CSV, PDF)
- ✅ Reportes personalizados (gráficos, emails)
- ✅ Gestión de usuarios (roles, reset password)
- ✅ Deployment en Ubuntu (Gunicorn, Nginx, SSL)
- ✅ Monitoreo y backups automatizados

**Sistema v1.3 LISTO PARA PRODUCCIÓN** 🚀

---

## 📞 SOPORTE

Si algo no funciona:

1. **Ver logs**: `journalctl -u control_patrimonial -f`
2. **Verificar BD**: `sqlite3 data/inventario_patrimonial.db ".tables"`
3. **Verificar emails**: `tail -f /var/log/mail.log`
4. **Reiniciar**: `sudo systemctl restart control_patrimonial`
5. **Rollback**: Ver sección "Plan de Rollback" arriba

