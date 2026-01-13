# Análisis de Seguridad - Control Patrimonial Web

**Fecha de análisis**: 2025-12-10
**Versión del documento**: 1.0
**Estado**: Completado

---

## RESUMEN EJECUTIVO

### Veredicto General
El proyecto tiene una **BASE SÓLIDA** de seguridad con implementaciones correctas de:
- Encriptación de contraseñas (bcrypt)
- Protección ORM contra SQL injection
- CSRF protection activa
- Autenticación con roles y decoradores

Sin embargo, hay **vulnerabilidades críticas** que DEBEN corregirse antes de mantener producción:
1. **HTTPS NO configurado** - Bloqueador crítico
2. **Sin rate limiting** - Vulnerable a brute force
3. **Validación de datos deshabilitada** - XSS y corrupción de datos
4. **CSP muy permisivo** - Reduce protección XSS

### Escala de Riesgo
- 🔴 **Críticas**: 4 (HTTPS, Rate Limiting, Validación, CORS)
- 🟠 **Altas**: 3 (CSP, Session ID, Tokens CSRF)
- 🟡 **Medias**: 4 (Bloqueo cuentas, Policies, Logging, Backups)
- 🟢 **Bajas**: 2 (Warnings, Monitoring)

---

## 1. AUTENTICACIÓN Y AUTORIZACIÓN

### 1.1 Implementaciones Existentes ✅

**Sistema de Autenticación (BUENO)**

| Aspecto | Implementación | Ubicación |
|--------|-------------|----------|
| Framework | Flask-Login 0.6.3 | `app/__init__.py` línea 21 |
| Usuarios admin | Tabla `usuarios` | `models_sqlalchemy.py` línea 19 |
| Usuarios operadores | Tabla `usuarios_app` | `models_sqlalchemy.py` línea 27 |
| User Loader | Soporta ambos tipos | `app/__init__.py` línea 28-47 |
| Distinción tipos | Prefijos `admin_`, `app_` | `app/__init__.py` línea 36 |

**Autorización por Roles (EXCELENTE)**

```python
# Decoradores implementados en app/utils.py

@login_required                    # Requiere autenticación
@admin_required                    # Solo administradores
@role_required('operador')         # Rol específico
```

**Verificación**:
- ✅ Login: `app/auth/routes.py` línea 8-50
- ✅ CRUD de bienes: Decoradores aplicados en 30+ rutas
- ✅ Admin endpoints: Verificación `current_user.is_admin`
- ✅ Tests de permisos: `tests/test_permissions.py`

**Gestión de Sesiones (BUENO)**

```python
PERMANENT_SESSION_LIFETIME = 8 horas          # config.py:76
REMEMBER_COOKIE_DURATION = 7 días             # config.py:70
SESSION_COOKIE_HTTPONLY = True                # config.py:78
SESSION_COOKIE_SAMESITE = Lax                 # config.py:79
REMEMBER_COOKIE_HTTPONLY = True               # config.py:72
```

**Logout**:
- ✅ Función `logout_user()` implementada correctamente
- ✅ Invalida sesión completamente
- ✅ Ubicación: `app/auth/routes.py` línea 143-149

### 1.2 Vulnerabilidades Identificadas ⚠️

#### 🔴 CRÍTICA: HTTPS NO CONFIGURADO

**Severidad**: CRÍTICA - Bloqueador de producción

**Descripción**:
- `SESSION_COOKIE_SECURE = False` en config.py:100
- `REMEMBER_COOKIE_SECURE = False` en config.py:101
- Comentario TODO indica que falta configuración

**Impacto**:
- Cookies transmitidas en **texto plano** sobre HTTP
- Vulnerable a man-in-the-middle attacks
- Sesiones pueden ser interceptadas
- Contraseñas expuestas durante tránsito

**Evidencia**:
```python
# config.py línea 100-101
SESSION_COOKIE_SECURE = False  # TODO: Enable HTTPS
REMEMBER_COOKIE_SECURE = False
```

**Acción requerida**:
- ✅ PRIORIDAD 1: Configurar SSL/TLS con Let's Encrypt
- Ver: Documentación de HTTPS (sección 5)

