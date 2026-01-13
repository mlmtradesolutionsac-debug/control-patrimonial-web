# Análisis de Arquitectura - Control Patrimonial Web

**Fecha de análisis**: 2025-12-10
**Versión del documento**: 1.0
**Estado**: Completado

---

## 1. VISIÓN GENERAL

El sistema **Control Patrimonial Web** es una aplicación web construida con **Flask** para la gestión de inventario de bienes patrimoniales. Está diseñada para dos tipos de usuarios:
- **Administradores** (tabla `usuarios`) - Acceso total a todas las funciones
- **Operadores** (tabla `usuarios_app`) - Acceso restringido a funciones específicas

La aplicación puede desplegarse en dos entornos:
1. **Google Cloud Run** (producción escalable en la nube)
2. **Servidor Ubuntu tradicional** (actualmente en producción en 10.28.106.250)

---

## 2. STACK TECNOLÓGICO

### Backend
| Componente | Tecnología | Versión |
|-----------|-----------|---------|
| Framework web | Flask | 3.1.2 |
| ORM de BD | SQLAlchemy | 2.0.44 |
| Autenticación | Flask-Login | 0.6.3 |
| Formularios | Flask-WTF | 1.2.2 |
| CSRF Protection | WTForms | 3.2.1 |
| Migraciones BD | Flask-Migrate/Alembic | 4.0.4 / 1.17.2 |
| CORS | Flask-CORS | 6.0.1 |
| Hash de contraseñas | bcrypt | 4.0.1 |

### Base de Datos
| Entorno | BD | Versión |
|---------|----|---------|
| Desarrollo | SQLite | 3 |
| Producción | PostgreSQL | 15 |

### Servidor/Contenedor
| Componente | Especificación |
|-----------|--------------|
| Servidor WSGI | Gunicorn 21.2.0 |
| Reverse Proxy | Nginx (producción Ubuntu) |
| Contenedor | Docker (Python 3.11-slim) |
| Orquestación | Google Cloud Run |

### Importación/Exportación
- **pandas** 2.3.3 - Procesamiento de datos
- **openpyxl** 3.1.5 - Lectura/escritura de Excel
- **reportlab** 4.4.4 - Generación de PDFs

### Testing
- **pytest** 9.0.1 - Framework de pruebas
- **pytest-cov** 6.0.0 - Cobertura de código

---

## 3. ESTRUCTURA DE DIRECTORIOS

