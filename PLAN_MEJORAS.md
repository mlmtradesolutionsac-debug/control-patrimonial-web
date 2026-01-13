# Plan de Mejoras Priorizado - Control Patrimonial Web

**Fecha de creación**: 2025-12-10
**Basado en**: Análisis de Arquitectura, Seguridad y Despliegue
**Versión**: 1.0

---

## RESUMEN EJECUTIVO

El sistema **Control Patrimonial Web** es operacional pero requiere **correcciones prioritarias** antes de mantener como servicio crítico de producción.

### Problemas Críticos Identificados

| # | Problema | Severidad | Impacto | Plazo |
|---|----------|-----------|--------|-------|
| 1 | HTTPS no configurado | 🔴 CRÍTICA | Cookies en texto plano | Inmediato |
| 2 | gunicorn falta en prod | 🔴 CRÍTICA | Cloud Run fallará | Inmediato |
| 3 | Sin rate limiting | 🔴 CRÍTICA | Brute force posible | < 1 semana |
| 4 | Validación deshabilitada | 🔴 CRÍTICA | XSS stored posible | < 1 semana |
| 5 | CSP inseguro | 🔴 CRÍTICA | unsafe-inline anula protección | < 1 semana |
| 6 | Sin bloqueo de cuentas | 🟠 ALTA | Fuerza bruta sin límite | < 1 semana |
| 7 | Sin backups automáticos | 🟠 ALTA | Riesgo pérdida de datos | < 1 semana |
| 8 | Sin rotación de logs | 🟡 MEDIA | Disco puede llenarse | < 2 semanas |
| 9 | Sin monitoreo | 🟡 MEDIA | Difícil detectar problemas | < 2 semanas |
| 10 | Sin CI/CD | 🟡 MEDIA | Deploy manual propenso a errores | < 2 semanas |

---

## MEJORAS FASE 1: BLOQUEADORES CRÍTICOS (Inmediato)

### M1.1: Configurar HTTPS con Let's Encrypt

**Severidad**: 🔴 CRÍTICA - Bloqueador de producción

**Descripción**:
El sistema actualmente corre sobre HTTP en servidor Ubuntu (10.28.106.250).
Las cookies de sesión se transmiten en **texto plano**, vulnerables a intercepción.

**Archivos afectados**:
- `/etc/nginx/sites-available/control-patrimonial` - Configurar SSL
- `config.py` - Cambiar SESSION_COOKIE_SECURE = True
- `.env.production` - Documentar configuración SSL

**Pasos**:
1. ✅ Instalar Certbot en servidor Ubuntu
2. ✅ Configurar Nginx con certificado SSL
3. ✅ Configurar renovación automática (cron)
4. ✅ Redirigir HTTP → HTTPS
5. ✅ Actualizar SESSION_COOKIE_SECURE y REMEMBER_COOKIE_SECURE a True
6. ✅ Habilitar HSTS header (ya existe)
7. ✅ Verificar certificado con tests

**Documentación**: Ver `GUIA_CONFIGURACION_HTTPS.md` (Fase 5)

**Esfuerzo**: 2-3 horas
**Plazo**: Inmediato (antes de 7 días)

---

### M1.2: Agregar gunicorn a requirements.prod.txt

**Severidad**: 🔴 CRÍTICA - Bloqueador para Cloud Run

**Descripción**:
El archivo `requirements.prod.txt` está incompleto.
No incluye `gunicorn`, que es necesario para que Cloud Run funcione.

**Archivos afectados**:
- `requirements.prod.txt` - Agregar gunicorn

**Cambio requerido**:
```diff
+ gunicorn==23.0.0
```

**Verificación**:
```bash
pip install -r requirements.prod.txt
python -c "import gunicorn; print(gunicorn.__version__)"
```

**Esfuerzo**: 5 minutos
**Plazo**: Inmediato

---

### M1.3: Implementar Rate Limiting

**Severidad**: 🔴 CRÍTICA - Vulnerable a brute force

**Descripción**:
Sistema sin protección contra intentos infinitos de login.
Atacante puede probar 10,000 combinaciones sin límite.

**Solución**: Instalar Flask-Limiter

