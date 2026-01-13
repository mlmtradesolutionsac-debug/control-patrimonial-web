# Análisis de Despliegue - Control Patrimonial Web

**Fecha de análisis**: 2025-12-10
**Versión del documento**: 1.0
**Estado**: Completado

---

## RESUMEN EJECUTIVO

El sistema está **DOBLEMENTE DESPLEGADO** en dos infraestructuras:

1. **Google Cloud Run** (Principal, escalable)
   - Estado: Configurado pero no activamente desplegado
   - URL: `https://control-patrimo-web-195522615542.us-central1.run.app/`
   - HTTPS: ✅ Automático

2. **Servidor Ubuntu** (Actualmente operativo)
   - IP: `10.28.106.250`
   - Estado: ✅ OPERACIONAL desde 28 de noviembre 2025
   - URL: `http://10.28.106.250/`
   - HTTPS: ❌ NO configurado

---

## 1. DOCKER Y CONTENEDOR

### 1.1 Dockerfile

**Ubicación**: `E:\PROYECTOS WEB\control_patrimonial_web\Dockerfile`

**Especificaciones**:
```dockerfile
FROM python:3.11-slim          # Imagen base: 180MB (vs 900MB con python:3.11)
ENV PYTHONDONTWRITEBYTECODE=1  # No generar .pyc files
ENV PYTHONUNBUFFERED=1         # Output sin buffer

WORKDIR /app
RUN apt-get update && apt-get install -y \
    gcc libpq-dev              # Para compilar psycopg2 (PostgreSQL)

COPY requirements.prod.txt .
RUN pip install --no-cache-dir -r requirements.prod.txt

RUN useradd -m -u 1000 appuser  # Usuario no-root (seguridad)
RUN chown -R appuser:appuser /app
USER appuser

EXPOSE $PORT                    # Puerto dinámico (Cloud Run)
CMD ["gunicorn", "--config", "gunicorn_config.py", "--bind", ":$PORT", "wsgi:app"]
```

**Ventajas**:
- ✅ Imagen slim (190MB vs 900MB)
- ✅ Sin caché pip (reduce tamaño)
- ✅ Usuario no-root para seguridad
- ✅ PYTHONUNBUFFERED para Cloud Logging
- ✅ Puerto dinámico (compatible con Cloud Run)

**Mejoras posibles**:
- Multi-stage build podría reducir más (eliminar gcc después compilación)
- Específicar versión de Python (3.11.9, no solo 3.11)

### 1.2 .dockerignore

**Archivos excluidos** (39 líneas):
- ✅ Archivos Git (.git, .gitignore, .github)
- ✅ Entorno virtual (venv, env, .venv)
- ✅ Cache Python (__pycache__, *.pyc, .pytest_cache)
- ✅ Archivos .env (secretos, NO committear)
- ✅ Bases de datos locales (*.db, *.sqlite3)
- ✅ Documentación (*.md excepto README)
- ✅ Tests, logs, node_modules

**Resultado**:
- Imagen final: ~190MB
- Sin datos sensibles
- Sin archivos innecesarios

---

## 2. CONFIGURACIÓN DE GUNICORN

### 2.1 gunicorn_config.py

**Ubicación**: `E:\PROYECTOS WEB\control_patrimonial_web\gunicorn_config.py`

**Configuración de workers**:
```python
import multiprocessing

workers = int(os.environ.get(
    'GUNICORN_WORKERS',
    multiprocessing.cpu_count() * 2 + 1
))
# Fórmula: (2 × núcleos CPU) + 1
# Ejemplo: Si CPU tiene 2 núcleos → 5 workers
```

**Configuración de puerto**:
```python
port = os.environ.get('PORT', '8080')
bind = os.environ.get('GUNICORN_BIND', f'0.0.0.0:{port}')
# Cloud Run inyecta PORT automáticamente
# Servidor local puede usar GUNICORN_BIND=127.0.0.1:8000
```

**Timeouts y keepalive**:
```python
timeout = 120                    # Máximo 120 segundos por request
keepalive = 5                    # Mantener conexión 5 segundos
max_requests = 1000             # Reciclar worker tras 1000 requests
max_requests_jitter = 50        # Aleatorizar para evitar picos
```