```
E:\PROYECTOS WEB\control_patrimonial_web/
│
├── app/                              # Aplicación principal Flask
│   ├── __init__.py                   # Factory de aplicación, configuración
│   ├── api/                          # Blueprint API REST (37 endpoints)
│   │   ├── routes.py                 # Todas las rutas API
│   │   └── __init__.py
│   ├── auth/                         # Blueprint de autenticación
│   │   ├── routes.py                 # Login, logout, cambio de contraseña
│   │   ├── login.html
│   │   └── __init__.py
│   ├── main/                         # Blueprint de rutas principales
│   │   ├── routes.py                 # Dashboard, CRUD bienes, reportes
│   │   ├── templates/                # Templates HTML
│   │   └── __init__.py
│   ├── services/                     # Lógica de negocio
│   │   └── import_export_service.py  # Importación/exportación Excel/CSV
│   ├── static/                       # Archivos estáticos
│   │   ├── css/                      # Estilos CSS
│   │   ├── js/                       # JavaScript
│   │   └── img/                      # Imágenes
│   ├── templates/                    # Plantillas Jinja2
│   │   ├── base.html                 # Plantilla base
│   │   ├── dashboard.html
│   │   ├── nuevo_bien.html
│   │   ├── editar_bien.html
│   │   └── ...otros templates
│   ├── models.py                     # ⚠️ DEPRECADO - Modelos legacy
│   ├── models_sqlalchemy.py          # ✅ Modelos ORM (SQLAlchemy) - USAR ESTE
│   ├── repository.py                 # Capa de acceso a datos (RepoSQLAlchemy)
│   └── utils.py                      # Utilidades (logging, validación, decoradores)
│
├── config.py                         # Configuración (Development, Production, Testing)
├── wsgi.py                           # Entry point para producción (Gunicorn)
├── run.py                            # Entry point para desarrollo
├── gunicorn_config.py                # Configuración de Gunicorn
│
├── data/                             # Base de datos SQLite (desarrollo)
│   └── inventario_patrimonial.db
│
├── migrations/                       # Migraciones de BD (Alembic)
│   ├── versions/                     # Historial de cambios de esquema
│   ├── env.py
│   └── alembic.ini
│
├── scripts/                          # Scripts de utilidad
│   ├── db_helper.py                  # Helpers para BD
│   ├── manage_admin.py               # Gestión de administradores
│   ├── manage_users.py               # Gestión de operadores
│   └── import_bienes.py              # Script de importación bulk
│
├── tests/                            # Suite de pruebas (pytest)
│   ├── conftest.py                   # Fixtures compartidas
│   ├── test_api.py                   # Tests de API REST
│   ├── test_auth.py                  # Tests de autenticación
│   ├── test_database.py              # Tests de acceso a BD
│   ├── test_import_export.py         # Tests de importación/exportación
│   ├── test_permissions.py           # Tests de permisos
│   └── test_reports.py               # Tests de reportes
│
├── logs/                             # Directorio de logs
│   └── app.log
│
├── .env                              # Variables de entorno (desarrollo, NO committear)
├── .env.example                      # Plantilla de variables
├── .env.production                   # Variables de producción
├── .env.production.example           # Plantilla de producción
│
├── requirements.txt                  # Dependencias desarrollo (138 paquetes)
├── requirements.prod.txt             # Dependencias producción (22 paquetes) ✅
├── requirements_production.txt       # Ultra-minimal (12 paquetes)
├── requirements.dev.txt              # Solo testing
│
├── Dockerfile                        # Contenedor Docker para Cloud Run
├── .dockerignore                     # Archivos a excluir de imagen Docker
├── docker-compose.yml                # Orquestación local (si existe)
│
├── deploy_gcp.sh                     # Script deploy a Google Cloud Run (Bash)
├── deploy_gcp.ps1                    # Script deploy a Google Cloud Run (PowerShell)
│
└── documentación/
    ├── README.md                     # Documentación general
    ├── DEPLOYMENT.md                 # Guía de despliegue general
    ├── DEPLOYMENT_COMPLETE.md        # Estado actual (servidor Ubuntu)
    ├── DEPLOYMENT_UBUNTU_PRODUCCION.md
    ├── REPORTE_SEGURIDAD_DB_POST_DEPLOYMENT.md
    └── ...otros documentos
```

---

## 4. ARQUITECTURA DE CAPAS

```
┌─────────────────────────────────────────────────────────┐
│                   CAPA DE PRESENTACIÓN                   │
│  (Templates Jinja2 + Bootstrap 5 + JavaScript Vanilla)  │
│                                                          │
│  - base.html (plantilla base)                           │
│  - login.html, dashboard.html, formarios, reportes     │
│  - Static: CSS, JS, imágenes                           │
└──────────────────┬──────────────────────────────────────┘
                   │ HTML/JSON
                   ↓
┌─────────────────────────────────────────────────────────┐
│                 CAPA DE APLICACIÓN                       │
│  (Flask Blueprints + Rutas + Controladores)             │
│                                                          │
│  - auth/routes.py (login, logout, cambio password)     │
│  - main/routes.py (CRUD bienes, dashboard, reportes)   │
│  - api/routes.py (37 endpoints REST)                    │
│  - Decoradores: @login_required, @admin_required       │
└──────────────────┬──────────────────────────────────────┘
                   │ Python objects
                   ↓
┌─────────────────────────────────────────────────────────┐
│                  CAPA DE NEGOCIO                         │
│  (Servicios y Utilidades)                              │
│                                                          │
│  - services/import_export_service.py                    │
│  - utils.py (logging, validación, decoradores)         │
│  - Flask-WTF (validación de formularios CSRF)          │
└──────────────────┬──────────────────────────────────────┘
                   │ Objetos ORM
                   ↓
┌─────────────────────────────────────────────────────────┐
│                  CAPA DE PERSISTENCIA                    │
│  (SQLAlchemy ORM + Models)                             │
│                                                          │
│  - models_sqlalchemy.py (definición de modelos)        │
│  - Usuario, UsuarioApp, Bien, Historial, etc.         │
│  - repository.py (RepoSQLAlchemy - DAO pattern)       │
│  - Migraciones con Alembic                             │
└──────────────────┬──────────────────────────────────────┘
                   │ SQL
                   ↓
┌─────────────────────────────────────────────────────────┐
│              CAPA DE BASE DE DATOS                       │
│                                                          │
│  - SQLite (desarrollo)                                 │
│  - PostgreSQL 15 (producción)                          │
│  - Índices optimizados para búsquedas                  │
└─────────────────────────────────────────────────────────┘
```