**Archivos a modificar**:
- `requirements.prod.txt` - Agregar `flask-limiter==3.5.0`
- `app/__init__.py` - Inicializar Limiter
- `app/auth/routes.py` - Aplicar límite a /auth/login
- `app/api/routes.py` - Aplicar límites generales a API
- `tests/test_security.py` - Agregar tests

**Implementación**:

```python
# app/__init__.py
from flask_limiter import Limiter
from flask_limiter.util import get_remote_address

limiter = Limiter(
    app=app,
    key_func=get_remote_address,
    default_limits=["200 per day", "50 per hour"],
    storage_uri="memory://"  # O Redis para múltiples workers
)

# app/auth/routes.py
@auth_bp.route('/login', methods=['POST'])
@limiter.limit("5 per minute")  # Max 5 intentos por minuto
def login():
    # ... login logic ...
```

**Límites recomendados**:
- Login: 5 intentos por minuto
- API general: 100 requests por minuto
- API de datos: 1000 requests por hora

**Esfuerzo**: 3-4 horas
**Plazo**: < 1 semana

---

### M1.4: Habilitar Validación de Datos

**Severidad**: 🔴 CRÍTICA - Permite XSS stored

**Descripción**:
Función `validate_bien_data()` retorna lista vacía sin validar nada.
Comentario indica que "Permite que operadores guarden cualquier dato".

Esto permite:
- XSS stored (guardar `<script>` en base de datos)
- Corrupción de datos
- Inyección de SQL (si se usa raw SQL incorrectamente)

**Archivos a modificar**:
- `app/utils.py` - Habilitar validación completa
- `app/models_sqlalchemy.py` - Agregar validaciones en modelo
- `requirements.prod.txt` - Agregar `bleach==6.1.0`
- `tests/test_validation.py` - Crear tests de validación

**Validaciones requeridas**:

```python
def validate_bien_data(data: dict) -> list:
    """Valida datos de bien antes de guardar"""
    errors = []

    # Campos obligatorios
    required = ['codigo_patrimonial', 'denominacion', 'sede_id']
    for field in required:
        if not data.get(field):
            errors.append(f'{field} es obligatorio')

    # Longitud máxima
    max_lengths = {
        'codigo_patrimonial': 20,
        'denominacion': 100,
        'descripcion': 500,
        'marca': 50,
        'modelo': 50,
        'serie': 50,
    }
    for field, max_len in max_lengths.items():
        if len(data.get(field, '')) > max_len:
            errors.append(f'{field} no puede exceder {max_len} caracteres')

    # Sanitización: remover HTML tags
    for field in ['denominacion', 'descripcion', 'observaciones']:
        if data.get(field):
            data[field] = bleach.clean(data[field], tags=[], strip=True)

    # Validación de estado
    if data.get('estado') not in ('b', 'r', 'm'):
        errors.append("estado debe ser 'b' (Bueno), 'r' (Regular) o 'm' (Malo)")

    # Validación de sede y unidad (existen en BD)
    # ...

    return errors
```

**Esfuerzo**: 4-5 horas
**Plazo**: < 1 semana

---

### M1.5: Mejorar Content Security Policy

**Severidad**: 🔴 CRÍTICA - CSP muy permisivo

**Descripción**:
CSP actual permite `'unsafe-inline'` y `'unsafe-eval'`, anulando protección XSS.

**Solución**: Mover scripts inline a archivos externos y usar nonce CSP.

**Cambios requeridos**:

1. **Eliminar scripts inline de templates**:
   ```html
   <!-- ANTES: ❌ Script inline -->
   <script>
       var data = {{ bien | safe }};
       // ...
   </script>

   <!-- DESPUÉS: ✅ Archivo externo con nonce -->
   <script nonce="{{ csp_nonce }}" src="/static/js/bien-detail.js"></script>
   ```

2. **Actualizar CSP header**:
   ```python
   # app/__init__.py ANTES:
   Content-Security-Policy: default-src 'self'; script-src 'self' 'unsafe-inline' 'unsafe-eval' ...

   # DESPUÉS:
   Content-Security-Policy: default-src 'self'; script-src 'self' cdn.jsdelivr.net 'nonce-{{ random_nonce }}' ...
   ```

