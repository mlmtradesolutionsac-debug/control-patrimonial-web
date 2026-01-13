# Guía de Configuración HTTPS con Let's Encrypt

**Control Patrimonial Web**

**Fecha**: 2025-12-10
**Versión**: 1.0
**Aplicable para**: Ubuntu 24.04 LTS
**Servidor actual**: 10.28.106.250

---

## ⚠️ ADVERTENCIA IMPORTANTE

🔴 **ESTA GUÍA ES PARA DOCUMENTACIÓN Y REFERENCIA**

**NO EJECUTAR en producción sin**:
1. ✅ Aprobación explícita del usuario
2. ✅ Backup completo de la base de datos
3. ✅ Ventana de mantenimiento programada (puede causar downtime)
4. ✅ Plan de rollback disponible

**Impacto**:
- Puede causar downtime temporal (5-10 minutos)
- Requiere reiniciar Nginx
- Cambios no son reversibles fácilmente

---

## 1. PREREQUISITOS

### 1.1 Verificaciones previas

Antes de comenzar, verificar:

```bash
# Conectar al servidor
ssh patrimonio@10.28.106.250

# Verificar que Nginx está corriendo
sudo systemctl status nginx
# Resultado esperado: Active: active (running)

# Verificar que la aplicación es accesible
curl -I http://127.0.0.1
# Resultado esperado: HTTP/1.1 200 OK

# Verificar que PostgreSQL está corriendo
sudo systemctl status postgresql
# Resultado esperado: Active: active (running)

# Verificar puertos abiertos
sudo ufw status
# Resultado esperado: Puerto 80 y 443 abiertos
```

### 1.2 Requisitos de dominio

**Necesario**: Tener un dominio registrado apuntando a la IP 10.28.106.250

Ejemplo:
```
control-patrimonial.ejemplo.com    A    10.28.106.250
```

Verificar DNS:
```bash
nslookup control-patrimonial.ejemplo.com
# Resultado esperado: 10.28.106.250
```

### 1.3 Puertos requeridos

Asegurar que puertos 80 y 443 están abiertos:

```bash
# Verificar firewall
sudo ufw status
# Si no está habilitado, habilitar con:
sudo ufw enable

# Abrir puerto 80 (HTTP)
sudo ufw allow 80/tcp

# Abrir puerto 443 (HTTPS)
sudo ufw allow 443/tcp

# Verificar
sudo ufw status numbered
```

---

## 2. INSTALACIÓN DE CERTBOT

### 2.1 Instalar Certbot y plugin Nginx

```bash
# Actualizar package manager
sudo apt update
sudo apt upgrade -y

# Instalar Certbot
sudo apt install -y certbot python3-certbot-nginx

# Verificar instalación
certbot --version
# Resultado esperado: certbot 2.x.x
```

### 2.2 Verificar que Nginx está accesible desde Internet

```bash
# Desde AFUERA del servidor (en tu máquina):
curl -I http://control-patrimonial.ejemplo.com

# Resultado esperado: HTTP/1.1 200 OK
# (Si falla, revisar DNS y firewall)
```

---

## 3. OBTENER CERTIFICADO SSL/TLS

### 3.1 Opción A: Modo interactivo (RECOMENDADO para primera vez)

```bash
# Ejecutar Certbot en modo interactivo
sudo certbot certonly --nginx -d control-patrimonial.ejemplo.com

# Preguntas que hará:
# 1. Email para recuperación: [tu-email@ejemplo.com]
# 2. Aceptar términos: Y
# 3. Compartir email con EFF: N (opcional)
```

**Resultado esperado**:
```
Successfully received certificate.
Certificate is saved at: /etc/letsencrypt/live/control-patrimonial.ejemplo.com/fullchain.pem
Key is saved at: /etc/letsencrypt/live/control-patrimonial.ejemplo.com/privkey.pem
```

### 3.2 Opción B: Modo automático (Scripts)