---

## 5. FLUJO DE SOLICITUD (Request Flow)

### 5.1 Solicitud típica de usuario autenticado

```
1. Usuario accede a http://domain/
   ↓
2. Flask route handler en main/routes.py
   ↓
3. @login_required decorator valida sesión
   ↓
4. Flask-Login carga usuario desde sesión
   ↓
5. Controlador ejecuta lógica de negocio
   ↓
6. RepoSQLAlchemy consulta base de datos
   ↓
7. SQLAlchemy ORM convierte resultados a objetos Python
   ↓
8. Datos se pasan a template Jinja2
   ↓
9. Template renderiza HTML con datos
   ↓
10. Response HTTP se envía al navegador
```

### 5.2 Flujo de login

```
1. Usuario ingresa credenciales en /auth/login
   ↓
2. POST a /auth/login
   ↓
3. validate_on_submit() valida CSRF token (Flask-WTF)
   ↓
4. sanitize_input() limpia username/password
   ↓
5. repo.login(username, password) en repository.py
   ├─ Busca en tabla usuarios (admin)
   ├─ Busca en tabla usuarios_app (operadores)
   ├─ Intenta bcrypt (nuevo)
   └─ Fallback a SHA-256 legacy (migra a bcrypt si éxito)
   ↓
6. Si valida: flask_login.login_user(user, remember_me)
   ├─ Crea sesión con ID compuesto ("admin_id" o "app_username")
   ├─ Cookie de sesión con HttpOnly, SameSite=Lax
   └─ Si remember_me: cookie de 7 días
   ↓
7. Redirige a dashboard
```

---

## 6. COMPONENTES PRINCIPALES

### 6.1 Flask Application Factory

**Ubicación**: `app/__init__.py`

```python
def create_app(config_class=DevelopmentConfig):
    app = Flask(__name__)
    app.config.from_object(config_class)

    # Inicializa extensiones
    db.init_app(app)
    login_manager.init_app(app)
    migrate.init_app(app, db)
    csrf.init_app(app)
    CORS(app, resources={r"/api/*": {"origins": "*"}})

    # Registra blueprints
    app.register_blueprint(auth_bp)
    app.register_blueprint(main_bp)
    app.register_blueprint(api_bp)

    # Headers de seguridad
    @app.after_request
    def add_security_headers(response):
        response.headers['X-Content-Type-Options'] = 'nosniff'
        response.headers['X-Frame-Options'] = 'SAMEORIGIN'
        response.headers['X-XSS-Protection'] = '1; mode=block'
        response.headers['Strict-Transport-Security'] = '...'
        response.headers['Content-Security-Policy'] = '...'
        return response

    return app
```

**Responsabilidades**:
- Crear instancia de aplicación Flask
- Inicializar extensiones (DB, Login, CORS, CSRF)
- Registrar blueprints
- Configurar headers de seguridad
- Manejo de errores globales

### 6.2 Modelos SQLAlchemy

**Ubicación**: `app/models_sqlalchemy.py`

**Clases principales**:

| Modelo | Tabla | Descripción |
|--------|-------|-------------|
| `Usuario` | `usuarios` | Administradores del sistema |
| `UsuarioApp` | `usuarios_app` | Operadores que usan la aplicación |
| `Sede` | `sedes` | Ubicaciones donde se guardan bienes |
| `Unidad` | `unidades` | Dependencias/departamentos |
| `Bien` | `bienes` | Artículos patrimoniales (modelo central) |
| `Historial` | `historial` | Auditoría de cambios en bienes |

**Relaciones principales**:
```
Sede (1) ──→ (N) Bien
Unidad (1) ──→ (N) Bien
Bien (1) ──→ (N) Historial
```

### 6.3 Repository Pattern

**Ubicación**: `app/repository.py`

**Clase**: `RepoSQLAlchemy`

**Responsabilidades**:
- Encapsular todas las consultas de BD
- Autenticación de usuarios
- CRUD de bienes con validación
- Búsqueda y filtrado
- Estadísticas y reportes
- Transacciones y rollback automático

