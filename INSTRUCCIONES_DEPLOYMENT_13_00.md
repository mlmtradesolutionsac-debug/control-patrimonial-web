# 🚀 INSTRUCCIONES DE DEPLOYMENT - 13:00 HOY

**Estado**: ✅ Todos los cambios de código completados
**Hora**: 13:00 (refrigerio de inventariadores)
**Tiempo estimado**: 15-20 minutos
**Riesgo**: BAJO (todo está preparado)

---

## ✅ CAMBIOS YA REALIZADOS (9:49 - 11:00)

```
✅ config.py               - DATABASE_URL validación obligatoria
✅ app/__init__.py         - /health y /ready endpoints
✅ requirements.prod.txt   - google-cloud-sql-connector, logging, secrets
✅ entrypoint.sh           - CREADO (migraciones automáticas)
✅ Dockerfile              - Multi-stage build (200MB más pequeño)
✅ deploy_gcp.sh           - Script completo y listo
```

---

## 🎯 TAREAS A LAS 13:00 (SOLO 2 COMANDOS)

### PASO 1: Hacer backup de seguridad (3 minutos)

```bash
# Abrir terminal/PowerShell
# Loguearse en GCP (si no está autenticado)
gcloud auth login

# Crear backup manual de Cloud SQL
gcloud sql backups create \
  --instance=patrimonial-db \
  --description="Pre-maintenance-backup-$(date +%s)"

echo "✓ Backup completado"
```

### PASO 2: Ejecutar deployment (10-15 minutos)

```bash
# Navegar al directorio del proyecto
cd "E:\PROYECTOS WEB\control_patrimonial_web"

# Ejecutar el script de deployment
bash deploy_gcp.sh

# El script automáticamente:
# 1. Build Docker image con Cloud Build
# 2. Deploy a Cloud Run con configuración completa
# 3. Configura Cloud SQL, env vars, secretos, health checks
```

**DURANTE ESTE TIEMPO**: La app estará en deployment (~10-15 min)

### PASO 3: Verificación (2 minutos)

```bash
# Esperar a que termine el script
# Al final mostrará la URL

# Verificar health check
curl https://control-patrimo-web-195522615542.us-central1.run.app/health

# Esperado: {"status": "healthy", "timestamp": "..."}

# Verificar que puede ver login
curl https://control-patrimo-web-195522615542.us-central1.run.app/auth/login
# Esperado: HTML del formulario de login (200)

# Verificar logs
gcloud run logs read control-patrimo-web --limit 20
```

---

## ⚠️ IMPORTANTE: Secretos de Google Cloud

**ANTES de ejecutar Paso 2**, verifica que estos secretos existen en GCP Secret Manager:

```bash
# Listar secretos
gcloud secrets list

# Verificar SECRET_KEY
gcloud secrets describe SECRET_KEY

# Verificar DB_PASSWORD
gcloud secrets describe db-password
```

**SI NO EXISTEN**, créalos:

```bash
# Crear SECRET_KEY (generar valor fuerte)
python3 -c "import secrets; print(secrets.token_hex(32))" | \
  gcloud secrets create SECRET_KEY --data-file=-

# Crear DB_PASSWORD (usar password de Cloud SQL)
echo "TU_PASSWORD_POSTGRESQL" | \
  gcloud secrets create db-password --data-file=-
```

---

## 🆘 SI ALGO FALLA

### Error 1: "DATABASE_URL required"
**Causa**: Secreto DB_PASSWORD no existe
**Solución**: Crear secreto (ver sección anterior)

### Error 2: "Cloud SQL instance not found"
**Causa**: Instancia patrimonial-db no existe en GCP
**Solución**: Contactar admin GCP para crear instancia

### Error 3: "Timeout connecting to Cloud SQL"
**Causa**: Service Account sin permisos
**Solución**: Agregar permisos Cloud SQL Client al Service Account

### Rollback de emergencia (si todo falla)
```bash
# Revertir a versión anterior
gcloud run deploy control-patrimo-web \
  --region us-central1 \
  --image gcr.io/steam-outlet-480502-d7/control-patrimo-web:latest

# O restaurar BD desde backup
gcloud sql backups restore [BACKUP_ID] \
  --instance=patrimonial-db
```

---

## 📋 CHECKLIST FINAL

```
ANTES DE LAS 13:00:
[ ] Terminal/PowerShell abierto
[ ] Google Cloud SDK instalado (gcloud command funciona)
[ ] Autenticación en GCP: gcloud auth login
[ ] Secretos creados: SECRET_KEY y db-password
[ ] Cambios de código están en repositorio (git)

A LAS 13:00:
[ ] Hacer backup de Cloud SQL
[ ] Ejecutar: bash deploy_gcp.sh
[ ] Esperar 10-15 minutos
[ ] Verificar health check
[ ] Probar login
[ ] Ver logs

DESPUÉS:
[ ] Sistema funcionando
[ ] Inventariadores pueden entrar mañana
[ ] Comunicar a usuarios que sistema está actualizado
```

---

## 🎯 RESULTADO ESPERADO

Después de ejecutar `bash deploy_gcp.sh`:

```
✓ Cloud Build construye imagen (5-7 min)
✓ Imagen sube a Container Registry
✓ Cloud Run despliega instancia (3-5 min)
✓ Migraciones de BD se ejecutan automáticamente
✓ /health endpoint responde "healthy"
✓ Login funciona
✓ Datos persisten en Cloud SQL
✓ Sistema listo para mañana
```

---

## 📞 CONTACTO SI HAY PROBLEMAS

**Tiempo de soporte**: 13:00 - 14:00 (durante deployment)

Si algo falla, contactar con evidencia de:
- Output completo de `bash deploy_gcp.sh`
- Output de `gcloud run logs read control-patrimo-web`
- Pantalla de error exacta

---

**DOCUMENTO CREADO**: 2025-12-10 11:00
**PRÓXIMA EJECUCIÓN**: HOY 13:00
**INVENTARIADORES RETOMAN**: MAÑANA