3. **Implementar nonce dinámico**:
   ```python
   @app.before_request
   def set_csp_nonce():
       g.csp_nonce = secrets.token_urlsafe(16)

   @app.after_request
   def add_csp_header(response):
       response.headers['Content-Security-Policy'] = f"default-src 'self'; script-src 'self' 'nonce-{g.csp_nonce}' cdn.jsdelivr.net"
       return response
   ```

**Archivos a modificar**:
- Todos los templates (buscar `<script>` inline)
- `app/__init__.py` - Actualizar CSP
- Crear archivos `.js` externos

**Esfuerzo**: 6-8 horas
**Plazo**: < 1 semana

---

## MEJORAS FASE 2: VULNERABILIDADES ALTAS (< 1 semana)

### M2.1: Implementar Bloqueo de Cuentas

**Severidad**: 🟠 ALTA - Facilita brute force

**Descripción**:
Sin bloqueo de intentos fallidos, atacante puede intentar indefinidas veces.

**Solución**: Bloquear cuenta tras 5 intentos fallidos durante 15 minutos.

**Cambios requeridos**:

1. **Modelo**: Agregar campos a Usuario
   ```python
   class Usuario(db.Model):
       # ... campos existentes ...
       failed_login_attempts = db.Column(db.Integer, default=0)
       locked_until = db.Column(db.DateTime, nullable=True)
   ```

2. **Lógica de login**:
   ```python
   @app.route('/auth/login', methods=['POST'])
   def login():
       user = Usuario.query.filter_by(usuario=username).first()

       # Verificar si cuenta está bloqueada
       if user and user.locked_until and user.locked_until > datetime.now():
           flash(f'Cuenta bloqueada. Intente de nuevo en {user.locked_until}')
           return redirect(url_for('auth.login'))

       # Validar contraseña
       if user and user.verify_password(password):
           user.failed_login_attempts = 0  # Reset
           user.locked_until = None
           db.session.commit()
           login_user(user)
           return redirect(url_for('main.dashboard'))

       # Login fallido: incrementar contador
       if user:
           user.failed_login_attempts += 1
           if user.failed_login_attempts >= 5:
               user.locked_until = datetime.now() + timedelta(minutes=15)
               flash('Cuenta bloqueada por 15 minutos tras múltiples intentos fallidos')
           db.session.commit()

       flash('Usuario o contraseña incorrectos')
       return redirect(url_for('auth.login'))
   ```

3. **Migración de BD**:
   ```bash
   flask db migrate -m "Agregar campos de bloqueo de cuenta"
   flask db upgrade
   ```

**Archivos a modificar**:
- `app/models_sqlalchemy.py` - Agregar campos
- `app/auth/routes.py` - Lógica de bloqueo
- `migrations/versions/` - Nueva migración

**Esfuerzo**: 3-4 horas
**Plazo**: < 1 semana

---

### M2.2: Regenerar Session ID tras Login

**Severidad**: 🟠 ALTA - Session fixation posible

**Descripción**:
Sin regeneración de session ID, atacante puede fijar sesión antes del login.

**Solución**: Regenerar session ID después de login exitoso.

**Cambios**:
```python
# app/auth/routes.py línea 45
if user and user.verify_password(password):
    # ✅ ANTES DE login_user: regenerar sesión
    session.clear()  # Limpia sesión antigua

    login_user(user, remember=remember)

    # ✅ DESPUÉS DE login_user: crear nueva sesión
    session.permanent = True
    app.permanent_session_lifetime = timedelta(hours=8)

    return redirect(url_for('main.dashboard'))
```

**Esfuerzo**: 1-2 horas
**Plazo**: < 1 semana

---

### M2.3: Crear Backups Automatizados

**Severidad**: 🟠 ALTA - Riesgo pérdida de datos

**Descripción**:
Sin backups automatizados, cualquier fallo causa pérdida de datos irrecuperable.

**Solución**: Script de backup diario con rotación.

**Archivo a crear**: `/home/patrimonio/backup_db.sh`

