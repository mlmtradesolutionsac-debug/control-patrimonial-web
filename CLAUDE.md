# CLAUDE.md

Este archivo proporciona orientación a Claude Code (claude.ai/code) al trabajar con código en este repositorio.

## Descripción del Proyecto

**Control Patrimonial Web** es un sistema profesional de gestión de inventario patrimonial para el Distrito Fiscal del Callao, construido con Flask, SQLAlchemy y Bootstrap 5. Proporciona gestión de activos, autenticación de usuarios, reportes y una API REST completa. La aplicación soporta SQLite (desarrollo) y PostgreSQL (producción) con despliegue en Google Cloud Run.

## Comandos Comunes

### Configuración de Desarrollo
```bash
# Crear y activar entorno virtual
python -m venv venv
venv\Scripts\activate          # Windows
source venv/bin/activate       # Linux/Mac

# Instalar dependencias
pip install -r requirements.txt

# Ejecutar servidor de desarrollo
python run.py
# O: python -m flask run
# Se ejecuta en http://localhost:5000
```

### Base de Datos
```bash
# Crear base de datos (se crea automáticamente al ejecutar, pero puede ser manual)
python init_db.py

# Ejecutar migraciones (Flask-Migrate)
flask db init           # Inicializar carpeta migrations (solo la primera vez)
flask db migrate        # Crear migración a partir de cambios en modelos
flask db upgrade        # Aplicar migraciones pendientes
flask db downgrade      # Revertir última migración
```

### Testing
```bash
# Ejecutar todos los tests
pytest tests/ -v

# Ejecutar archivo de test específico
pytest tests/test_auth.py -v

# Ejecutar tests con marcador específico
pytest -m unit -v
pytest -m integration -v
pytest -m auth -v
pytest -m api -v

# Ejecutar con cobertura
pytest --cov=app --cov-report=html

# Ejecutar un solo test
pytest tests/test_auth.py::TestAuthentication::test_login -v

# Ejecutar tests que coincidan con patrón
pytest -k "test_create" -v
```

Marcadores de test definidos en pytest.ini:
- `unit`: Tests unitarios
- `integration`: Tests de integración
- `auth`: Tests de autenticación
- `api`: Tests de endpoints de API
- `import_export`: Tests de funcionalidad de importación/exportación
- `slow`: Tests que tardan más tiempo
- `security`: Tests de seguridad

### Linting y Calidad de Código
```bash
# Nota: No hay linter explícitamente configurado, pero se puede agregar:
flake8 app/                    # Verificación de estilo Python
black app/                     # Formateo de código
pylint app/                    # Linting comprensivo
```

### Producción
```bash
# Usando Gunicorn
gunicorn -c gunicorn_config.py
# O con parámetros directos
gunicorn -w 4 -b 0.0.0.0:5000 "app:create_app()"

# Usando punto de entrada WSGI
gunicorn wsgi:app

# Establecer entorno para producción
export FLASK_ENV=production    # Linux/Mac
set FLASK_ENV=production       # Windows
```

### Gestión de Entorno
```bash
# Generar SECRET_KEY segura para .env
python -c "import secrets; print(secrets.token_hex(32))"

# Copiar archivo de ejemplo
cp .env.example .env
```

### Comandos Útiles de Base de Datos
```bash
# Acceder a shell Python con contexto de app
flask shell
>>> from app.models_sqlalchemy import db, Usuario
>>> Usuario.query.all()
>>> exit()

# Comandos CLI (definidos en app/commands.py)
flask init-admin --usuario admin --password pass123
flask export-excel --output export.xlsx
```

## Descripción General de la Arquitectura

### Estructura Principal de la Aplicación
La aplicación usa blueprints de Flask para organizar la funcionalidad en dominios modulares:

```
app/
├── __init__.py          # Factory de Flask (create_app), inicialización de extensiones, middleware
├── auth/                # Blueprint de autenticación - flujos de login/logout
├── main/                # Rutas de UI principal - dashboard, CRUD de inventario, estadísticas
├── api/                 # Blueprint de API REST - endpoints JSON para todas las operaciones
├── fichas/              # Vistas de detalles de activos y operaciones
├── responsables/        # Gestión de partes responsables
├── services/            # Servicios de lógica de negocio (importación/exportación, etc.)
├── models_sqlalchemy.py # Modelos SQLAlchemy ORM (PRINCIPAL - usar esto)
├── models.py            # Acceso directo a BD heredado (DEPRECATED, evitar nuevo código)
├── repository.py        # Capa de acceso a datos (compatibilidad heredada)
├── decorators.py        # Decoradores de permisos (@is_visitor_user, @can_edit)
├── utils.py             # Funciones utilitarias (logging, helpers)
└── templates/           # Templates Jinja2 HTML
```

### Modelos de Base de Datos (SQLAlchemy ORM)

**Modelos principales en `app/models_sqlalchemy.py`:**

- **Usuario**: Usuarios administradores (acceso super-admin)
  - Campos: id, usuario (nombre de usuario), nombre, contraseña, rol
  - Usa bcrypt hashing para nuevas contraseñas
  - Usa prefijo 'admin_' para identificación en user_loader

- **UsuarioApp**: Operadores de aplicación (acceso limitado)
  - Campos: id, username, nombre, email, password_hash, estado
  - Usa bcrypt hashing
  - Usa prefijo 'app_' para identificación en user_loader

- **Bien**: Elementos del inventario de activos (objeto de negocio principal)
  - Campos: id, codigo_patrimonial, denominacion, sede, dependencia, estado, etc.
  - Tiene índices en campos frecuentemente buscados para rendimiento
  - Rastrea timestamps de creación/modificación y parte responsable

- **SedeCatalog, DependenciaCatalog**: Tablas de búsqueda para clasificación
  - Usadas para estandarizar datos de sede/departamento
  - Reducen duplicación de datos y habilitan filtrado

**Decisión de diseño**: El código nuevo debe usar `models_sqlalchemy.py` con SQLAlchemy ORM. El `models.py` heredado existe solo para compatibilidad hacia atrás.

### Configuración de Extensiones

**app/__init__.py** configura:
- `Flask-Login`: Gestión de sesiones y carga de usuarios
- `Flask-WTF`: Protección CSRF con validación de token
- `Flask-CORS`: Compartición de recursos entre orígenes para API
- `Flask-SQLAlchemy`: ORM de base de datos
- `Flask-Migrate`: Migraciones de base de datos
- `Flask-Limiter`: Rate limiting (deshabilitado en producción)
- `ProxyFix`: Manejo de headers en Cloud Run detrás de load balancer
- Headers de seguridad: CSP, X-Frame-Options, HSTS, etc.

### Gestión de Configuración

**config.py** define tres entornos:

1. **DevelopmentConfig** (FLASK_ENV=development)
   - DEBUG=True, TESTING=False
   - Base de datos SQLite (archivo local)
   - CSRF estricto pero flexible
   - Pool de conexiones: 5 tamaño, 1800s reciclaje

2. **ProductionConfig** (FLASK_ENV=production)
   - DEBUG=False, TESTING=False
   - PostgreSQL (vía variable de entorno DATABASE_URL)
   - Cookies seguras (HTTPS requerido)
   - Pool de conexiones: 10 tamaño, 3600s reciclaje (maneja workers de Gunicorn)
   - Se retracta a PostgreSQL en localhost si DATABASE_URL no está establecido

3. **TestingConfig** (FLASK_ENV=testing)
   - TESTING=True
   - CSRF deshabilitado
   - Base de datos en memoria o de prueba

**Configuraciones clave del pool explicadas:**
- `pool_size`: Conexiones base por proceso
- `pool_pre_ping`: Valida conexión antes de usar (previene conexiones obsoletas)
- `pool_recycle`: Tiempo antes de que se recicle conexión (maneja timeouts de BD)
- `max_overflow`: Conexiones adicionales para picos

### Flujo de Registro de Blueprint

1. **app/__init__.py:create_app()** inicializa extensiones y registra blueprints
2. Blueprints importados desde archivos `__init__.py` respectivos
3. Cada blueprint registra sus rutas en `routes.py`
4. Prefijos de URL: auth → `/auth`, main → `/`, api → `/api`, fichas → `/fichas`, responsables → `/`