---

#### 🟠 ALTA: SIN RATE LIMITING

**Severidad**: ALTA - Vulnerable a ataques de fuerza bruta

**Descripción**:
- No hay implementación de Flask-Limiter
- No hay protección en endpoint `/auth/login`
- No hay límite de requests por IP

**Impacto**:
- Atacante puede intentar infinitas combinaciones de contraseña
- Ataque de diccionario sin restricción
- Posible compromiso de cuentas administrativas
- Abuso de API sin limitación

**Vulnerabilidad de Ejemplo**:
```bash
# Atacante ejecuta en loop
for i in {1..10000}; do
    curl -X POST http://servidor/auth/login \
      -d "username=admin&password=$password_$i"
done
```

**Acción requerida**:
- ✅ Implementar Flask-Limiter
- 5 intentos de login por minuto
- 100 requests/minuto por IP en API

---

#### 🟠 ALTA: SIN BLOQUEO DE CUENTAS

**Severidad**: ALTA - Facilita brute force

**Descripción**:
- No hay contador de intentos fallidos
- No hay sistema de bloqueo temporal
- Usuario puede intentar indefinidas veces

**Acción requerida**:
- Bloquear tras 5 intentos fallidos
- Bloqueo de 15 minutos
- Notificar al usuario

---

#### 🟡 MEDIA: SIN REGENERACIÓN DE SESSION ID

**Severidad**: MEDIA - Vulnerable a session fixation

**Descripción**:
- No se regenera session ID tras login exitoso
- Atacante puede fijar ID de sesión antes de login

**Ejemplo de ataque**:
```
1. Atacante intercepta víctima, fuerza sesión ID: "abc123"
2. Víctima accede a login con ID "abc123"
3. Después de login, mantiene ID "abc123"
4. Atacante ahora usa sesión autenticada del usuario
```

**Acción requerida**:
- Regenerar session ID tras login exitoso
- Ubicación: `app/auth/routes.py` tras `flask_login.login_user()`

---

#### 🟡 MEDIA: SIN POLÍTICA DE VALIDACIÓN NEXT_PAGE

**Severidad**: MEDIA BAJA - Open redirect posible

**Descripción**:
```python
# app/auth/routes.py línea 41
if next_page and not next_page.startswith('/'):
    next_page = None  # Previene open redirect
```

**Estado**: Solo valida que no empiece con '/'
- Protege contra dominios externos simples
- Pero podría mejorar con más validación

**Acción requerida**:
- Usar `werkzeug.security.safe_str_cmp`
- Validar que sea ruta válida conocida

---

### 1.3 Recomendaciones

| Acción | Prioridad | Esfuerzo | Plazo |
|--------|-----------|----------|-------|
| Configurar HTTPS | 🔴 CRÍTICA | Medio | Inmediato |
| Implementar rate limiting | 🔴 CRÍTICA | Bajo | < 1 semana |
| Bloqueo de cuentas | 🟠 ALTA | Bajo | < 1 semana |
| Regeneración de session ID | 🟠 ALTA | Bajo | < 1 semana |
| Mejorar validación open redirect | 🟡 MEDIA | Muy bajo | < 1 semana |

---

## 2. ENCRIPTACIÓN DE CONTRASEÑAS

### 2.1 Implementaciones Existentes ✅

**Sistema EXCELENTE: bcrypt**

```python
# models_sqlalchemy.py línea 19-52
@staticmethod
def hash_password(password: str) -> str:
    """Hash contraseña con bcrypt (cost factor 12)"""
    return bcrypt.hashpw(
        password.encode('utf-8'),
        bcrypt.gensalt(rounds=12)
    ).decode('utf-8')

@staticmethod
def verify_password(password: str, hashed: str) -> bool:
    """Verifica contraseña con bcrypt"""
    return bcrypt.checkpw(
        password.encode('utf-8'),
        hashed.encode('utf-8')
    )
```

**Características**:
- ✅ Salt automático generado por bcrypt
- ✅ Cost factor 12 (~100ms por hash)
- ✅ Resistente a ataques de fuerza bruta por diseño
- ✅ Implementación correcta de `bcrypt` library

