# Instrucciones de Instalación - Control Patrimonial en Servidor

## Estado Actual

✅ **Completado en local:**
- Código transferido a servidor
- PostgreSQL instalado en servidor
- Usuario y BD creados
- Script de instalación listo en `/tmp/INSTALL_PRODUCTION.sh`

## 📋 Próximos Pasos para Completar la Instalación

Necesitas conectarte al servidor y ejecutar el script de instalación con permisos de administrador (root o con sudo).

### Paso 1: Conectar al Servidor

```bash
ssh patrimonio@10.28.106.250
```

**Credenciales:**
- Usuario: `patrimonio`
- IP: `10.28.106.250`

### Paso 2: Ejecutar Script de Instalación

Una vez conectado, ejecuta:

```bash
sudo bash /tmp/INSTALL_PRODUCTION.sh
```

Este script hará automáticamente:

1. ✅ Preparar directorios (`/opt/control_patrimonial`)
2. ✅ Crear usuario de aplicación (`app`)
3. ✅ Crear entorno virtual de Python
4. ✅ Instalar dependencias
5. ✅ Generar `SECRET_KEY` fuerte
6. ✅ Crear archivo `.env.production`
7. ✅ Ejecutar migraciones de BD
8. ✅ Descargar Bootstrap localmente
9. ✅ Instalar y configurar Gunicorn
10. ✅ Configurar servicio systemd
11. ✅ Configurar Nginx como reverse proxy
12. ✅ Iniciar aplicación

**⏱️ Tiempo estimado**: 5-10 minutos

### Paso 3: Verificar que todo Funciona

```bash
# Ver status del servicio
systemctl status control_patrimonial

# Ver logs en vivo
journalctl -u control_patrimonial -f

# Test de API
curl http://localhost/api/health
```

### Paso 4: Acceder a la Aplicación

Abre tu navegador y ve a:

```
http://10.28.106.250
```

Deberías ver la pantalla de login de Control Patrimonial.

---

## 🔧 Información de Instalación

### Base de Datos
- **Host**: `localhost`
- **Puerto**: `5432`
- **Usuario**: `control_patrimonial`
- **Contraseña**: `Control2025Patrimonial!`
- **BD**: `control_patrimonial`

### Aplicación
- **Directorio**: `/opt/control_patrimonial`
- **Usuario systemd**: `app`
- **Puerto**: `80` (HTTP vía Nginx)
- **Socket**: `/opt/control_patrimonial/app.sock`

### Logs
- **Aplicación**: `/var/log/control_patrimonial/error.log`
- **Nginx**: `/var/log/nginx/control_patrimonial_error.log`
- **systemd**: `journalctl -u control_patrimonial`

---

## 📌 Verificaciones de Seguridad Post-Instalación

Una vez instalado, verifica:

### 1. PostgreSQL está accesible

```bash
psql -h localhost -U control_patrimonial -d control_patrimonial -c "SELECT 1"
```

### 2. Servicio está activo

```bash
sudo systemctl status control_patrimonial
```

### 3. Nginx está sirviendo

```bash
curl -I http://localhost
```

### 4. API responde

```bash
curl http://localhost/api/health
```

### 5. Verificar contraseñas configuradas

```bash
# En el servidor
grep "SECRET_KEY\|DATABASE_URL" /opt/control_patrimonial/.env.production
```

---

## 🚀 Próximos Pasos Recomendados

### 1. Configurar SSL/HTTPS
```bash
sudo apt-get install certbot python3-certbot-nginx
sudo certbot certonly --nginx -d tu-dominio.com
```

Actualizar `/etc/nginx/sites-available/control_patrimonial` para usar HTTPS.

### 2. Configurar Firewall
```bash
sudo ufw allow 22/tcp
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw enable
```

### 3. Configurar Backups Automáticos
```bash
# Crear script de backup
cat > /home/patrimonio/backup_db.sh << 'EOF'
#!/bin/bash
BACKUP_DIR="/opt/backups"
mkdir -p $BACKUP_DIR
pg_dump -U control_patrimonial control_patrimonial | gzip > "$BACKUP_DIR/db_$(date +%Y%m%d_%H%M%S).sql.gz"
find $BACKUP_DIR -name "db_*.sql.gz" -mtime +7 -delete  # Eliminar backups >7 días
EOF

chmod +x /home/patrimonio/backup_db.sh

# Agregar a crontab
(crontab -l 2>/dev/null; echo "0 2 * * * /home/patrimonio/backup_db.sh") | crontab -
```

### 4. Monitorear Aplicación
```bash
# Ver logs en tiempo real
tail -f /var/log/control_patrimonial/error.log

# Ver estadísticas de PostgreSQL
psql -U control_patrimonial -d control_patrimonial -c "\dt"

# Ver uso de disco
df -h /opt/control_patrimonial
```

---

## ❌ Solución de Problemas

### La aplicación no inicia

```bash
# Ver error detallado
journalctl -u control_patrimonial -n 50 -p err

# Verificar permisos
ls -la /opt/control_patrimonial
sudo chown -R app:app /opt/control_patrimonial
```

### PostgreSQL no responde

```bash
# Verificar estado
sudo systemctl status postgresql

# Ver logs
sudo tail -f /var/log/postgresql/postgresql.log

# Reiniciar
sudo systemctl restart postgresql
```

### Nginx muestra error

```bash
# Verificar configuración
sudo nginx -t

# Ver logs
sudo tail -f /var/log/nginx/error.log

# Reiniciar
sudo systemctl restart nginx
```

### Puerto 80 en uso

```bash
# Ver qué está usando el puerto
sudo lsof -i :80

# Cambiar puerto en Nginx si necesario
sudo nano /etc/nginx/sites-available/control_patrimonial
# Cambiar "listen 80" a "listen 8080"
```

---

## 📞 Soporte

Para problemas durante la instalación:

1. Revisa los logs específicos mencionados arriba
2. Verifica que PostgreSQL esté activo: `sudo systemctl status postgresql`
3. Verifica permisos de archivos en `/opt/control_patrimonial`
4. Confirma que el puerto 80 está disponible

---

## ✅ Checklist de Instalación

- [ ] SSH al servidor exitoso
- [ ] Script `/tmp/INSTALL_PRODUCTION.sh` existe
- [ ] Script ejecutado con `sudo bash /tmp/INSTALL_PRODUCTION.sh`
- [ ] Servicio systemd `control_patrimonial` está activo
- [ ] Nginx está sirviendo en puerto 80
- [ ] API responde en `http://10.28.106.250/api/health`
- [ ] Puedo acceder a `http://10.28.106.250`
- [ ] PostgreSQL está respondiendo
- [ ] Logs sin errores críticos
- [ ] SSL/HTTPS configurado (opcional pero recomendado)
- [ ] Backups automáticos configurados
- [ ] Firewall configurado

---

**¡Listo! Una vez completados estos pasos, Control Patrimonial estará en producción y accesible.**

Para actualizaciones futuras, ver `UPDATE_GUIDE.md`.
