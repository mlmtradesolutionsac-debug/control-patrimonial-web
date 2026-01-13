# Control Patrimonial Web - QWEN Context

## Descripción General

Proyecto de aplicación web profesional para la gestión de inventario patrimonial del Distrito Fiscal del Callao. Construido con Flask, Bootstrap 5 y mejores prácticas de seguridad. La aplicación permite la gestión completa de bienes patrimoniales con funcionalidades de autenticación, control de acceso, estadísticas y una API REST completa.

## Tecnologías Principales

- **Python 3.8+**
- **Flask** (Framework web)
- **SQLAlchemy** (ORM para bases de datos)
- **Bootstrap 5** (Interfaz de usuario)
- **SQLite** (Base de datos en desarrollo)
- **PostgreSQL** (Base de datos en producción)
- **Gunicorn** (Servidor WSGI para producción)

## Estructura del Proyecto

```
control_patrimonial_web/
├── app/                    # Código fuente principal
│   ├── api/               # Endpoints de API REST
│   ├── auth/              # Autenticación
│   ├── main/              # Rutas principales
│   ├── templates/         # Plantillas HTML
│   └── models_sqlalchemy.py # Modelos de datos
├── data/                  # Base de datos
│   └── inventario_patrimonial.db
├── logs/                  # Registros de aplicación
├── migrations/            # Migraciones de base de datos
├── scripts/               # Scripts útiles
├── tests/                 # Pruebas
├── .env                   # Variables de entorno
├── config.py              # Configuración del proyecto
├── Dockerfile             # Contenedorización
├── requirements.txt       # Dependencias Python
├── run.py                 # Punto de entrada principal
└── README.md              # Documentación principal
```

## Modelos de Datos

### Usuario
- Administradores con acceso total al sistema
- Tabla: `usuarios`

### UsuarioApp
- Operadores con permisos limitados
- Tabla: `usuarios_app`

### Bien
- Representa los bienes patrimoniales
- Campos: código_patrimonial, cod_barras, denominación, descripción, marca, modelo, serie, estado, ubicación, responsable, etc.

### Sede
- Sedes del Distrito Fiscal

### Unidad
- Unidades/dependencias del Distrito Fiscal

### Historial
- Registro de cambios en los bienes

### Responsable
- Responsables asignados a bienes

## Funcionalidades Principales

1. **Autenticación y Control de Acceso**
   - Sistema de autenticación seguro con roles
   - Control de roles (admin, operador)
   - Sesiones con timeout configurable

2. **Gestión de Bienes Patrimoniales**
   - CRUD completo (Crear, Leer, Actualizar, Eliminar)
   - Búsqueda inteligente en múltiples campos
   - Filtrado por sede, dependencia y estado
   - Historial de cambios

3. **Estadísticas y Reportes**
   - Dashboard con métricas en tiempo real
   - Progreso del inventario CAL 2025
   - Estadísticas por sede y dependencia
   - Exportación a Excel

4. **API REST**
   - Endpoints completos para CRUD
   - Búsqueda programática
   - Acceso a estadísticas

## Configuración

### Variables de entorno
- `FLASK_ENV`: development/production/testing
- `SECRET_KEY`: clave secreta para sesiones
- `DATABASE_URL`: URL de conexión a base de datos
- `SESSION_COOKIE_SECURE`: seguridad de cookies
- `REMEMBER_COOKIE_SECURE`: seguridad de cookies persistentes

### Entornos
- **Desarrollo**: Debug activo, base de datos SQLite
- **Producción**: HTTPS requerido, base de datos PostgreSQL
- **Testing**: Base de datos en memoria

## Ejecución

### Desarrollo
```bash
python run.py
```

### Producción con Gunicorn
```bash
gunicorn -w 4 -b 0.0.0.0:5000 "app:create_app()"
```

## Características de Seguridad

1. **CSRF Protection**: Tokens automáticos en formularios
2. **XSS Prevention**: Sanitización de entrada
3. **SQL Injection**: Prepared statements y ORM
4. **Session Security**: Cookies HttpOnly, SameSite, Secure
5. **Password Security**: Hashing con bcrypt (migración desde SHA-256)
6. **Logging**: Auditoría completa de acciones

## Despliegue

El proyecto está preparado para despliegue en Cloud Run o servidores Ubuntu con:
- Nginx como reverse proxy
- SSL/TLS configurado
- Gunicorn como servidor WSGI
- Postfix para envío de emails
- Systemd para gestión de servicios

## Documentación Importante

- `README.md`: Documentación principal del proyecto
- `INICIO_AQUI.md`: Plan de implementación v1.3
- `PLAN_IMPLEMENTACION_B_OPCION_3SEMANAS.md`: Plan detallado de mejoras
- `DEPLOYMENT_UBUNTU_PRODUCCION.md`: Guía de despliegue en producción
- `MEJORAS_IMPLEMENTADAS.md`: Lista de mejoras implementadas

## Objetivos Futuros

- Panel de administración mejorado
- Importación de datos desde Excel
- Reportes en PDF
- Notificaciones por email
- Autenticación LDAP/AD
- Aplicación móvil
- Integración con sistemas ERP

## Notas Especiales

- El proyecto utiliza una migración gradual de un modelo de datos más antiguo (`models.py`) a SQLAlchemy ORM (`models_sqlalchemy.py`)
- Implementa prácticas de seguridad avanzadas como el uso de bcrypt para hashing de contraseñas
- Tiene un sistema completo de logging y monitoreo
- La configuración está optimizada para diferentes entornos (desarrollo, producción, testing)
- El proyecto ya está desplegado en producción en Google Cloud Run: https://control-patrimo-web-195522615542.us-central1.run.app/