**Migración Automática desde SHA-256**:

```python
# repository.py línea 46-85
# Login intenta primero bcrypt, luego SHA-256 legacy
if user and user.verify_password(password):
    # Éxito
    if not password_is_bcrypt(user.password):
        # Migra SHA-256 a bcrypt en siguiente actualización
        user.password = Usuario.hash_password(password)
        db.session.commit()
```

**Fortalezas**:
- ✅ Soporte para contraseñas antiguas SHA-256
- ✅ Auto-migración transparente a bcrypt
- ✅ Usuarios no necesitan cambiar contraseña
- ✅ Mejora de seguridad sin fricción

### 2.2 Vulnerabilidades Identificadas ⚠️

#### 🟡 MEDIA: SIN POLÍTICA DE CONTRASEÑAS FUERTES

**Severidad**: MEDIA - Permite contraseñas débiles

**Descripción**:
```python
# app/auth/routes.py línea 85
if len(new_password) < 6:
    # Error: mínimo 6 caracteres
```

**Problemas**:
- Solo valida longitud (6 caracteres es muy corto)
- NO valida complejidad (mayúsculas, números, símbolos)
- NO valida contra lista de contraseñas comunes
- Permite contraseñas como "abc123" o "111111"

**Acción requerida**:
- Aumentar mínimo a 8 caracteres
- Requerir: 1 mayúscula, 1 minúscula, 1 número
- Validar contra lista de contraseñas comunes
- Agregar tests para validación

---

#### 🟡 MEDIA: SIN EXPIRACIÓN DE CONTRASEÑAS

**Severidad**: MEDIA BAJA - Buena práctica de seguridad

**Descripción**:
- No hay fecha de cambio de contraseña
- No hay política de renovación (ej: cada 90 días)
- Usuario puede mantener contraseña indefinidamente

**Acción requerida**:
- Agregar campo `password_changed_at` a modelos
- Notificar cambio de contraseña cada 90 días
- Forzar cambio si cumplió período

---

### 2.3 Recomendaciones

| Acción | Prioridad | Esfuerzo |
|--------|-----------|----------|
| Implementar política de contraseñas fuertes | 🟠 ALTA | Bajo |
| Agregar expiración de contraseñas | 🟡 MEDIA | Medio |
| Validar contra diccionario común | 🟡 MEDIA | Bajo |

---

## 3. PROTECCIÓN CONTRA CSRF

### 3.1 Implementaciones Existentes ✅

**Flask-WTF CSRFProtect: IMPLEMENTADO CORRECTAMENTE**

```python
# app/__init__.py línea 25
csrf = CSRFProtect(app)

# config.py línea 66-67
WTF_CSRF_ENABLED = True
WTF_CSRF_TIME_LIMIT = None  # Sin expiración (PROBLEMA)
```

**Tokens en formularios**:
- ✅ Login: `auth/login.html` línea 40
- ✅ Bienes: `main/form_bien.html` línea 36
- ✅ Change password: `main/mi_cuenta.html` línea 68
- ✅ Meta tag global: `base.html` línea 7

**Validación automática**:
- ✅ Flask-WTF valida en todos los POST/PUT/DELETE/PATCH
- ✅ Tests verifican requerimiento (test_permissions.py:290-299)

### 3.2 Vulnerabilidades Identificadas ⚠️

#### 🟡 MEDIA: SIN EXPIRACIÓN DE TOKENS CSRF

**Severidad**: MEDIA BAJA - Permite reutilización de tokens

**Descripción**:
```python
# config.py línea 67
WTF_CSRF_TIME_LIMIT = None  # Token válido INDEFINIDAMENTE
```

**Problema**:
- Token CSRF válido aunque sesión expire
- Si sesión dura 8 horas, pero token no expira
- Token viejo podría reutilizarse después de sesión nueva

**Acción requerida**:
- Cambiar a `WTF_CSRF_TIME_LIMIT = 3600` (1 hora)
- Probar que no afecte experiencia usuario

---

### 3.3 Recomendaciones

| Acción | Prioridad | Esfuerzo |
|--------|-----------|----------|
| Configurar expiración CSRF | 🟡 MEDIA | Muy bajo |