```bash
#!/bin/bash
set -e

# Configuración
DB_USER="control_patrimonial"
DB_NAME="control_patrimonial"
BACKUP_DIR="/home/patrimonio/backups"
RETENTION_DAYS=30
DATE=$(date +%Y%m%d_%H%M%S)

# Crear directorio
mkdir -p $BACKUP_DIR

# Hacer backup
pg_dump -U $DB_USER $DB_NAME | gzip > $BACKUP_DIR/control_patrimonial_$DATE.sql.gz

# Validar que el backup no esté vacío
if [ ! -s "$BACKUP_DIR/control_patrimonial_$DATE.sql.gz" ]; then
    echo "ERROR: Backup vacío" >&2
    exit 1
fi

# Eliminar backups antiguos
find $BACKUP_DIR -name "*.sql.gz" -mtime +$RETENTION_DAYS -delete

# Log
echo "Backup completado: control_patrimonial_$DATE.sql.gz" >> /var/log/control-patrimonial-backup.log

# Opcional: Subir a Google Cloud Storage
# gsutil cp $BACKUP_DIR/control_patrimonial_$DATE.sql.gz \
#   gs://backup-bucket/control-patrimonial/

# Opcional: Verificar disponibilidad de almacenamiento
SPACE=$(df $BACKUP_DIR | awk 'NR==2 {print $4}')
if [ $SPACE -lt 10485760 ]; then  # < 10GB
    echo "ADVERTENCIA: Espacio bajo en disco (<10GB)" >&2
fi
```

**Cron job**: Agregar a `/etc/cron.d/control-patrimonial-backup`
```bash
0 2 * * * patrimonio /home/patrimonio/backup_db.sh >> /var/log/control-patrimonial-backup.log 2>&1
```

**Esfuerzo**: 2 horas
**Plazo**: < 1 semana

---

### M2.4: Configurar Rotación de Logs

**Severidad**: 🟠 ALTA - Disco puede llenarse

**Descripción**:
Sin logrotate, archivos de log crecen indefinidamente.

**Solución**: Configurar logrotate.

**Archivo a crear**: `/etc/logrotate.d/control-patrimonial`

```
/home/patrimonio/gunicorn.log {
    daily
    rotate 30
    compress
    delaycompress
    notifempty
    create 0640 patrimonio patrimonio
    sharedscripts
    postrotate
        systemctl reload gunicorn >/dev/null 2>&1 || true
    endscript
}

/var/log/nginx/access.log
/var/log/nginx/error.log {
    daily
    rotate 14
    compress
    delaycompress
    notifempty
    create 0640 www-data adm
    sharedscripts
    postrotate
        systemctl reload nginx >/dev/null 2>&1 || true
    endscript
}

/var/log/control-patrimonial-backup.log {
    daily
    rotate 30
    compress
    delaycompress
    notifempty
    create 0640 root root
}
```

**Esfuerzo**: 1 hora
**Plazo**: < 1 semana

---

## MEJORAS FASE 3: VULNERABILIDADES MEDIAS (< 2 semanas)

### M3.1: Implementar Política de Contraseñas Fuertes

**Severidad**: 🟡 MEDIA - Permite contraseñas débiles

**Descripción**:
Mínimo de 6 caracteres es insuficiente.
Permite contraseñas como "abc123" o "111111".

**Solución**: Requerir complejidad mínima.

```python
# app/utils.py - Nueva función
def validate_password_strength(password: str) -> list:
    """Valida fortaleza de contraseña"""
    errors = []

    if len(password) < 8:
        errors.append("Mínimo 8 caracteres")

    if not any(c.isupper() for c in password):
        errors.append("Debe contener al menos una mayúscula")

    if not any(c.islower() for c in password):
        errors.append("Debe contener al menos una minúscula")

    if not any(c.isdigit() for c in password):
        errors.append("Debe contener al menos un número")

    # Validar contra lista de contraseñas comunes
    COMMON_PASSWORDS = [
        'password', 'admin123', 'qwerty', '123456',
        'letmein', 'welcome', 'monkey', 'dragon'
    ]
    if password.lower() in COMMON_PASSWORDS:
        errors.append("Contraseña demasiado común")

    return errors

# app/auth/routes.py
@app.route('/auth/cambiar-contrasena', methods=['POST'])
@login_required
def cambiar_contrasena():
    new_password = request.form.get('new_password')

    # Validar fortaleza
    errors = validate_password_strength(new_password)
    if errors:
        for error in errors:
            flash(f"Contraseña débil: {error}", 'danger')
        return redirect(url_for('main.mi_cuenta'))

    # Cambiar contraseña
    current_user.password = Usuario.hash_password(new_password)
    db.session.commit()
    flash("Contraseña actualizada exitosamente")
    return redirect(url_for('main.mi_cuenta'))
```