**Logging**:
```python
accesslog = '-'                 # Stdout (para Cloud Logging)
errorlog = '-'                  # Stderr
loglevel = 'info'               # Configurable vía GUNICORN_LOG_LEVEL
access_log_format = '%(h)s %(l)s %(u)s %(t)s "%(r)s" %(s)s %(b)s %(D)s'
# Incluye %(D)s = tiempo de respuesta en microsegundos
```

**Características**:
- ✅ Workers basado en CPU (escalable)
- ✅ Puerto dinámico (Cloud Run compatible)
- ✅ Logging a stdout (Cloud Logging compatible)
- ✅ Timeouts razonables (120s)
- ✅ Reciclaje de workers para evitar memory leaks

---

## 3. CONFIGURACIÓN DE FLASK

### 3.1 Archivo config.py

**Ubicación**: `E:\PROYECTOS WEB\control_patrimonial_web\config.py`

**Jerarquía de configuraciones**:

```python
class Config:                    # Base
    SECRET_KEY = ...
    SQLALCHEMY_ECHO = False
    # Headers de seguridad
    # Connection pooling

class DevelopmentConfig(Config): # Desarrollo
    DEBUG = True
    SQLALCHEMY_DATABASE_URI = 'sqlite:///data/inventario_patrimonial.db'

class ProductionConfig(Config):  # Producción
    DEBUG = False
    DATABASE_URL = os.environ.get('DATABASE_URL', 'sqlite://...')
    # Connection pooling optimizado
    # Session cookie secure = False ❌ (debería ser True)

class TestingConfig(Config):     # Testing
    TESTING = True
    CSRF protection = False
    DATABASE = ':memory:'
```

**Validación de seguridad en ProductionConfig**:
```python
if not SECRET_KEY or SECRET_KEY == 'dev-key':
    raise RuntimeError("SECRET_KEY must be set to a secure value in production")
```

**Connection Pooling (PostgreSQL)**:
```python
SQLALCHEMY_ENGINE_OPTIONS = {
    'pool_size': 10,           # 10 conexiones por worker
    'pool_recycle': 3600,      # Reciclar cada 1 hora
    'pool_pre_ping': True,     # Verificar conexión antes de usar
    'max_overflow': 20,        # Permitir 20 conexiones extra
}
```

**Explicación de conexiones**:
- En producción con 2 workers Gunicorn:
  - Pool total: 2 workers × 10 conexiones = 20 conexiones
  - Más 2 × 20 overflow = máximo 60 conexiones simultáneas

---

### 3.2 WSGI Entry Point

**Ubicación**: `E:\PROYECTOS WEB\control_patrimonial_web\wsgi.py`

```python
from app import create_app
from config import ProductionConfig

app = create_app(ProductionConfig)
```

**Características**:
- ✅ Solo importa, no ejecuta `app.run()`
- ✅ Gunicorn ejecuta esto con: `gunicorn wsgi:app`
- ✅ Carga variables de `.env` en `app/__init__.py`

### 3.3 Entry Point de Desarrollo

**Ubicación**: `E:\PROYECTOS WEB\control_patrimonial_web\run.py`

```python
from app import create_app, db
from config import DevelopmentConfig

if __name__ == '__main__':
    app = create_app(DevelopmentConfig)
    # ... setup database ...
    app.run(debug=True, port=5000)
```

---

## 4. DEPENDENCIAS Y REQUIREMENTS

### 4.1 Análisis de Requirements

| Archivo | Paquetes | Propósito | Estado |
|---------|----------|----------|--------|
| `requirements.txt` | 138 | Desarrollo con todo | ❌ Bloated |
| `requirements.prod.txt` | 22 | **PRODUCCIÓN** | ✅ Optimizado |
| `requirements_production.txt` | 12 | Ultra-minimal | ⚠️ Puede faltar gunicorn |
| `requirements.dev.txt` | ~10 | Testing | ✅ Separado |

### 4.2 requirements.prod.txt (PRODUCCIÓN)

**Paquetes core**:
```
Flask==3.1.2
flask-login==0.6.3
flask-wtf==1.2.2
flask-cors==6.0.1
flask-migrate==4.0.4
Flask-SQLAlchemy==3.0.5
WTForms==3.2.1
```

**Base de datos**:
```
SQLAlchemy==2.0.44
psycopg2-binary==2.9.11    # PostgreSQL driver
alembic==1.17.2            # Migraciones
```