---

## 4. PROTECCIÓN CONTRA SQL INJECTION

### 4.1 Implementaciones Existentes ✅

**EXCELENTE: 100% ORM con queries parametrizadas**

```python
# repository.py - Todo usa SQLAlchemy ORM
bien = Bien.query.filter_by(id=bien_id).first()  # Seguro
bienes = Bien.query.filter(
    Bien.codigo_patrimonial.ilike(term_pattern)  # Parámetro escapado
).limit(limit).offset(offset).all()
```

**Código legacy con prepared statements**:
```python
# models.py (DEPRECADO pero seguro)
cur.execute("SELECT * FROM bienes WHERE id = ?", (bien_id,))  # Prepared statement
```

**Validación de parámetros numéricos**:
```python
# models.py línea 228
limite = max(1, min(int(limite), 100))  # Conversión y validación
```

### 4.2 Vulnerabilidades Identificadas ⚠️

#### 🟡 MEDIA BAJA: CÓDIGO LEGACY AÚN PRESENTE

**Severidad**: MEDIA BAJA - No impacta seguridad, solo mantenibilidad

**Descripción**:
- `app/models.py` marcado como deprecado pero funcional
- Aunque usa prepared statements correctamente
- Deuda técnica: duplica código de `models_sqlalchemy.py`

**Acción requerida**:
- Completar migración a ORM
- Eliminar `app/models.py`

---

### 4.3 Recomendaciones

| Acción | Prioridad | Esfuerzo |
|--------|-----------|----------|
| Eliminar app/models.py | 🟢 BAJA | Bajo |

---

## 5. PROTECCIÓN CONTRA XSS

### 5.1 Implementaciones Existentes ✅

**Jinja2 Auto-escaping: ACTIVO**
- ✅ Variables escapadas por defecto: `{{ bien.denominacion }}`
- ✅ Previene `<script>` tags en datos

**Headers de Seguridad**:
```python
# app/__init__.py línea 74-88
X-Content-Type-Options: nosniff            # Previene sniffing de MIME
X-Frame-Options: SAMEORIGIN                # Previene clickjacking
X-XSS-Protection: 1; mode=block            # Modo estricto XSS
Content-Security-Policy: default-src 'self' ...
```

### 5.2 Vulnerabilidades Identificadas ⚠️

#### 🔴 CRÍTICA: CSP MUY PERMISIVO

**Severidad**: CRÍTICA - Anula protección XSS

**Descripción**:
```python
# app/__init__.py línea 81-82
Content-Security-Policy:
    default-src 'self';
    script-src 'self' 'unsafe-inline' 'unsafe-eval' cdn.jsdelivr.net;
    style-src 'self' 'unsafe-inline' cdn.jsdelivr.net;
```

**Problemas**:
- `'unsafe-inline'` permite scripts inline en HTML
- `'unsafe-eval'` permite `eval()` en JavaScript
- Anula **gran parte de la protección XSS**

**¿Por qué existe?**:
- Probablemente hay scripts inline en templates
- En lugar de mover scripts a archivos `.js` externos

**Ejemplo vulnerable**:
```html
<!-- Si hay script inline, CSP no protege -->
<script>
    var data = {{ bien | safe }};  // Peligroso si bien contiene JS
</script>
```

**Acción requerida**:
- 🔴 Eliminar `'unsafe-inline'` y `'unsafe-eval'`
- Mover scripts a archivos externos
- Usar nonce o hash de CSP si necesario
- Agregar `default-src 'self'` sin exceptions

---

#### 🟠 ALTA: SANITIZACIÓN INSUFICIENTE

**Severidad**: ALTA - Permite XSS stored

**Descripción**:
```python
# app/utils.py línea 80-87
def sanitize_input(text: str) -> str:
    """Limpia entrada de usuario"""
    return text.strip()[:500]  # Solo strip() y límite de longitud
```

**Problemas**:
- NO filtra HTML tags: `<script>alert('xss')</script>` se guarda como está
- NO filtra caracteres peligrosos
- Solo aplica a campos username/password

**Además**:
```python
# app/utils.py línea 90-103
def validate_bien_data(data: dict) -> list:
    """Valida datos de bien"""
    return []  # ¡RETORNA LISTA VACÍA!
```