**Métodos principales**:
```python
# Autenticación
.login(username, password) -> Usuario | UsuarioApp

# Bienes
.get_bien(bien_id) -> Bien
.get_bienes(sede_id=None, estado=None, limit=20, offset=0) -> list[Bien]
.create_bien(data) -> Bien
.update_bien(bien_id, data) -> Bien
.delete_bien(bien_id) -> bool

# Búsqueda
.search_bienes(search_term, limit=20) -> list[Bien]

# Estadísticas
.get_estadisticas() -> dict
.get_progreso_cal_2025() -> dict

# Catálogos
.get_sedes() -> list[Sede]
.get_unidades() -> list[Unidad]
```

### 6.4 Blueprints (Módulos de Rutas)

#### Auth Blueprint
**Archivo**: `app/auth/routes.py`

| Ruta | Método | Descripción |
|------|--------|-------------|
| `/auth/login` | GET | Muestra formulario de login |
| `/auth/login` | POST | Procesa autenticación |
| `/auth/cambiar-contrasena` | POST | Cambio de contraseña del usuario |
| `/auth/logout` | GET | Cierra sesión |

#### Main Blueprint
**Archivo**: `app/main/routes.py`

| Ruta | Método | Descripción |
|------|--------|-------------|
| `/` | GET | Dashboard (listado de bienes) |
| `/bien/nuevo` | GET/POST | Crear nuevo bien |
| `/bien/editar/<id>` | GET/POST | Editar bien existente |
| `/bien/eliminar/<id>` | POST | Eliminar bien |
| `/estadisticas` | GET | Página de estadísticas |
| `/usuarios` | GET | Gestión de usuarios (admin) |
| `/mi-cuenta` | GET/POST | Perfil y cambio de contraseña |
| `/chat` | GET | Búsqueda inteligente |
| `/reportes/...` | GET | Diversos reportes |

#### API Blueprint
**Archivo**: `app/api/routes.py`

**37 endpoints REST** organizados por recurso:

```
GET    /api/bienes                    # Listar bienes con paginación
POST   /api/bienes                    # Crear bien
GET    /api/bienes/<id>               # Obtener bien específico
PUT    /api/bienes/<id>               # Actualizar bien
DELETE /api/bienes/<id>               # Eliminar bien

GET    /api/estadisticas              # Estadísticas completas
GET    /api/estadisticas/progreso     # Progreso CAL 2025

GET    /api/sedes                     # Catálogo de sedes
GET    /api/dependencias              # Catálogo de dependencias

POST   /api/buscar                    # Búsqueda avanzada

GET    /api/me                        # Info usuario actual

GET    /api/exportar/excel            # Exportar a Excel
GET    /api/exportar/csv              # Exportar a CSV
POST   /api/importar/excel            # Importar desde Excel
GET    /api/importar/plantilla        # Descargar plantilla

GET    /api/historial/<bien_id>       # Historial de cambios

GET    /api/usuarios                  # Listar usuarios (admin)
POST   /api/usuarios                  # Crear usuario (admin)
PUT    /api/usuarios/<username>       # Actualizar usuario (admin)
DELETE /api/usuarios/<username>       # Desactivar usuario (admin)
POST   /api/usuarios/<username>/reset-password

GET    /api/health                    # Health check
```

---

## 7. BASE DE DATOS

### 7.1 Esquema (Diagrama simplificado)

```
┌─────────────────┐
│    USUARIOS     │
├─────────────────┤
│ id (PK)         │
│ usuario (UQ)    │
│ nombre          │
│ password        │
│ rol             │
└────────┬────────┘

┌──────────────────────┐
│   USUARIOS_APP       │
├──────────────────────┤
│ username (PK)        │
│ nombre               │
│ password_hash        │
│ rol                  │
│ activo               │
└────────┬─────────────┘

┌──────────────┐         ┌──────────────┐
│    SEDES     │         │   UNIDADES   │
├──────────────┤         ├──────────────┤
│ id (PK)      │         │ id (PK)      │
│ nombre (UQ)  │         │ nombre (UQ)  │
└────────┬─────┘         └────────┬─────┘
         │                        │
         │ (1:N)                  │ (1:N)
         │                        │
         └────────────┬───────────┘
                      │
         ┌────────────▼──────────────┐
         │         BIENES            │
         ├───────────────────────────┤
         │ id (PK)                   │
         │ codigo_patrimonial (UQ)   │
         │ cod_barras (UQ)           │
         │ denominacion              │
         │ descripcion               │
         │ marca, modelo             │
         │ serie (UQ)                │
         │ estado (b/r/m)            │
         │ sede_id (FK)              │
         │ unidad_id (FK)            │
         │ ubicacion_texto           │
         │ responsable               │
         │ usuario_registro          │
         │ fecha_registro            │
         │ verificado                │
         │ cal_2025 (UQ)             │
         │ ... otros campos CAL      │
         └────────────┬──────────────┘
                      │ (1:N)
                      │
         ┌────────────▼──────────────┐
         │      HISTORIAL            │
         ├───────────────────────────┤
         │ id (PK)                   │
         │ bien_id (FK)              │
         │ usuario                   │
         │ accion (CREAR/EDITAR...) │
         │ detalle_json              │
         │ fecha                     │
         └───────────────────────────┘
```