```bash
# Genera certificado y modifica Nginx automáticamente
sudo certbot --nginx -d control-patrimonial.ejemplo.com --non-interactive \
  --agree-tos \
  --email tu-email@ejemplo.com
```

### 3.3 Verificar certificado

```bash
# Ver detalles del certificado
sudo certbot certificates

# Resultado esperado:
# control-patrimonial.ejemplo.com
#   Certificate Path: /etc/letsencrypt/live/control-patrimonial.ejemplo.com/fullchain.pem
#   Expiry Date: 2026-03-... (90 días desde hoy)
```

---

## 4. CONFIGURAR NGINX

### 4.1 Estructura de configuración Nginx

**Archivo principal**: `/etc/nginx/sites-available/control-patrimonial`

**ANTES** (sin HTTPS):
```nginx
server {
    listen 80;
    server_name control-patrimonial.ejemplo.com;

    location / {
        proxy_pass http://127.0.0.1:8000;
        proxy_set_header Host $host;
        # ... más headers ...
    }
}
```

**DESPUÉS** (con HTTPS):
```nginx
# Redirigir HTTP → HTTPS
server {
    listen 80;
    server_name control-patrimonial.ejemplo.com;

    # Permitir validación de Let's Encrypt
    location /.well-known/acme-challenge/ {
        root /var/www/certbot;
    }

    # Redirigir todo lo demás a HTTPS
    location / {
        return 301 https://$server_name$request_uri;
    }
}

# HTTPS seguro
server {
    listen 443 ssl http2;
    server_name control-patrimonial.ejemplo.com;

    # Certificados SSL
    ssl_certificate /etc/letsencrypt/live/control-patrimonial.ejemplo.com/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/control-patrimonial.ejemplo.com/privkey.pem;

    # Configuración de seguridad SSL
    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_ciphers HIGH:!aNULL:!MD5;
    ssl_prefer_server_ciphers on;
    ssl_session_cache shared:SSL:10m;
    ssl_session_timeout 10m;

    # Headers de seguridad
    add_header Strict-Transport-Security "max-age=31536000; includeSubDomains" always;
    add_header X-Content-Type-Options "nosniff" always;
    add_header X-Frame-Options "SAMEORIGIN" always;
    add_header X-XSS-Protection "1; mode=block" always;
    add_header Referrer-Policy "no-referrer-when-downgrade" always;

    # Proxy a Gunicorn
    location / {
        proxy_pass http://127.0.0.1:8000;

        # Headers de proxy
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;

        # Timeouts
        proxy_connect_timeout 120s;
        proxy_send_timeout 120s;
        proxy_read_timeout 120s;
    }

    # Caché de estáticos
    location /static/ {
        alias /home/patrimonio/control_patrimonial/app/static/;
        expires 30d;
        add_header Cache-Control "public, immutable";
    }

    # Gzip compression
    gzip on;
    gzip_types text/plain text/css text/xml text/javascript
               application/x-javascript application/xml+rss
               application/rss+xml application/atom+xml image/svg+xml
               text/x-js text/x-component text/x-cross-domain-policy;
    gzip_comp_level 6;
    gzip_min_length 1000;
}
```

### 4.2 Aplicar cambios a Nginx

```bash
# Editar archivo
sudo nano /etc/nginx/sites-available/control-patrimonial
# (Reemplazar contenido con la configuración anterior)

# Validar sintaxis
sudo nginx -t
# Resultado esperado: syntax is ok

# Recargar Nginx
sudo systemctl reload nginx

# Verificar que está corriendo
sudo systemctl status nginx
```

---

## 5. RENOVACIÓN AUTOMÁTICA DE CERTIFICADOS

### 5.1 Configurar renovación automática

Let's Encrypt emite certificados válidos por 90 días.
Certbot incluye servicio para renovar automáticamente.