**Comentario en código**:
```python
# Línea 103
# SIN RESTRICCIONES - Permitir que operadores guarden cualquier dato
```

**Impacto**:
- Permite guardar cualquier contenido en campos de bien
- Incluye HTML/JavaScript
- Cuando se renderiza en template: XSS stored

**Ejemplo de ataque**:
```
Operador crea "bien" con descripción:
<img src=x onerror="alert('hacked')">

Cuando admin ve el bien: JavaScript se ejecuta
```

**Acción requerida**:
- 🔴 Habilitar validación estricta en `validate_bien_data()`
- Usar `bleach` o `html.escape` para sanitizar
- Validar longitud máxima por campo
- Rechazar HTML en campos texto

---

### 5.3 Recomendaciones

| Acción | Prioridad | Esfuerzo |
|--------|-----------|----------|
| Eliminar unsafe-inline de CSP | 🔴 CRÍTICA | Medio |
| Habilitar validación de bienes | 🔴 CRÍTICA | Bajo |
| Sanitizar inputs con bleach | 🟠 ALTA | Bajo |

---

## 6. VALIDACIÓN DE ENTRADA DE DATOS

### 6.1 Implementaciones Existentes ✅

**Sanitización básica**:
- ✅ `sanitize_input()` en username/password
- ✅ Conversión de tipos con manejo de excepciones
- ✅ Validación de cambio de contraseña (campos requeridos)

### 6.2 Vulnerabilidades Identificadas ⚠️

#### 🔴 CRÍTICA: VALIDACIÓN DESHABILITADA

**Ya descrito arriba en sección de XSS**

**Acción requerida**:
- 🔴 Implementar validación estricta
- Validación por tipo de campo
- Límites de longitud específicos
- Formatos esperados (códigos, códigos de barras)

---

#### 🟡 MEDIA: SIN VALIDACIÓN DE TIPO DE ARCHIVO

**Severidad**: MEDIA - Permite upload de archivos maliciosos

**Descripción**:
```python
# config.py línea 87
MAX_CONTENT_LENGTH = 16 * 1024 * 1024  # 16MB máximo
```

**Problemas**:
- Solo valida tamaño (16MB)
- NO valida extensión de archivo
- NO valida MIME type
- Usuario podría subir `.exe`, `.php`, etc.

**Acción requerida**:
- Whitelist de extensiones permitidas (.xlsx, .csv, .pdf)
- Validar MIME type con `magic` library
- Almacenar archivos fuera de webroot
- Renombrar archivos para evitar ejecución

---

### 6.3 Recomendaciones

| Acción | Prioridad | Esfuerzo |
|--------|-----------|----------|
| Implementar validación de datos | 🔴 CRÍTICA | Bajo |
| Validación de tipo de archivo | 🟠 ALTA | Bajo |

---

## 7. GESTIÓN DE SESIONES

### 7.1 Implementaciones Existentes ✅

**Configuración segura**:
- ✅ `PERMANENT_SESSION_LIFETIME = 8 horas`
- ✅ `SESSION_COOKIE_HTTPONLY = True`
- ✅ `SESSION_COOKIE_SAMESITE = Lax`
- ✅ `REMEMBER_COOKIE_HTTPONLY = True`
- ✅ Secret key fuerte requerido en producción
- ✅ User loader que recarga usuario en cada request
- ✅ Logout invalida sesión correctamente

### 7.2 Vulnerabilidades Identificadas ⚠️

#### 🔴 CRÍTICA: SECURE FLAG DESHABILITADO (SIN HTTPS)

**Ya descrito en sección 1**

---

#### 🟡 MEDIA: SECRET_KEY EN ARCHIVO .env

**Severidad**: MEDIA BAJA - Riesgo si .env se filtra

**Descripción**:
```python
# config.py línea 51
SECRET_KEY = os.environ.get('SECRET_KEY')
```

**Almacenamiento**:
- `.env` archivo local con permisos estándar
- Vulnerable si servidor comprometido
- Buena práctica: `chmod 600 .env`