**Utilidades**:
```
python-dotenv==1.2.1
cryptography==46.0.3
bcrypt==4.0.1
python-dateutil==2.9.0.post0
pytz==2025.2
```

**Importación/Exportación**:
```
pandas==2.3.3
openpyxl==3.1.5      # Excel
reportlab==4.4.4     # PDF
```

**⚠️ FALTANTE CRÍTICO**:
```
gunicorn==21.2.0  # ❌ NO ESTÁ EN EL ARCHIVO ACTUAL
```

### 4.3 Paquetes Eliminados en Producción (85% reducción)

**Machine Learning** (no usado):
- torch, torchaudio, tifffile

**Audio Processing** (no usado):
- demucs, librosa, audioread, soundfile

**GUI Desktop** (no usado):
- pygame, PySimpleGUI

**Frameworks alternos** (no usado):
- openai, fastapi, uvicorn

**Solo desarrollo**:
- matplotlib, pyinstaller, jupyter

**Impacto**:
- Desarrollo: 138 paquetes, ~500MB
- Producción: 22 paquetes, ~80MB (85% reducción)
- Imagen Docker final: ~190MB

---

## 5. GOOGLE CLOUD RUN (Principal)

### 5.1 Configuración

**Proyecto GCP**:
```bash
PROJECT_ID="steam-outlet-480502-d7"
REGION="us-central1"
SERVICE_NAME="control-patrimo-web"
URL="https://control-patrimo-web-195522615542.us-central1.run.app"
```

**Especificaciones**:
- **CPU**: 1 vCPU (por defecto)
- **Memoria**: 512 MB
- **Timeout**: 60 segundos máximo (aunque Gunicorn es 120s)
- **Escalado**: 0 a N instancias automático
- **Concurrencia**: 80 requests por instancia (por defecto)

### 5.2 Script de Despliegue

**Ubicación**: `E:\PROYECTOS WEB\control_patrimonial_web\deploy_gcp.sh`

**Pasos automatizados**:
```bash
# 1. Validar variables
PROJECT_ID="steam-outlet-480502-d7"
REGION="us-central1"
SERVICE_NAME="control-patrimo-web"

# 2. Build con Cloud Build
gcloud builds submit --tag gcr.io/$PROJECT_ID/$SERVICE_NAME

# 3. Deploy a Cloud Run
gcloud run deploy $SERVICE_NAME \
  --image gcr.io/$PROJECT_ID/$SERVICE_NAME \
  --platform managed \
  --region us-central1 \
  --allow-unauthenticated \
  --memory 512Mi \
  --set-env-vars "FLASK_ENV=production"

# 4. Obtener URL
gcloud run services describe $SERVICE_NAME \
  --region us-central1 --format='value(status.url)'
```

**Características**:
- ✅ Build completamente automatizado
- ✅ Deploy sin necesidad de SSH
- ✅ HTTPS automático (certificados gestionados por Google)
- ✅ Escalado automático

**Tiempo estimado**: 3-5 minutos

### 5.3 Variables de Entorno en Cloud Run

**Actualmente comentadas en script**:
```bash
--set-env-vars "FLASK_APP=wsgi.py,FLASK_ENV=production"
--set-secrets "DATABASE_URL=nombre-secret-db-url:latest"
--add-cloudsql-instances $PROJECT_ID:$REGION:nombre-instancia-sql
```

**Estado**: Deploy simplificado sin BD externa configurada (para pruebas)

### 5.4 Ventajas vs Servidor Tradicional

