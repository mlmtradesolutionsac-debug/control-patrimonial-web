# Guía de Despliegue - Control Patrimonial Web

**Última actualización**: 26 de noviembre de 2025

---

## 🎯 Requisitos Previos

Antes de desplegar en producción, asegúrate de tener:

- [ ] Servidor Linux (recomendado Ubuntu 20.04+)
- [ ] Python 3.8+ instalado
- [ ] Nginx o Apache
- [ ] Certificado SSL/TLS (Let's Encrypt gratuito)
- [ ] Acceso SSH al servidor
- [ ] Usuario con permisos de sudo

---

## 📋 Checklist de Seguridad

### Antes del Despliegue
- [ ] Generar nueva `SECRET_KEY` (no usar la del desarrollo)
- [ ] Cambiar contraseña de admin
- [ ] Revisar configuración de base de datos
- [ ] Hacer backup de datos actuales
- [ ] Configurar certificado SSL
- [ ] Revisar logs para errores

### Configuración
- [ ] `FLASK_ENV=production`
- [ ] `DEBUG=False`
- [ ] `SESSION_COOKIE_SECURE=True`
- [ ] `REMEMBER_COOKIE_SECURE=True`
- [ ] `SECRET_KEY` segura (mínimo 32 caracteres)

---

## 🚀 Despliegue en Linux (Ubuntu 20.04)

### Paso 1: Preparar el Servidor

```bash
# Actualizar paquetes
sudo apt update && sudo apt upgrade -y

# Instalar dependencias
sudo apt install -y python3.10 python3.10-venv python3-pip \
    nginx postgresql sqlite3 supervisor curl wget git

# Crear usuario para la aplicación
sudo useradd -m -s /bin/bash controlpatrimonial

# Cambiar a ese usuario
sudo su - controlpatrimonial
```

### Paso 2: Clonar Repositorio

```bash
# Ir a directorio web
cd /home/controlpatrimonial

# Clonar repositorio
git clone <tu-repositorio> control_patrimonial_web
cd control_patrimonial_web
```

### Paso 3: Crear Entorno Virtual

```bash
# Crear venv
python3.10 -m venv venv

# Activar
source venv/bin/activate

# Actualizar pip
pip install --upgrade pip setuptools wheel
```

### Paso 4: Instalar Dependencias

```bash
# Instalar requerimientos
pip install -r requirements.txt

# Instalar Gunicorn
pip install gunicorn
```

### Paso 5: Configurar Variables de Entorno

```bash
# Copiar template
cp .env.example .env

# Editar .env
nano .env

# Cambiar estos valores:
# FLASK_ENV=production
# DEBUG=False
# SECRET_KEY=<generar con: python -c "import secrets; print(secrets.token_hex(32))">
# SESSION_COOKIE_SECURE=True
# REMEMBER_COOKIE_SECURE=True
```

Salir de nano: `Ctrl+X`, luego `Y`, luego `Enter`

### Paso 6: Crear Carpetas Necesarias

```bash
# Crear directorio de logs
mkdir -p logs data

# Dar permisos
chmod 755 logs data
touch logs/app.log
chmod 644 logs/app.log
```

---

## 🎯 Configurar Gunicorn

### Crear Script de Inicio

```bash
# Volver a usuario root
exit  # o Ctrl+D

# Crear archivo de servicio
sudo nano /etc/systemd/system/control_patrimonial.service
```

Copiar este contenido:

```ini
[Unit]
Description=Control Patrimonial Web Application
After=network.target

[Service]
User=controlpatrimonial
Group=www-data
WorkingDirectory=/home/controlpatrimonial/control_patrimonial_web
Environment="PATH=/home/controlpatrimonial/control_patrimonial_web/venv/bin"
ExecStart=/home/controlpatrimonial/control_patrimonial_web/venv/bin/gunicorn \
    --workers 4 \
    --worker-class sync \
    --timeout 60 \
    --access-logfile logs/access.log \
    --error-logfile logs/error.log \
    --log-level info \
    --bind 127.0.0.1:5000 \
    "app:create_app()"

Restart=always
RestartSec=10

[Install]
WantedBy=multi-user.target
```

Salvar: `Ctrl+X`, `Y`, `Enter`

### Habilitar y Iniciar

```bash
# Habilitar servicio
sudo systemctl enable control_patrimonial.service

# Iniciar servicio
sudo systemctl start control_patrimonial.service

# Verificar estado
sudo systemctl status control_patrimonial.service

# Ver logs
sudo journalctl -u control_patrimonial.service -f
```

---

## 🌐 Configurar Nginx

### Crear Configuración de Nginx

```bash
sudo nano /etc/nginx/sites-available/control_patrimonial
```

Copiar este contenido:

```nginx
upstream control_patrimonial {
    server 127.0.0.1:5000;
}

# Redirigir HTTP a HTTPS
server {
    listen 80;
    server_name tu.dominio.com;
    return 301 https://$server_name$request_uri;
}

# HTTPS (principales)
server {
    listen 443 ssl http2;
    server_name tu.dominio.com;

    # Certificados SSL (cambiar rutas)
    ssl_certificate /etc/letsencrypt/live/tu.dominio.com/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/tu.dominio.com/privkey.pem;

    # Configuración SSL segura
    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_ciphers HIGH:!aNULL:!MD5;
    ssl_prefer_server_ciphers on;
    ssl_session_cache shared:SSL:10m;
    ssl_session_timeout 10m;

    # Headers de seguridad
    add_header Strict-Transport-Security "max-age=31536000; includeSubDomains" always;
    add_header X-Frame-Options "SAMEORIGIN" always;
    add_header X-Content-Type-Options "nosniff" always;
    add_header X-XSS-Protection "1; mode=block" always;

    # Comprimir respuestas
    gzip on;
    gzip_types text/plain text/css text/javascript application/json;

    # Límite de tamaño de archivo
    client_max_body_size 16M;

    # Ubicación de logs
    access_log /var/log/nginx/control_patrimonial_access.log;
    error_log /var/log/nginx/control_patrimonial_error.log;

    # Proxy a Gunicorn
    location / {
        proxy_pass http://control_patrimonial;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_redirect off;

        # Timeouts
        proxy_connect_timeout 60s;
        proxy_send_timeout 60s;
        proxy_read_timeout 60s;
    }

    # Servir archivos estáticos directamente (si los hay)
    location /static/ {
        alias /home/controlpatrimonial/control_patrimonial_web/static/;
        expires 30d;
        add_header Cache-Control "public, immutable";
    }
}
```

Salvar: `Ctrl+X`, `Y`, `Enter`

### Habilitar Sitio

```bash
# Crear enlace simbólico
sudo ln -s /etc/nginx/sites-available/control_patrimonial \
    /etc/nginx/sites-enabled/

# Desactivar default (opcional)
sudo rm /etc/nginx/sites-enabled/default

# Probar configuración
sudo nginx -t

# Reiniciar nginx
sudo systemctl restart nginx
```

---

## 🔒 Configurar SSL con Let's Encrypt

### Instalar Certbot

```bash
sudo apt install -y certbot python3-certbot-nginx
```

### Obtener Certificado

```bash
# Automático con Nginx
sudo certbot --nginx -d tu.dominio.com

# O manual
sudo certbot certonly --standalone -d tu.dominio.com
```

### Renovación Automática

```bash
# Verificar que renew está configurado
sudo systemctl enable certbot.timer
sudo systemctl start certbot.timer

# Probar renovación
sudo certbot renew --dry-run
```

---

## 📊 Monitoreo y Logs

### Ver Logs de la Aplicación

```bash
# Logs en tiempo real
sudo journalctl -u control_patrimonial.service -f

# Últimas 100 líneas
sudo journalctl -u control_patrimonial.service -n 100

# Desde una fecha/hora
sudo journalctl -u control_patrimonial.service --since "2025-11-26 10:00:00"

# Logs de la aplicación
tail -f /home/controlpatrimonial/control_patrimonial_web/logs/app.log
```

### Logs de Nginx

```bash
# Acceso
tail -f /var/log/nginx/control_patrimonial_access.log

# Errores
tail -f /var/log/nginx/control_patrimonial_error.log
```

### Monitoreo de Recursos

```bash
# Usar top/htop
htop

# O específicamente el proceso
ps aux | grep gunicorn

# Verificar puertos
sudo netstat -tlnp | grep 5000
```

---

## 🔄 Actualizar Aplicación

### Con Git

```bash
# Conectar como usuario controlpatrimonial
sudo su - controlpatrimonial

cd control_patrimonial_web

# Actualizar código
git pull origin main

# Activar venv
source venv/bin/activate

# Instalar nuevas dependencias (si las hay)
pip install -r requirements.txt

# Reiniciar servicio
exit  # Volver a root
sudo systemctl restart control_patrimonial.service
```

### Manual sin Git

```bash
# Backup de versión actual
sudo cp -r /home/controlpatrimonial/control_patrimonial_web \
    /home/controlpatrimonial/control_patrimonial_web.backup.$(date +%Y%m%d)

# Copiar nuevos archivos
sudo cp nuevos_archivos/* /home/controlpatrimonial/control_patrimonial_web/

# Instalar dependencias
sudo su - controlpatrimonial
cd control_patrimonial_web
source venv/bin/activate
pip install -r requirements.txt

# Reiniciar
exit
sudo systemctl restart control_patrimonial.service
```

---

## 🗄️ Backup de Base de Datos

### Backup Manual

```bash
# Como usuario controlpatrimonial
cd /home/controlpatrimonial/control_patrimonial_web

# Hacer backup
cp data/inventario_patrimonial.db \
    backups/inventario_patrimonial_$(date +%Y%m%d_%H%M%S).db

# O con sqlite3
sqlite3 data/inventario_patrimonial.db ".dump" > \
    backups/inventario_patrimonial_$(date +%Y%m%d_%H%M%S).sql
```

### Backup Automático (Cron)

```bash
# Editar crontab
sudo crontab -e

# Agregar esta línea (backup diario a las 3 AM)
0 3 * * * cp /home/controlpatrimonial/control_patrimonial_web/data/inventario_patrimonial.db /home/controlpatrimonial/control_patrimonial_web/backups/inventario_patrimonial_$(date +\%Y\%m\%d).db
```

### Limpiar Backups Antiguos

```bash
# Crear script cleanup.sh
sudo nano /home/controlpatrimonial/cleanup_backups.sh

# Contenido:
#!/bin/bash
find /home/controlpatrimonial/control_patrimonial_web/backups/ \
    -name "*.db" -mtime +30 -delete

# Hacer ejecutable
sudo chmod +x /home/controlpatrimonial/cleanup_backups.sh

# Agregar a cron (limpiar backups > 30 días)
0 4 * * * /home/controlpatrimonial/cleanup_backups.sh
```

---

## 🔍 Troubleshooting

### Error: "Address already in use"

```bash
# Encontrar proceso en puerto 5000
sudo lsof -i :5000

# O con netstat
sudo netstat -tlnp | grep 5000

# Matar proceso si es necesario
sudo kill -9 <PID>

# Reiniciar servicio
sudo systemctl restart control_patrimonial.service
```

### Error: "Permission denied"

```bash
# Verificar propietario
ls -l /home/controlpatrimonial/control_patrimonial_web/

# Cambiar propietario
sudo chown -R controlpatrimonial:www-data \
    /home/controlpatrimonial/control_patrimonial_web/

# Permisos
sudo chmod -R 755 /home/controlpatrimonial/control_patrimonial_web/
```

### Nginx retorna 502 Bad Gateway

```bash
# Verificar que Gunicorn está corriendo
sudo systemctl status control_patrimonial.service

# Verificar logs de Gunicorn
sudo journalctl -u control_patrimonial.service -n 50

# Verificar que puerto 5000 esté escuchando
sudo netstat -tlnp | grep 5000

# Reiniciar Gunicorn
sudo systemctl restart control_patrimonial.service
```

### Certificado SSL caducado

```bash
# Renovar certificado
sudo certbot renew

# O forzar renovación
sudo certbot renew --force-renewal

# Reiniciar Nginx
sudo systemctl restart nginx
```

---

## 📈 Optimizaciones Recomendadas

### Aumentar Workers de Gunicorn

Para servidores más potentes, modificar `/etc/systemd/system/control_patrimonial.service`:

```ini
ExecStart=/home/controlpatrimonial/control_patrimonial_web/venv/bin/gunicorn \
    --workers 8 \
    --worker-class sync \
    ...
```

Regla: `(2 × CPU cores) + 1`

### Agregar Redis para Caching

```bash
# Instalar Redis
sudo apt install -y redis-server

# Configurar en app
pip install flask-caching redis
```

### Load Balancing

Para múltiples servidores:

```nginx
upstream control_patrimonial_backend {
    server 127.0.0.1:5000;
    server 127.0.0.1:5001;
    server 127.0.0.1:5002;
}
```

---

## 📞 Soporte en Producción

### Monitoreo Recomendado

- [ ] Configurar Sentry para errores
- [ ] Configurar New Relic o DataDog para APM
- [ ] Configurar alertas de CPU/Memoria
- [ ] Configurar alertas de SSL certificates
- [ ] Configurar health checks

### Procedimientos Operativos

Documentar:
- [ ] Cómo reiniciar la aplicación
- [ ] Cómo hacer backups
- [ ] Cómo hacer updates
- [ ] Cómo reportar problemas
- [ ] Escalamiento plan

---

## ✅ Checklist Final

Antes de dar por completado:

- [ ] Aplicación está corriendo
- [ ] SSL funciona (HTTPS)
- [ ] Logs se generan correctamente
- [ ] Backups están configurados
- [ ] Monitoreo está activo
- [ ] Usuarios pueden hacer login
- [ ] Usuarios pueden crear/editar bienes
- [ ] Estadísticas carga correctamente
- [ ] API REST funciona
- [ ] Documentación está accesible

---

**Despliegue Completado ✅**

Para preguntas o problemas, revisar logs y documentación.

Fecha de despliegue: _______________

Responsable: _______________

Validado por: _______________