**Acción requerida**:
- Ya hay instrucción en `.env.production` línea 38
- Usar variables de entorno del sistema (preferible)
- O vault/secrets manager (CloudSQL Secrets)

---

### 7.3 Recomendaciones

| Acción | Prioridad | Esfuerzo |
|--------|-----------|----------|
| Configurar HTTPS | 🔴 CRÍTICA | Medio |
| Regenerar session ID tras login | 🟠 ALTA | Muy bajo |

---

## 8. CONFIGURACIÓN DE PRODUCCIÓN

### 8.1 Implementaciones Existentes ✅

**Separación de ambientes**:
- ✅ `DevelopmentConfig` para desarrollo
- ✅ `ProductionConfig` para producción
- ✅ `TestingConfig` para testing
- ✅ Validación que DEBUG=False en producción

**Headers de seguridad**:
- ✅ Implementados globalmente en `app/__init__.py`
- ✅ X-Frame-Options, X-Content-Type-Options
- ✅ Strict-Transport-Security (aunque HTTPS no está)
- ✅ CSP (aunque muy permisivo)

**Docker**:
- ✅ Usuario no-root (appuser)
- ✅ Imagen slim (Python 3.11-slim)
- ✅ Variables de entorno no hardcodeadas

**Gunicorn**:
- ✅ Configuración optimizada (`gunicorn_config.py`)
- ✅ Workers = (2 * CPU) + 1
- ✅ Timeout de 120 segundos
- ✅ Logging a stdout/stderr

**Connection Pooling**:
- ✅ Pool de 10 conexiones
- ✅ Recycle cada 1 hora
- ✅ Pre-ping para validar conexiones

### 8.2 Vulnerabilidades Identificadas ⚠️

#### 🔴 CRÍTICA: HTTPS NO CONFIGURADO

**Ya descrito en sección 1**

---

#### 🟠 ALTA: HSTS SIN HTTPS

**Severidad**: ALTA - Configuración contradictoria

**Descripción**:
```python
# app/__init__.py línea 78
Strict-Transport-Security: max-age=31536000; includeSubDomains
```

**Problema**:
- HSTS header se envía pero NO hay HTTPS
- Navegadores moderos ignoran HSTS sin HTTPS
- En primera visita HTTPS no existe, por lo tanto HSTS no se aplica

**Acción requerida**:
- Primero configurar HTTPS
- Luego HSTS tendrá efecto

---

#### 🟠 ALTA: CORS MUY PERMISIVO

**Severidad**: ALTA - Permite peticiones desde cualquier origen

**Descripción**:
```python
# app/__init__.py línea 55
CORS(app, resources={r"/api/*": {"origins": "*"}})
```

**Problema**:
- API accesible desde cualquier dominio
- Sitio malicioso puede hacer requests al API
- Aunque CSRF está protegido, es buena práctica restringir

**Acción requerida**:
- Restringir `origins` a dominios específicos
- Ej: `origins=["https://domain.com", "https://admin.domain.com"]`
- Diferentes configs para desarrollo vs producción

---

#### 🟡 MEDIA: SIN RATE LIMITING GLOBAL

**Ya descrito en sección 1**

---

#### 🟡 MEDIA: SIN MONITOREO/ALERTAS

**Severidad**: MEDIA - Dificulta detección de ataques

**Descripción**:
- No hay integración con Sentry, DataDog, etc.
- No hay alertas para:
  - Múltiples login fallidos
  - Errores de aplicación
  - Tráfico anómalo
  - Cambios de configuración

**Acción requerida**:
- Implementar error tracking (Sentry)
- Configurar alertas en Google Cloud Monitoring
- Monitoreo de logs con reglas de detección

---

#### 🟡 MEDIA: SIN ROTACIÓN DE LOGS

**Severidad**: MEDIA - Disco lleno por logs sin límite

**Descripción**:
```python
# config.py línea 82
LOG_FILE = os.path.join(BASE_DIR, 'logs', 'app.log')
```

**Problema**:
- Archivo crece indefinidamente
- No hay logrotate configurado
- Puede llenar disco duro

**Acción requerida**:
- Configurar `logrotate` en servidor Ubuntu
- Rotación diaria
- Mantener 30 días de histórico
- Compresión automática