### Flujo de Solicitud para Autenticación

```
Solicitud → middleware (ProxyFix) → verificación CSRF → verificación Login
           ↓
    Manejador de ruta → Verificación de decorador (@login_required, @can_edit)
           ↓
    Respuesta → Headers de seguridad inyectados
```

Decoradores de permiso en `app/decorators.py`:
- `@is_visitor_user`: Verifica si el usuario es solo visitante (acceso de lectura)
- `@can_edit`: Verifica si el usuario puede modificar datos

### Medidas de Seguridad

**Protección CSRF** (Flask-WTF):
- Token generado e inyectado en todos los formularios (procesador de contexto base.html)
- Validado en solicitudes POST/PUT/DELETE
- Límite de tiempo deshabilitado (WTF_CSRF_TIME_LIMIT = None)

**Seguridad de Sesión**:
- Cookies HttpOnly (previene acceso por JS)
- SameSite=Lax (prevención de CSRF)
- Flag Secure habilitado en producción (solo HTTPS)
- Duración de sesión de 8 horas

**Hash de Contraseña**:
- bcrypt con factor de costo 12 (~100ms por hash)
- Resiste fuerza bruta debido a lentitud
- Incluye salt automáticamente

**Base de Datos**:
- Consultas parametrizadas de SQLAlchemy (previene SQL injection)
- Sin SQL raw en rutas (todo vía ORM)

**Seguridad de API**:
- Requiere autenticación (excepto /health)
- CORS restringido para endpoints de API
- Formato de respuesta JSON estándar

**Headers**:
- Content-Security-Policy: Restringe fuentes de scripts
- X-Frame-Options: Previene clickjacking
- X-Content-Type-Options: Previene MIME sniffing
- Strict-Transport-Security: Obliga HTTPS

## Detalles Importantes de Implementación

### Carga de Usuarios en Flask-Login

La función `load_user()` en `app/__init__.py` maneja dos tipos de usuarios:
- Prefijo `admin_` → modelo Usuario (administradores)
- Prefijo `app_` → modelo UsuarioApp (operadores)

Esto permite que ambos tipos de usuarios coexistan mientras Flask-Login identifica qué tabla consultar.

### Endpoints de Health Check

Dos endpoints para monitoreo de Cloud Run:
- `/health`: Estado de salud simple (sin consulta a BD para evitar problemas de arranque frío)
- `/ready`: Verificación de disponibilidad que valida conectividad a BD

### Migraciones

Este proyecto usa Flask-Migrate (basado en SQLAlchemy):
```bash
flask db init                  # Inicializar (ejecutar una vez)
flask db migrate -m "mensaje"  # Crear migración a partir de cambios de modelo
flask db upgrade              # Aplicar migración
```

**Importante**: Siempre inspeccionar migraciones auto-generadas antes de aplicar.

### Límites de Carga de Archivos

Establecidos en config.py:
```python
MAX_CONTENT_LENGTH = 16 * 1024 * 1024  # 16MB máximo
```

Usado para funcionalidad de importación Excel/CSV.

### Configuración de Logging

Configurado en `app/utils.py:setup_logging()`:
- Desarrollo: Salida a consola
- Producción: Salida a archivo `logs/app.log`
- Nivel de log: INFO por defecto (configurable vía variable LOG_LEVEL)

## Archivos Clave a Conocer

- **config.py**: Configuraciones específicas de entorno, URIs de base de datos, configuración de pool
- **wsgi.py**: Punto de entrada de producción para Gunicorn (no para desarrollo)
- **run.py**: Punto de entrada de desarrollo
- **app/__init__.py**: Factory de app, configuración de extensiones, hooks de solicitud, manejadores de errores
- **app/models_sqlalchemy.py**: Modelos ORM (PRINCIPAL - usar esto)
- **app/decorators.py**: Verificaciones de permisos (@login_required, @can_edit, @is_visitor_user)
- **app/utils.py**: Logging, funciones utilitarias
- **pytest.ini**: Configuración de test con marcadores
- **.env.example**: Plantilla de variables de entorno
- **.env.production**: Plantilla de configuración de entorno de producción