### 7.2 Índices Optimizados

Los siguientes índices están creados para optimizar búsquedas frecuentes:

```
idx_bien_sede_estado          # Búsqueda por sede y estado
idx_bien_fecha                # Ordenamiento por fecha
idx_bien_usuario_registro     # Filtro por usuario
idx_bien_cal_2025             # Búsqueda de campaña actual
idx_bien_denominacion         # Búsqueda de nombre
idx_historial_fecha           # Auditoría por fecha
idx_historial_bien_usuario    # Auditoría de bien
idx_sede_nombre               # Catálogo de sedes
idx_unidad_nombre             # Catálogo de unidades
```

### 7.3 Connection Pooling

**Configuración en producción** (PostgreSQL):
```python
SQLALCHEMY_ENGINE_OPTIONS = {
    'pool_size': 10,           # Conexiones por worker
    'pool_recycle': 3600,      # Reciclar cada 1 hora
    'pool_pre_ping': True,     # Verificar antes de usar
    'max_overflow': 20,        # Picos de tráfico
}
```

**Beneficios**:
- Reutilización de conexiones (más rápido)
- Prevención de conexiones muertas
- Manejo de picos de tráfico

---

## 8. SEGURIDAD

### 8.1 Autenticación

**Sistema dual**:
- Usuarios con tabla `usuarios` → ID de sesión: `admin_<id>`
- Usuarios con tabla `usuarios_app` → ID de sesión: `app_<username>`

**Hashing de contraseñas**:
- **Nuevo**: bcrypt con salt automático, cost factor 12
- **Legacy**: SHA-256 (migra automáticamente a bcrypt en próximo login)

**Gestión de sesiones**:
- Timeout: 8 horas
- Remember me: 7 días
- Cookies: HttpOnly, SameSite=Lax
- CSRF Protection: Activo en todos los formularios

### 8.2 Autorización

**Decoradores**:
- `@login_required` - Requiere autenticación
- `@admin_required` - Solo administradores
- `@role_required(rol)` - Requiere rol específico

**Control por recurso**:
- Dashboard: Todos los usuarios autenticados
- CRUD de bienes: Solo operadores autorizados
- Gestión de usuarios: Solo administradores
- Reportes sensibles: Solo administradores

### 8.3 Protecciones Web

| Protección | Implementación | Estado |
|-----------|-------------|--------|
| CSRF | Flask-WTF con tokens | ✅ Activo |
| XSS | Auto-escaping Jinja2 + CSP | ⚠️ CSP con unsafe-inline |
| SQL Injection | ORM SQLAlchemy | ✅ Seguro |
| Autenticación | bcrypt + sesiones | ✅ Bueno |
| Headers de seguridad | X-Frame-Options, etc. | ✅ Configurado |
| CORS | Configurado para API | ⚠️ Muy permisivo |
| Rate Limiting | NO implementado | ❌ Falta |
| HTTPS | NO configurado | ❌ Crítico en prod |

---

## 9. PATRONES DE DISEÑO UTILIZADOS

| Patrón | Ubicación | Propósito |
|--------|----------|----------|
| **Factory** | `app/__init__.py` | Crear app con diferentes configs |
| **Blueprint** | `auth/`, `main/`, `api/` | Modularizar rutas |
| **Repository** | `repository.py` | Encapsular acceso a datos |
| **DAO (Data Access Object)** | `RepoSQLAlchemy` | Abstracción de BD |
| **Service Layer** | `services/` | Lógica de negocio |
| **Decorator** | `utils.py` | Autorización y logging |
| **ORM** | SQLAlchemy | Abstracción de BD |

---

## 10. FLUJOS PRINCIPALES DE DATOS

### 10.1 Crear un bien