---

#### 🟡 MEDIA: BACKUPS NO AUTOMATIZADOS

**Severidad**: MEDIA - Riesgo de pérdida de datos

**Descripción**:
- No hay script de backup automatizado
- Documentación menciona "hacer respaldo regular"
- No hay procedure establecido

**Acción requerida**:
- Crear script de backup diario de PostgreSQL
- Guardar en almacenamiento seguro (GCS, S3)
- Retención de 30 días
- Test mensual de restauración

---

### 8.3 Recomendaciones

| Acción | Prioridad | Esfuerzo |
|--------|-----------|----------|
| Configurar HTTPS | 🔴 CRÍTICA | Medio |
| Restringir CORS | 🟠 ALTA | Muy bajo |
| Implementar rate limiting | 🔴 CRÍTICA | Bajo |
| Configurar logrotate | 🟡 MEDIA | Muy bajo |
| Automatizar backups | 🟡 MEDIA | Bajo |
| Implementar monitoreo | 🟡 MEDIA | Medio |

---

## 9. RESUMEN DE VULNERABILIDADES

### Por Severidad

#### 🔴 CRÍTICAS (4)
1. **HTTPS no configurado** - Cookies en texto plano
2. **Sin rate limiting** - Vulnerable a brute force
3. **Validación de datos deshabilitada** - XSS stored posible
4. **CSP muy permisivo (unsafe-inline)** - Anula XSS protection

#### 🟠 ALTAS (3)
1. **Sin bloqueo de cuentas** - Facilita brute force
2. **Sin regeneración de session ID** - Session fixation posible
3. **CORS muy permisivo** - Mala práctica de seguridad

#### 🟡 MEDIAS (4)
1. **Sin expiración de tokens CSRF** - Permite reutilización
2. **Sin política de contraseñas fuertes** - Permite contraseñas débiles
3. **Sin rotación de logs** - Disco lleno posible
4. **Backups no automatizados** - Riesgo de pérdida de datos

#### 🟢 BAJAS (2)
1. **Código legacy presente** - Deuda técnica
2. **Sin validación de tipo de archivo** - Upload malicioso posible

---

## 10. MATRIX DE RIESGO

```
Impacto ▲
        │     🔴🔴        🟠🟠
    A   │   HTTPS  Rate     CSRF  Validación
    L   │          Limit    Exp   Datos
    T   │
    O   │     🟡🟡         🟢
    ---------Contraseña  Legacy
      Media → Alta ────────────>
```

---

## 11. PLAN DE ACCIÓN INMEDIATO

### Semana 1 (Bloqueadores críticos)
- [ ] Configurar HTTPS con Let's Encrypt
- [ ] Implementar Flask-Limiter (rate limiting)
- [ ] Habilitar validación de datos en bienes
- [ ] Eliminar `'unsafe-inline'` de CSP
- [ ] Mover scripts inline a archivos externos

### Semana 2 (Vulnerabilidades altas)
- [ ] Implementar bloqueo de cuentas
- [ ] Regenerar session ID tras login
- [ ] Restringir CORS a dominios específicos
- [ ] Implementar política de contraseñas fuertes

### Semana 3 (Mejoras medias)
- [ ] Configurar logrotate
- [ ] Automatizar backups de BD
- [ ] Implementar monitoreo/alertas
- [ ] Eliminar código legacy (models.py)

---

## 12. CONCLUSIÓN

El sistema tiene **BASES SÓLIDAS** de seguridad pero requiere **correcciones críticas** antes de mantener producción:

✅ **Lo que está bien**:
- Autenticación robusta con bcrypt
- ORM protege contra SQL injection
- CSRF protection activa
- Autorización por roles

❌ **Lo que debe arreglarse**:
1. 🔴 HTTPS (crítico)
2. 🔴 Rate limiting (crítico)
3. 🔴 Validación de datos (crítico)
4. 🔴 CSP sin unsafe-inline (crítico)

Con estas correcciones, el sistema alcanzará nivel de seguridad **BUENO a EXCELENTE** para un entorno interno de producción.

---

**Fin del análisis de seguridad**