```bash
# Habilitar servicio de renovación
sudo systemctl enable certbot.timer
sudo systemctl start certbot.timer

# Verificar estado
sudo systemctl status certbot.timer
# Resultado esperado: Active: active (waiting)

# Ver próxima renovación programada
sudo systemctl list-timers certbot.timer
```

### 5.2 Probar renovación (Sin ejecutar realmente)

```bash
# Test dry-run
sudo certbot renew --dry-run

# Resultado esperado:
# Cert not due for renewal, but simulating renewal for testing purposes...
# Simulated renewal: control-patrimonial.ejemplo.com
```

### 5.3 Monitorear renovaciones

```bash
# Ver log de renovaciones
sudo tail -f /var/log/letsencrypt/letsencrypt.log

# O desde journalctl
sudo journalctl -u certbot.timer -f
```

---

## 6. ACTUALIZAR CONFIGURACIÓN DE FLASK

### 6.1 Modificar config.py

**Cambios requeridos**:

```python
# config.py - ProductionConfig class

# ANTES
SESSION_COOKIE_SECURE = False
REMEMBER_COOKIE_SECURE = False

# DESPUÉS
SESSION_COOKIE_SECURE = True     # ✅ Solo enviar sobre HTTPS
REMEMBER_COOKIE_SECURE = True    # ✅ Solo enviar sobre HTTPS
```

**Archivo completo de cambios**:

```bash
# Conectar al servidor
ssh patrimonio@10.28.106.250

# Editar config.py
cd control_patrimonial
nano config.py

# Hacer cambios y guardar (Ctrl+X, Y, Enter)

# Reiniciar Gunicorn
sudo systemctl restart gunicorn
```

### 6.2 Actualizar .env.production

```bash
# Agregar variables
nano .env.production

# Agregar/modificar:
FLASK_ENV=production
DEBUG=False
SESSION_COOKIE_SECURE=True
REMEMBER_COOKIE_SECURE=True
```

---

## 7. VERIFICACIÓN DE CONFIGURACIÓN

### 7.1 Pruebas básicas

```bash
# 1. Verificar que HTTP redirige a HTTPS
curl -I http://control-patrimonial.ejemplo.com
# Resultado esperado: HTTP/1.1 301 Moved Permanently
# Location: https://control-patrimonial.ejemplo.com

# 2. Verificar HTTPS
curl -I https://control-patrimonial.ejemplo.com
# Resultado esperado: HTTP/1.1 200 OK

# 3. Verificar certificado
openssl s_client -connect control-patrimonial.ejemplo.com:443
# Resultado esperado: Verify return code: 0 (ok)
```

### 7.2 Verificación de seguridad SSL

```bash
# Opción A: Usando comando openssl
openssl s_client -connect control-patrimonial.ejemplo.com:443 -showcerts

# Opción B: Usar herramienta online
# Visitar: https://www.ssllabs.com/ssltest/
# Ingresar: control-patrimonial.ejemplo.com
# Esperar análisis (puede tomar 2-3 minutos)
# Resultado esperado: A o A+ rating
```

### 7.3 Verificar que cookies se envían seguras

**Desde navegador**:
1. Abrir: `https://control-patrimonial.ejemplo.com/auth/login`
2. Ingresar credenciales
3. Abrir DevTools (F12)
4. Ir a "Storage" → "Cookies"
5. Ver `session` cookie
6. Verificar que tiene flags:
   - ✅ Secure (solo se envía por HTTPS)
   - ✅ HttpOnly (no accesible por JavaScript)
   - ✅ SameSite=Lax (CSRF protection)

---

## 8. CHECKLIST DE VERIFICACIÓN POST-CONFIGURACIÓN

Ejecutar antes de considerar "completado":