```
Usuario llena formulario
        ↓
POST /bien/nuevo (validado con CSRF token)
        ↓
validate_bien_data(data) en utils.py
        ↓
repo.create_bien(data) en repository.py
        ↓
SQLAlchemy crea objeto Bien y lo guarda
        ↓
Se registra en tabla historial (CREAR)
        ↓
Redirige a dashboard
```

### 10.2 Búsqueda de bienes

```
Usuario ingresa término en /chat
        ↓
AJAX POST /api/buscar con término
        ↓
repo.search_bienes(term) ejecuta ILIKE query
        ↓
SQLAlchemy retorna lista de Bien objects
        ↓
JSON response con resultados
        ↓
JavaScript renderiza en página
```

### 10.3 Exportación a Excel

```
Usuario solicita export en /
        ↓
GET /api/exportar/excel
        ↓
repo.get_bienes() obtiene todos los datos
        ↓
ExportService.to_excel(bienes, filepath)
        ↓
pandas crea DataFrame
        ↓
openpyxl genera archivo XLSX
        ↓
Flask envía archivo como descarga
```

---

## 11. DEPENDENCIAS CRÍTICAS

### 11.1 Dependencias faltantes en production

❌ **gunicorn NO está en requirements.prod.txt** - DEBE AGREGARSE

### 11.2 Dependencias pesadas (eliminadas en prod)

Las siguientes están en `requirements.txt` pero NO en `requirements.prod.txt`:
- `torch`, `torchaudio` - Machine learning (no usado)
- `pygame`, `PySimpleGUI` - GUI desktop (no usado)
- `demucs`, `librosa`, `audioread` - Audio processing (no usado)
- `openai`, `fastapi`, `uvicorn` - Frameworks alternos (no usado)
- `matplotlib`, `pyinstaller` - Solo desarrollo

**Reducción**: 138 → 22 paquetes (85% más ligero)

---

## 12. FLUJO DE DESPLIEGUE

### 12.1 Google Cloud Run (Actual en la nube)

```
Repositorio Git
       ↓
Trigger Cloud Build
       ↓
Build imagen Docker
       ↓
Push a Container Registry
       ↓
Deploy a Cloud Run
       ↓
Asigna URL HTTPS automático
       ↓
Escalado automático (0 a N instancias)
```

**URL**: `https://control-patrimo-web-195522615542.us-central1.run.app/auth/login`

### 12.2 Servidor Ubuntu (Actualmente operativo)

```
IP: 10.28.106.250
OS: Ubuntu 24.04 LTS
Usuario: patrimonio

Gunicorn (2 workers, puerto 8000)
       ↓
Nginx (puerto 80, HTTP)
       ↓
navegador
```

**Estado**: Operacional pero SIN HTTPS

---

## 13. CONFIGURACIÓN POR ENTORNO

### 13.1 Desarrollo (run.py)
- DEBUG=True
- SQLite local
- SECRET_KEY por defecto
- CSRF=Activo
- Todos los headers de seguridad activos

### 13.2 Producción (wsgi.py)
- DEBUG=False
- PostgreSQL (si DATABASE_URL está configurado)
- SECRET_KEY requiere valor fuerte
- CSRF=Activo
- Headers de seguridad activos
- ⚠️ HTTPS=No configurado (BLOQUEADOR)

### 13.3 Testing
- TESTING=True
- CSRF=Deshabilitado
- BD en memoria o SQLite temporal
- No se activan headers de seguridad

---

## 14. PUNTOS CRÍTICOS

### ✅ Fortalezas
1. Arquitectura modular bien organizada (Blueprints)
2. ORM seguro (SQLAlchemy) previene SQL injection
3. Autenticación con bcrypt (seguro)
4. CSRF Protection activo
5. Logging y auditoría de cambios
6. Tests automatizados
7. Configuración separada por entorno
8. Docker listo para Cloud Run

### ⚠️ Debilidades
1. **HTTPS no configurado** - CRÍTICO
2. **gunicorn falta en requirements.prod.txt** - Bloqueador
3. **Rate limiting no implementado** - Vulnerable a brute force
4. **Validación de datos deshabilitada** - Permite datos no validados
5. **CSP muy permisivo** (unsafe-inline) - Reduce protección XSS
6. **CORS abierto a todos** (origins: "*") - Riesgo de CSRF
7. **No hay regeneración de session ID** - Vulnerable a session fixation
8. **Sin bloqueo de cuentas** - Brute force posible

---

## 15. PRÓXIMAS MEJORAS

Ver documento `PLAN_MEJORAS.md` para lista completa y priorizada.

---

**Fin del análisis de arquitectura**