**Archivos a modificar**:
- `app/utils.py` - Agregar validación
- `app/auth/routes.py` - Usar validación
- `tests/test_auth.py` - Agregar tests

**Esfuerzo**: 2-3 horas
**Plazo**: < 2 semanas

---

### M3.2: Expiración de Tokens CSRF

**Severidad**: 🟡 MEDIA - Permite reutilización

**Descripción**:
Tokens CSRF válidos indefinidamente aunque sesión expire.

**Solución**: Establecer límite de 1 hora.

**Cambio simple**:
```python
# config.py - Cambio de una línea
WTF_CSRF_TIME_LIMIT = 3600  # 1 hora (antes: None)
```

**Esfuerzo**: 30 minutos
**Plazo**: < 2 semanas

---

### M3.3: Restringir CORS

**Severidad**: 🟡 MEDIA - Permite orígenes no autorizados

**Descripción**:
API abierta a cualquier sitio web (`origins: "*"`).

**Solución**: Restringir a dominios específicos.

```python
# app/__init__.py - Cambiar CORS
CORS(app, resources={
    r"/api/*": {
        "origins": [
            "https://control-patrimonial.ejemplo.com",
            "https://admin.control-patrimonial.ejemplo.com",
            "http://localhost:5000" if os.environ.get('FLASK_ENV') == 'development' else None
        ],
        "allow_headers": ["Content-Type"],
        "methods": ["GET", "POST", "PUT", "DELETE"],
        "supports_credentials": True,
        "max_age": 3600
    }
})
```

**Esfuerzo**: 1 hora
**Plazo**: < 2 semanas

---

### M3.4: Mejorar Health Check

**Severidad**: 🟡 MEDIA - Sin verificación de dependencias

**Descripción**:
Endpoint `/api/health` existe pero no verifica conexión a BD.

```python
# app/api/routes.py
@api_bp.route('/health', methods=['GET'])
def health_check():
    """Health check con verificación de dependencias"""
    health = {
        'status': 'healthy',
        'timestamp': datetime.utcnow().isoformat(),
        'version': '1.0.0',
        'checks': {}
    }

    # Verificar base de datos
    try:
        db.session.execute('SELECT 1')
        health['checks']['database'] = 'ok'
    except Exception as e:
        health['status'] = 'unhealthy'
        health['checks']['database'] = f'error: {str(e)}'

    # Verificar espacio en disco
    import shutil
    disk = shutil.disk_usage('/app')
    health['checks']['disk_free_percent'] = int((disk.free / disk.total) * 100)
    if health['checks']['disk_free_percent'] < 10:
        health['status'] = 'degraded'

    # Verificar memoria
    import psutil
    mem = psutil.virtual_memory()
    health['checks']['memory_available_percent'] = mem.available

    status_code = 200 if health['status'] == 'healthy' else 503
    return jsonify(health), status_code
```

**Esfuerzo**: 2 horas
**Plazo**: < 2 semanas

---

## MEJORAS FASE 4: HARDENING AVANZADO (< 1 mes)

### M4.1: Implementar Monitoreo

**Opciones**:

1. **Google Cloud Monitoring** (Cloud Run)
   - Integración nativa con Cloud Run
   - Alertas automáticas
   - Dashboards predefinidos

2. **Sentry** (Error tracking)
   - Captura automática de excepciones
   - Reportes detallados
   - Integración con Slack

3. **Prometheus + Grafana** (Self-hosted)
   - Control total
   - Métricas detalladas
   - Visualización personalizada

**Recomendación**: Sentry + Google Cloud Monitoring

---

### M4.2: Implementar CI/CD

**Opción**: GitHub Actions