```
PRE-VERIFICACIÓN
☐ Backup de BD completado
☐ Backup de /etc/nginx/sites-available/ completado
☐ Backup de config.py completado
☐ Comunicación a usuarios sobre mantenimiento

CONFIGURACIÓN
☐ Certbot instalado y certificado obtenido
☐ Nginx reconfigura y validado
☐ Flask config.py modificado con HTTPS flags
☐ Gunicorn reiniciado

VERIFICACIÓN HTTP/HTTPS
☐ HTTP redirige a HTTPS
☐ HTTPS funciona (código 200)
☐ SSL Labs da rating A o A+
☐ Certificado válido sin warnings

VERIFICACIÓN DE APLICACIÓN
☐ Login funciona (cookies seguras)
☐ Dashboard es accesible
☐ API endpoints responden
☐ Exportación de Excel funciona
☐ Importación de Excel funciona

VERIFICACIÓN DE SEGURIDAD
☐ Headers de seguridad presentes (HSTS, CSP, etc.)
☐ No hay warnings de contenido mixto (mixed content)
☐ Certificado será renovado automáticamente
☐ Logs de Nginx muestran acceso exitoso

POST-DEPLOY
☐ Comunicar a usuarios que HTTPS está activo
☐ Actualizar enlaces en documentación
☐ Monitorear logs durante las primeras 24h
☐ Verificar renovación automática en 7 días
```

---

## 9. SOLUCIÓN DE PROBLEMAS

### P1: "ERROR: Invalid response from"

**Causa**: Dominio no resuelve correctamente a la IP.

**Solución**:
```bash
# Verificar DNS
nslookup control-patrimonial.ejemplo.com
# Debe mostrar: 10.28.106.250

# Esperar propagación (puede tomar 24h)
dig control-patrimonial.ejemplo.com +short
```

---

### P2: "ERROR: The server will not issue a certificate"

**Causa**: Port 80 (HTTP) no es accesible desde Internet.

**Solución**:
```bash
# Verificar firewall
sudo ufw status
# Debe mostrar puerto 80 abierto

# Verificar que Nginx escucha en puerto 80
sudo ss -tln | grep 80
# Resultado esperado: LISTEN 0.0.0.0:80

# Revisar configuración Nginx
sudo nginx -t
```

---

### P3: "SSL: CERTIFICATE_VERIFY_FAILED"

**Causa**: Certificado expirado o inválido.

**Solución**:
```bash
# Ver certificados actuales
sudo certbot certificates

# Si está por expirar, renovar manualmente
sudo certbot renew --force-renewal

# Recargar Nginx
sudo systemctl reload nginx
```

---

### P4: "Mixed Content" warnings en navegador

**Causa**: La página HTTPS intenta cargar recursos por HTTP.

**Solución**: Actualizar templates para usar protocolo relativo:

```html
<!-- ANTES: ❌ Protocolo explícito -->
<img src="http://domain/image.png">
<script src="http://cdn.example.com/script.js"></script>

<!-- DESPUÉS: ✅ Protocolo relativo -->
<img src="/image.png">
<script src="//cdn.example.com/script.js"></script>

<!-- O HTTPS explícito -->
<script src="https://cdn.example.com/script.js"></script>
```

---

### P5: "Too many redirects" en navegador

**Causa**: Configuración cíclica de redirecciones.

**Solución**:
```bash
# Revisar configuración Nginx
sudo nginx -t

# Si hay error, restaurar backup
sudo cp /etc/nginx/sites-available/control-patrimonial.backup \
        /etc/nginx/sites-available/control-patrimonial

# Recargar
sudo systemctl reload nginx
```

---

## 10. MONITOREO CONTÍNUO

### 10.1 Comprobar estado del certificado regularmente

```bash
# Crear script de monitoreo
cat > /home/patrimonio/check_ssl.sh << 'EOF'
#!/bin/bash

# Verificar que certificado es válido
certbot certificates

# Verificar que se renovará automáticamente
systemctl status certbot.timer

# Comprobar días hasta expiración
openssl x509 -in /etc/letsencrypt/live/control-patrimonial.ejemplo.com/cert.pem \
    -noout -dates

echo "SSL check completed"
EOF

chmod +x /home/patrimonio/check_ssl.sh

# Programar ejecución semanal
(crontab -l 2>/dev/null; echo "0 9 * * 0 /home/patrimonio/check_ssl.sh >> /var/log/ssl-check.log 2>&1") | crontab -
```