| Aspecto | Cloud Run | Servidor Ubuntu |
|--------|-----------|-----------------|
| HTTPS | ✅ Automático | ❌ Manual (Let's Encrypt) |
| Escalado | ✅ 0 a N automático | ❌ Manual (agregar servidores) |
| Mantenimiento | ✅ Cero | ❌ Actualizaciones OS, parches |
| Costo | Variable (por uso) | Fijo (instancia siempre activa) |
| Disponibilidad | ✅ 99.95% | Depende del hosting |
| Cold starts | ⚠️ ~2 segundos | N/A |

---

## 6. SERVIDOR UBUNTU (Actualmente operativo)

### 6.1 Configuración Actual

**Información del servidor**:
```
IP: 10.28.106.250
OS: Ubuntu 24.04 LTS
Usuario: patrimonio (no-root)
```

**Componentes desplegados**:

| Componente | Estado | Puerto | Detalles |
|-----------|--------|--------|----------|
| Gunicorn | ✅ Running | 8000 (localhost) | 2 workers |
| Nginx | ✅ Running | 80 (HTTP) | Reverse proxy |
| PostgreSQL | ✅ Running | 5432 (localhost) | control_patrimonial DB |
| Firewall | ✅ Configurado | 80, 443 (abiertos) | UFW |

**Última actualización**: 28 de noviembre 2025 (Operacional)

### 6.2 Estructura de Directorios

```
~patrimonio/
├── control_patrimonial/           # Código de aplicación
│   ├── app/
│   ├── migrations/
│   ├── wsgi.py
│   ├── config.py
│   ├── requirements.prod.txt
│   └── .env.production            # Variables secretas
│
├── gunicorn.log                    # Log del servidor
│
└── # Administrado por systemd:
    /etc/systemd/system/gunicorn.service  # Auto-start/restart
    /etc/nginx/sites-available/control-patrimonial
```

### 6.3 Flujo de Solicitud en Servidor Ubuntu

```
Usuario (navegador)
        ↓ HTTP (puerto 80)
Nginx (reverse proxy)
        ├─ Recibe request
        ├─ Gzip compression
        ├─ Caché de estáticos (30 días)
        └─ Forward a Gunicorn
            ↓ HTTP (puerto 8000, localhost)
        Gunicorn (2 workers)
            ├─ Worker 1: maneja requests
            ├─ Worker 2: maneja requests
            └─ Comparte pool de conexiones PostgreSQL
                ↓ TCP (puerto 5432, localhost)
            PostgreSQL
                ├─ control_patrimonial DB
                ├─ Tablas: usuarios, bienes, historial, etc.
                └─ Índices optimizados
```

### 6.4 Configuración de Nginx

**Documentado en**: `DEPLOYMENT_UBUNTU_PRODUCCION.md`

**Características documentadas**:
- ✅ Reverse proxy a Gunicorn (127.0.0.1:5000 o 8000)
- ✅ Gzip compression
- ✅ Cache de archivos estáticos (30 días)
- ✅ Headers de seguridad (HSTS, X-Frame-Options)
- ✅ Client max body size: 16MB
- ✅ Timeout: 120 segundos
- ❌ HTTPS: NO configurado (pendiente)

---

## 7. BASE DE DATOS

### 7.1 Configuración por Entorno

**Desarrollo**:
```
SQLite: data/inventario_patrimonial.db
Ventajas: Cero configuración, perfecta para desarrollo
```

**Producción (Servidor Ubuntu)**:
```
PostgreSQL 15
Host: localhost
Port: 5432
Database: control_patrimonial
Usuario: creado en /scripts/setup_db.sh
```

**Producción (Cloud Run - Pendiente)**:
```
Google Cloud SQL (PostgreSQL)
Conexión: Cloud Proxy o Unix socket
Backup: Automático diario por Google
```

### 7.2 Connection Pooling

**Configuración en config.py**:
```python
SQLALCHEMY_ENGINE_OPTIONS = {
    'pool_size': 10,           # 10 conexiones mantenidas
    'pool_recycle': 3600,      # Reciclar cada 1 hora
    'pool_pre_ping': True,     # Health check antes de usar
    'max_overflow': 20,        # Hasta 20 extra en picos
}
```

**Cálculo de conexiones**:
```
Con 2 workers Gunicorn:
Total = 2 × (10 + 20) = 60 conexiones máximas

Con 5 workers:
Total = 5 × (10 + 20) = 150 conexiones máximas
```

### 7.3 Migraciones

**Sistema**: Flask-Migrate (wrapper de Alembic)

**Comandos**:
```bash
# Crear migración
flask db migrate -m "Agregar campo verificado"

# Aplicar migración
flask db upgrade

# Revertir
flask db downgrade
```

**Versiones en**: `migrations/versions/`

**En producción**:
- Se ejecutan automáticamente (documentado)
- O manualmente antes de actualizar código

---

## 8. VARIABLES DE ENTORNO

### 8.1 Archivos de Configuración

**Jerarquía**:
1. `.env` (desarrollo local, NO committear)
2. `.env.example` (plantilla pública)
3. `.env.production` (producción real, NO committear)
4. `.env.production.example` (plantilla pública)

### 8.2 Variables Críticas

```bash
# Entorno
FLASK_ENV=production           # o development
DEBUG=False                    # Siempre False en prod
SECRET_KEY=<generado>          # 32 caracteres hex mínimo

# Base de datos
DATABASE_URL=postgresql://...  # Opcional, fallback a SQLite

# Seguridad
SESSION_COOKIE_SECURE=False    # ❌ Debería ser True con HTTPS
REMEMBER_COOKIE_SECURE=False   # ❌ Debería ser True con HTTPS

# Logging
LOG_LEVEL=INFO                 # Verbose, INFO, WARNING

# Servidor
GUNICORN_WORKERS=5             # (2 × CPU) + 1
GUNICORN_LOG_LEVEL=info
GUNICORN_BIND=0.0.0.0:8000
```

### 8.3 Gestión de Secretos

**Actual**:
- Archivo `.env.production` en servidor
- `chmod 600 .env` recomendado (en documentación)

**Mejor práctica**:
- Google Secret Manager (Cloud Run)
- Variables de entorno del sistema (Ubuntu)
- Vault (Hashicorp) para infraestructura compleja

---

## 9. LOGGING

### 9.1 Configuración de Logging

**Aplicación Flask**:
```python
# config.py
LOG_FILE = os.path.join(BASE_DIR, 'logs', 'app.log')
LOG_LEVEL = os.environ.get('LOG_LEVEL', 'INFO')
```

**Gunicorn**:
```python
# gunicorn_config.py
accesslog = '-'    # stdout (Cloud Logging)
errorlog = '-'     # stderr
loglevel = 'info'
```

**Nginx** (Ubuntu):
```
/var/log/nginx/access.log
/var/log/nginx/error.log
```

### 9.2 Rotación de Logs

**Estado actual**: ❌ NO configurada

**Recomendado**:
```bash
# /etc/logrotate.d/control-patrimonial
/home/patrimonio/gunicorn.log {
    daily
    rotate 30
    compress
    delaycompress
    notifempty
    create 0640 patrimonio patrimonio
    sharedscripts
    postrotate
        systemctl reload gunicorn
    endscript
}

/var/log/nginx/*.log {
    daily
    rotate 14
    compress
    delaycompress
    notifempty
    create 0640 www-data adm
    sharedscripts
    postrotate
        systemctl reload nginx
    endscript
}
```

---

## 10. BACKUPS

### 10.1 Estado Actual

❌ **No hay sistema de backup automatizado**

Documentación menciona: "Hacer respaldo regular"

### 10.2 Recomendación para PostgreSQL

**Script de backup diario**:
```bash
#!/bin/bash
# /home/patrimonio/backup_db.sh

DATE=$(date +%Y%m%d_%H%M%S)
BACKUP_DIR="/home/patrimonio/backups"
mkdir -p $BACKUP_DIR

pg_dump -U control_patrimonial control_patrimonial \
  | gzip > $BACKUP_DIR/control_patrimonial_$DATE.sql.gz

# Mantener últimos 30 días
find $BACKUP_DIR -name "*.gz" -mtime +30 -delete

# Opcional: Subir a Google Cloud Storage
# gsutil cp $BACKUP_DIR/control_patrimonial_$DATE.sql.gz \
#   gs://backup-bucket/control-patrimonial/
```

**Cron job**:
```bash
# /etc/cron.d/control-patrimonial-backup
0 2 * * * patrimonio /home/patrimonio/backup_db.sh >> /var/log/control-patrimonial-backup.log 2>&1
```

---

## 11. MONITOREO

### 11.1 Estado Actual

❌ **Sin monitoreo integrado**

**Lo que falta**:
- Error tracking (Sentry, Rollbar)
- Métricas (Prometheus, Google Cloud Monitoring)
- Alertas de CPU, memoria, disco lleno
- Health checks

### 11.2 Health Check Endpoint

**Existe**: `/api/health` en `app/api/routes.py`

**Debería verificar**:
- ✅ Que la app está activa
- ❌ Conexión a base de datos
- ❌ Espacio en disco
- ❌ Versión de la aplicación

---

## 12. AUTOMATIZACIÓN Y CI/CD

### 12.1 Estado Actual

❌ **Sin CI/CD automatizado**

**Deploy actual**: Manual con `deploy_gcp.sh` o `deploy_gcp.ps1`

### 12.2 Mejora Recomendada: GitHub Actions

```yaml
# .github/workflows/deploy.yml
name: Deploy to Cloud Run

on:
  push:
    branches: [main, production]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3

      - name: Authenticate to Google Cloud
        uses: google-github-actions/auth@v1

      - name: Build and Deploy
        run: |
          gcloud builds submit --tag gcr.io/${{ secrets.GCP_PROJECT }}/...
          gcloud run deploy control-patrimo-web ...
```

---

## 13. MATRIZ DE COMPARACIÓN

| Aspecto | Cloud Run | Ubuntu Server |
|--------|-----------|--------------|
| **Implementación** | Casi lista | ✅ Operacional |
| **HTTPS** | ✅ Automático | ❌ Manual |
| **Escalado** | ✅ Automático | ❌ Manual |
| **Costo** | Pay-as-you-go | Fijo |
| **Ops burden** | ✅ Bajo | ❌ Alto |
| **Database** | Necesita Cloud SQL | ✅ Local PostgreSQL |
| **CI/CD** | Recomendado | Manual |
| **Monitoreo** | Google Cloud Monitoring | Manual |
| **Backups** | Google Cloud Backup | Necesita setup |

---

## 14. PROBLEMAS IDENTIFICADOS

### 🔴 CRÍTICOS

1. **gunicorn NO en requirements.prod.txt**
   - Bloqueador para Cloud Run
   - Acción: Agregar `gunicorn==21.2.0`

2. **HTTPS no configurado en Ubuntu**
   - Cookies en texto plano
   - Acción: Configurar Let's Encrypt + Nginx

3. **Sin backups automatizados**
   - Riesgo de pérdida de datos
   - Acción: Crear script de backup cron

### 🟠 ALTOS

1. **Sin monitoreo/alertas**
   - Difícil detectar problemas
   - Acción: Implementar health checks

2. **Sin rotación de logs**
   - Disco puede llenarse
   - Acción: Configurar logrotate

3. **Sin CI/CD automatizado**
   - Deploy manual propenso a errores
   - Acción: Configurar GitHub Actions

### 🟡 MEDIOS

1. **Database URL no configurada en Cloud Run**
   - Cloud Run no tiene acceso a BD
   - Acción: Configurar Cloud SQL

2. **Documentación de deploy incompleta**
   - Pasos no documentados claramente
   - Acción: Crear guía paso a paso

---

## 15. RECOMENDACIONES

### Fase 1: Inmediato (Esta semana)
- [ ] Agregar `gunicorn==21.2.0` a requirements.prod.txt
- [ ] Configurar HTTPS en servidor Ubuntu con Let's Encrypt
- [ ] Crear script de backup PostgreSQL con rotación

### Fase 2: Corto plazo (1-2 semanas)
- [ ] Implementar health check mejorado
- [ ] Configurar logrotate
- [ ] Documentar backup y restore procedure

### Fase 3: Mediano plazo (1-2 meses)
- [ ] Configurar Cloud Run con Cloud SQL
- [ ] Implementar CI/CD con GitHub Actions
- [ ] Integrar monitoreo (Google Cloud Monitoring)

### Fase 4: Largo plazo (2-3 meses)
- [ ] Migrar a Cloud SQL (eliminar DB local)
- [ ] Implementar blue-green deployment
- [ ] Configurar WAF (Web Application Firewall)

---

## 16. CONCLUSIÓN

**Estado de despliegue**: OPERACIONAL pero INCONSISTENTE

**Fortalezas**:
- ✅ Dockerfile optimizado y seguro
- ✅ Gunicorn bien configurado
- ✅ Dos opciones de deploy (Cloud Run + Ubuntu)
- ✅ Documentación completa

**Debilidades**:
- ❌ HTTPS no configurado
- ❌ gunicorn falta en requirements.prod.txt
- ❌ Sin backups automatizados
- ❌ Sin monitoreo integrado
- ❌ Deploy manual sin CI/CD

**Veredicto**: Sistema es **OPERACIONAL** pero necesita **HARDENING** para producción robusta.

---

**Fin del análisis de despliegue**