```yaml
# .github/workflows/deploy.yml
name: Deploy to Cloud Run

on:
  push:
    branches: [main]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Run tests
        run: pip install -r requirements.dev.txt && pytest

  deploy:
    needs: test
    runs-on: ubuntu-latest
    if: success()
    steps:
      - uses: actions/checkout@v3
      - uses: google-github-actions/auth@v1
        with:
          credentials_json: ${{ secrets.GCP_SA_KEY }}
      - uses: google-github-actions/setup-gcloud@v1
      - name: Deploy to Cloud Run
        run: |
          gcloud run deploy control-patrimo-web \
            --image gcr.io/$PROJECT_ID/control-patrimo-web \
            --region us-central1 \
            --platform managed
```

---

### M4.3: Configurar Cloud SQL para Cloud Run

**Migración de BD**:
1. Crear instancia Cloud SQL (PostgreSQL)
2. Crear base de datos `control_patrimonial`
3. Migrar datos desde servidor Ubuntu
4. Configurar Cloud SQL Proxy
5. Actualizar DATABASE_URL en Cloud Run

---

### M4.4: Eliminar Código Legacy

**Acción**:
- Eliminar `app/models.py` (ya todo está en `models_sqlalchemy.py`)
- Limpiar código deprecado en `app/main/routes.py`

---

## CRONOGRAMA RECOMENDADO

### Semana 1: Bloqueadores Críticos
- [ ] M1.1: HTTPS (2-3h)
- [ ] M1.2: Agregar gunicorn (30min)
- [ ] M1.3: Rate limiting (4h)
- [ ] M1.4: Validación datos (4h)
- [ ] M1.5: Mejorar CSP (6h)
- **Subtotal**: ~16-17 horas

### Semana 2: Vulnerabilidades Altas
- [ ] M2.1: Bloqueo cuentas (3h)
- [ ] M2.2: Regeneración sesión (1h)
- [ ] M2.3: Backups (2h)
- [ ] M2.4: Logrotate (1h)
- **Subtotal**: ~7 horas

### Semana 3: Mejoras Medias
- [ ] M3.1: Política contraseñas (2h)
- [ ] M3.2: Expiración CSRF (0.5h)
- [ ] M3.3: Restringir CORS (1h)
- [ ] M3.4: Health check (2h)
- **Subtotal**: ~5.5 horas

### Mes 2-3: Hardening
- [ ] M4.1: Monitoreo (8h)
- [ ] M4.2: CI/CD (8h)
- [ ] M4.3: Cloud SQL (8h)
- [ ] M4.4: Eliminar legacy (4h)
- **Subtotal**: ~28 horas

**Total estimado**: ~56.5 horas

---

## MATRIZ DE DECISIÓN

### ¿Cuál comenzar primero?

```
Si quieres:
┌─────────────────────────────────────────┐
│ Seguridad máxima ASAP                   │
│ → Hacer Fase 1 + 2 (24h)               │
│                                         │
│ Operación robusta                       │
│ → Hacer Fase 1 + 2 + 3 (29.5h)        │
│                                         │
│ Excelencia a largo plazo                │
│ → Hacer todas las fases (56.5h)        │
└─────────────────────────────────────────┘
```

---

## IMPACTO DE MEJORAS

### Antes vs Después

| Aspecto | Antes | Después |
|---------|-------|---------|
| **HTTPS** | ❌ HTTP plano | ✅ HTTPS/TLS |
| **Ataques fuerza bruta** | ✅ Posibles | ❌ Bloqueados (rate limit + account lock) |
| **XSS stored** | ✅ Posible | ❌ Prevenido (validación + sanitización) |
| **Session hijacking** | ✅ Posible (sin regen) | ❌ Prevenido |
| **Pérdida de datos** | ✅ Sin backups | ❌ Protegido (30 días) |
| **Detectar problemas** | ❌ Manual | ✅ Monitoreo automático |
| **Deploy seguro** | ❌ Manual | ✅ CI/CD automatizado |

---

## RECOMENDACIÓN FINAL

**Prioridad**: MÁXIMA para Fase 1 y Fase 2

**Justificación**:
- Fase 1 corrige vulnerabilidades críticas
- Fase 2 previene ataques comunes
- Total: ~24 horas de trabajo
- Impacto: Sistema pasa de "operacional pero inseguro" a "robusto"

**Próximos pasos**:
1. Aprobación del plan
2. Asignar recursos
3. Crear ramas de feature en Git
4. Hacer cambios en local
5. Testing completo
6. Deploy en ventana de mantenimiento

---

**Fin del plan de mejoras**