### 10.2 Alertas automáticas

```bash
# Crear script de alerta si falta menos de 30 días
cat > /home/patrimonio/alert_ssl.sh << 'EOF'
#!/bin/bash

CERT_PATH="/etc/letsencrypt/live/control-patrimonial.ejemplo.com/cert.pem"
EXPIRY=$(openssl x509 -in $CERT_PATH -noout -dates | grep notAfter | cut -d= -f2)
EXPIRY_EPOCH=$(date -d "$EXPIRY" +%s)
NOW=$(date +%s)
DAYS_LEFT=$(( ($EXPIRY_EPOCH - $NOW) / 86400 ))

if [ $DAYS_LEFT -lt 30 ]; then
    # Enviar alerta (si tienes servicio de alertas)
    echo "ALERTA: Certificado vence en $DAYS_LEFT días"
    # curl -X POST https://tu-alerta/webhook -d "cert_expires_in=$DAYS_LEFT"
fi
EOF

chmod +x /home/patrimonio/alert_ssl.sh
```

---

## 11. ROLLBACK (En caso de problemas)

### 11.1 Si algo falla

```bash
# Detener Nginx
sudo systemctl stop nginx

# Restaurar configuración anterior
sudo cp /etc/nginx/sites-available/control-patrimonial.backup \
        /etc/nginx/sites-available/control-patrimonial

# Restaurar config.py
cd /home/patrimonio/control_patrimonial
git checkout config.py  # Si está en Git

# Reiniciar
sudo systemctl start nginx

# Verificar
curl -I http://127.0.0.1
```

### 11.2 Eliminar certificado (si es necesario)

```bash
# ADVERTENCIA: Esto elimina el certificado y requiere empezar de nuevo
sudo certbot delete --cert-name control-patrimonial.ejemplo.com

# Más seguro: Solo deshabilitar renovación automática
sudo certbot revoke --cert-path /etc/letsencrypt/live/control-patrimonial.ejemplo.com/fullchain.pem
```

---

## 12. PRÓXIMOS PASOS

Después de configurar HTTPS:

### Fase 1 completada ✅
- [x] HTTPS configurado
- [x] Certificado automático con renovación

### Próximas mejoras (del PLAN_MEJORAS.md):
- [ ] Rate limiting (M1.3)
- [ ] Validación de datos (M1.4)
- [ ] Mejorar CSP (M1.5)
- [ ] Bloqueo de cuentas (M2.1)
- [ ] Backups automatizados (M2.3)

---

## 13. REFERENCIAS

### Documentación oficial
- Let's Encrypt: https://letsencrypt.org/
- Certbot: https://certbot.eff.org/
- Nginx SSL: https://nginx.org/en/docs/http/ngx_http_ssl_module.html

### Herramientas de prueba
- SSL Labs: https://www.ssllabs.com/ssltest/
- Mozilla SSL Configuration: https://ssl-config.mozilla.org/

### Seguridad
- OWASP: https://owasp.org/
- HSTS Preload: https://hstspreload.org/

---

## 14. SOPORTE

**Si tienes problemas**:

1. Revisar sección 9 (Solución de problemas)
2. Revisar logs:
   ```bash
   sudo tail -f /var/log/letsencrypt/letsencrypt.log
   sudo tail -f /var/log/nginx/error.log
   ```
3. Contactar soporte técnico con información de:
   - Output de `certbot certificates`
   - Output de `sudo nginx -t`
   - Último error en `/var/log/letsencrypt/letsencrypt.log`

---

**Fin de la guía de configuración HTTPS**

**Última actualización**: 2025-12-10
**Versión**: 1.0