## Mejores Prácticas de Desarrollo

### Al Agregar Características

1. **Cambios de base de datos**: Modificar modelo en `models_sqlalchemy.py` → Ejecutar `flask db migrate` → Revisar archivo de migración → `flask db upgrade`

2. **Nuevas rutas**: Crear en blueprint apropiado (`main/routes.py`, `api/routes.py`, etc.)

3. **Nueva lógica de negocio**: Extraer a módulos en `app/services/` (ej., `import_export_service.py`)

4. **Templates**: Usar Jinja2 en `app/templates/` con herencia de base.html

5. **Endpoints de API**: Seguir patrones existentes en `api/routes.py` - devolver JSON con esquema consistente

### Directrices de Testing

- Colocar tests en directorio `tests/` con nombre `test_*.py`
- Usar `conftest.py` para fixtures y configuración de app
- Marcar tests con marcadores apropiados de pytest.ini
- Usar base de datos de prueba (configurada en TestingConfig)
- Verificar tests existentes en `test_auth.py`, `test_api.py` para patrones

### Consideraciones de Base de Datos

- **SQLite** (desarrollo): Se crea automáticamente en `data/inventario_patrimonial.db`
- **PostgreSQL** (producción): Requiere variable de entorno DATABASE_URL; se retracta a localhost si no está establecida
- Ambas comparten modelos iguales vía SQLAlchemy - las migraciones funcionan transparentemente

## Característica de Importación/Exportación

El módulo `app/services/import_export_service.py` maneja:
- Importación Excel/CSV con validación
- Exportación a múltiples formatos (Excel, CSV, PDF)
- Reporte de errores para operaciones en lote
- Transformación y limpieza de datos

Esto es usado tanto por rutas de UI como por endpoints de API.

## Despliegue en Google Cloud Run

La aplicación incluye soporte para Google Cloud Run:
- **Middleware ProxyFix**: Maneja headers X-Forwarded-* del load balancer
- **Health checks**: Endpoints /health y /ready
- **Cloud SQL**: Cadena de conexión PostgreSQL vía DATABASE_URL
- **Stateless**: Sin almacenamiento de archivos local (usar Cloud Storage si es necesario)

Ver archivos de documentación de despliegue para configuración detallada de Cloud Run.

## Debugging Común

### Problemas de Conexión a Base de Datos
- Verificar formato de variable DATABASE_URL
- Verificar que PostgreSQL esté ejecutándose (producción)
- Verificar logs de pool_pre_ping para conexiones obsoletas
- Revisar `logs/app.log`

### Errores de Token CSRF
- Asegurar que base.html se use (contiene meta tag csrf_token)
- Verificar que formulario incluya {% csrf_token() %}
- Verificar que WTF_CSRF_ENABLED=True

### Errores de Importación/Exportación
- Verificar MAX_CONTENT_LENGTH para archivos grandes
- Revisar logs de error en respuesta de importación
- Validar formato de Excel y encabezados de columnas

### Específico de Cloud Run
- Revisar logs de cloud en GCP Console
- Verificar headers de ProxyFix si hay problemas de HTTPS
- Verificar que DATABASE_URL apunte a Cloud SQL
- Monitorear agotamiento de pool de conexiones

## Notas sobre Organización del Código

- El código soporta patrones tanto **heredados** como **modernos**:
  - **Heredado**: Consultas SQL directas en `models.py` y `repository.py`
  - **Moderno**: SQLAlchemy ORM en `models_sqlalchemy.py`
  - El código nuevo debe usar el enfoque moderno SQLAlchemy

- **Organización de blueprints**: Cada módulo (auth, main, api, fichas, responsables) es un blueprint autocontenido con sus propias rutas y templates

- **Capa de servicios**: La lógica de negocio compartida entre múltiples rutas/endpoints vive en `app/services/`

- **Dos modelos de usuario**: `Usuario` (administradores) y `UsuarioApp` (operadores) permiten control de acceso basado en roles
