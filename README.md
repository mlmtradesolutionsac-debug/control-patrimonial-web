# Control Patrimonial Web

<div align="center">

![Python](https://img.shields.io/badge/Python-3.8%2B-blue?style=flat-square&logo=python)
![Flask](https://img.shields.io/badge/Flask-2.3-green?style=flat-square&logo=flask)
![Bootstrap](https://img.shields.io/badge/Bootstrap-5.3-purple?style=flat-square&logo=bootstrap)
![License](https://img.shields.io/badge/License-MIT-yellow?style=flat-square)

Aplicación web profesional para la gestión de inventario patrimonial del Distrito Fiscal del Callao, construida con Flask, Bootstrap 5 y mejores prácticas de seguridad.

[Características](#características) • [Instalación](#instalación) • [Uso](#uso) • [API](#api) • [Seguridad](#seguridad)

</div>

---

## 📋 Tabla de Contenidos

- [Características](#características)
- [Requisitos](#requisitos)
- [Instalación](#instalación)
- [Configuración](#configuración)
- [Ejecución](#ejecución)
- [Estructura del Proyecto](#estructura-del-proyecto)
- [API REST](#api-rest)
- [Seguridad](#seguridad)
- [Troubleshooting](#troubleshooting)
- [Contribuciones](#contribuciones)

---

## ✨ Características

### Autenticación y Control de Acceso
- ✅ Sistema de autenticación seguro
- ✅ Control de roles (admin, operador)
- ✅ Sesiones con timeout configurable
- ✅ Opción "Recuerda mi sesión"
- ✅ Logging de todas las acciones de usuario

### Gestión de Bienes Patrimoniales
- ✅ CRUD completo (Crear, Leer, Actualizar, Eliminar)
- ✅ Búsqueda inteligente en múltiples campos
- ✅ Filtrado por sede, dependencia y estado
- ✅ Paginación eficiente
- ✅ Historial de cambios
- ✅ Validación de datos en cliente y servidor

### Estadísticas y Reportes
- ✅ Dashboard con métricas en tiempo real
- ✅ Progreso del inventario CAL 2025
- ✅ Estadísticas por sede y dependencia
- ✅ Top de inventariadores
- ✅ Distribución de estados de bienes
- ✅ Exportación a Excel

### API REST
- ✅ Endpoints completos para CRUD
- ✅ Búsqueda programática
- ✅ Acceso a estadísticas
- ✅ Catálogos (sedes, dependencias)
- ✅ JSON response standardizado
- ✅ Documentación automática

### Interfaz de Usuario
- ✅ Diseño responsivo (mobile, tablet, desktop)
- ✅ Navegación intuitiva
- ✅ Tema profesional con Bootstrap 5
- ✅ Iconografía completa con Bootstrap Icons
- ✅ Alertas y notificaciones visuales
- ✅ Animaciones suaves y transiciones

---

## 📦 Requisitos

- **Python** 3.8 o superior
- **pip** (gestor de paquetes Python)
- **SQLite** (incluido en Python)
- **Navegador moderno** (Chrome, Firefox, Safari, Edge)

### Requisitos opcionales (producción)
- **Nginx** o **Apache** como reverse proxy
- **Gunicorn** o **uWSGI** como servidor WSGI
- **Supervisor** o **systemd** para gestionar proceso
- **SSL/TLS** (certificado Let's Encrypt)

---

## 📥 Instalación

### 1. Clonar o descargar el repositorio

```bash
cd control_patrimonial_web
```

### 2. Crear entorno virtual

```bash
# En Windows
python -m venv venv
venv\Scripts\activate

# En Linux/Mac
python3 -m venv venv
source venv/bin/activate
```

### 3. Instalar dependencias

```bash
pip install -r requirements.txt
```

### 4. Configurar variables de entorno

```bash
# Copiar archivo de ejemplo
cp .env.example .env

# Editar .env con tus valores
# Generar una SECRET_KEY segura:
python -c "import secrets; print(secrets.token_hex(32))"
```

### 5. Preparar base de datos

La base de datos SQLite se crea automáticamente al ejecutar la aplicación si no existe.

```bash
# Opcional: verificar estructura
python
>>> from app.models import Repo
>>> # La BD será creada en data/inventario_patrimonial.db
```

---

## ⚙️ Configuración

### Archivo `.env`

```env
# Entorno
FLASK_ENV=development           # o 'production'
DEBUG=True                      # False en producción

# Seguridad
SECRET_KEY=your-secret-key-here # Cambiar en producción
SESSION_COOKIE_SECURE=False     # True en producción con HTTPS
REMEMBER_COOKIE_SECURE=False    # True en producción con HTTPS

# Logging
LOG_LEVEL=INFO                  # DEBUG, INFO, WARNING, ERROR

# Servidor
HOST=0.0.0.0                    # 127.0.0.1 para local
PORT=5000
```

### Configuración por Entorno

**Desarrollo** (`FLASK_ENV=development`):
- Debug activo
- CSRF habilitado pero más flexible
- Logs en consola

**Producción** (`FLASK_ENV=production`):
- Debug desactivo
- HTTPS requerido
- Cookies seguras
- Logs a archivo

**Testing** (`FLASK_ENV=testing`):
- BD en memoria
- CSRF deshabilitado
- Configuración de pruebas

---

## 🚀 Ejecución

### Desarrollo Local

```bash
# Activar entorno virtual
# En Windows: venv\Scripts\activate
# En Linux/Mac: source venv/bin/activate

# Ejecutar aplicación
python run.py
```

Accede a `http://localhost:5000`

**Credenciales de prueba**:
- Usuario: admin
- Contraseña: (la que esté en la base de datos)

### Producción con Gunicorn

```bash
# Instalar Gunicorn
pip install gunicorn

# Ejecutar con múltiples workers
gunicorn -w 4 -b 0.0.0.0:5000 "app:create_app()"

# Alternativamente, con configuración
gunicorn -c gunicorn_config.py
```

### Con Supervisor (Linux)

Crear archivo `/etc/supervisor/conf.d/control_patrimonial.conf`:

```ini
[program:control_patrimonial]
directory=/home/usuario/control_patrimonial_web
command=/home/usuario/control_patrimonial_web/venv/bin/gunicorn -w 4 -b 127.0.0.1:5000 "app:create_app()"
user=www-data
autostart=true
autorestart=true
redirect_stderr=true
stdout_logfile=/var/log/control_patrimonial.log
```

---

## 📁 Estructura del Proyecto

```
control_patrimonial_web/
├── app/
│   ├── api/                          # API REST
│   │   ├── __init__.py
│   │   └── routes.py                 # Endpoints de API
│   ├── auth/                         # Autenticación
│   │   ├── __init__.py
│   │   └── routes.py                 # Login, logout
│   ├── main/                         # Rutas principales
│   │   ├── __init__.py
│   │   └── routes.py                 # Dashboard, bienes, estadísticas
│   ├── templates/
│   │   ├── base.html                 # Template base
│   │   ├── auth/
│   │   │   └── login.html            # Página de login
│   │   ├── errors/                   # Páginas de error
│   │   │   ├── 403.html
│   │   │   ├── 404.html
│   │   │   └── 500.html
│   │   └── main/
│   │       ├── dashboard.html        # Listado de bienes
│   │       ├── form_bien.html        # Formulario crear/editar
│   │       ├── estadisticas.html     # Estadísticas
│   │       ├── usuarios.html         # Gestión de usuarios
│   │       └── chat.html             # Búsqueda inteligente
│   ├── __init__.py                   # Factory y configuración Flask
│   ├── models.py                     # Modelos de datos
│   └── utils.py                      # Funciones utilitarias
├── data/
│   └── inventario_patrimonial.db     # Base de datos SQLite
├── logs/                             # Archivos de log
├── .env                              # Variables de entorno (no subir)
├── .env.example                      # Plantilla de .env
├── .gitignore                        # Configuración Git
├── config.py                         # Configuración por entorno
├── run.py                            # Script de ejecución
├── requirements.txt                  # Dependencias Python
├── README.md                         # Este archivo
├── MEJORAS_IMPLEMENTADAS.md          # Documento de mejoras
└── ANALISIS_Y_MEJORAS.md            # Análisis inicial
```

---

## 🔌 API REST

### Autenticación

Todos los endpoints requieren estar autenticado (excepto `/api/health`).

### Endpoints

#### Bienes
```
GET    /api/bienes?page=1&per_page=20&q=busca
POST   /api/bienes
GET    /api/bienes/<id>
PUT    /api/bienes/<id>
```

#### Estadísticas
```
GET    /api/estadisticas
GET    /api/estadisticas/progreso
```

#### Catálogos
```
GET    /api/sedes
GET    /api/dependencias
```

#### Búsqueda
```
POST   /api/buscar
```

#### Usuario
```
GET    /api/me
```

#### Salud
```
GET    /api/health
```

### Ejemplo de Uso

```javascript
// Obtener lista de bienes
fetch('/api/bienes?page=1&per_page=10', {
  headers: {
    'X-CSRFToken': document.querySelector('meta[name="csrf-token"]').content
  }
})
.then(r => r.json())
.then(data => console.log(data.data.bienes));

// Crear bien
fetch('/api/bienes', {
  method: 'POST',
  headers: {
    'X-CSRFToken': document.querySelector('meta[name="csrf-token"]').content,
    'Content-Type': 'application/json'
  },
  body: JSON.stringify({
    codigo_patrimonial: 'CP-001',
    denominacion: 'Escritorio',
    sede: 1,
    estado: 'b'
  })
})
.then(r => r.json())
.then(data => console.log(data));
```

---

## 🔒 Seguridad

### Medidas Implementadas

1. **CSRF Protection**: Token automático en formularios
2. **XSS Prevention**: Sanitización de entrada, CSP headers
3. **SQL Injection**: Prepared statements y ORM-like access
4. **Session Security**: Cookies HttpOnly, SameSite, Secure
5. **Authentication**: Hashing de contraseñas, rate limiting
6. **Logging**: Auditoría completa de acciones

### Checklist Seguridad

- [ ] Cambiar `SECRET_KEY` en producción
- [ ] Usar HTTPS con certificado SSL válido
- [ ] Configurar `SESSION_COOKIE_SECURE=True`
- [ ] Habilitar `HSTS` (Strict-Transport-Security)
- [ ] Revisar permisos de archivos
- [ ] Implementar rate limiting en producción
- [ ] Configurar backups automáticos
- [ ] Monitorear logs regularmente
- [ ] Actualizar dependencias periódicamente
- [ ] Hacer auditoría de seguridad antes de producción

### Vulnerabilidades Conocidas

Ninguna conocida en la versión actual.

Reportar vulnerabilidades de manera responsable.

---

## 🐛 Troubleshooting

### Problema: "ModuleNotFoundError: No module named 'flask'"

**Solución**:
```bash
# Asegurar que el entorno virtual esté activado
pip install -r requirements.txt
```

### Problema: "Permission denied" en Linux

**Solución**:
```bash
chmod +x run.py
sudo chown -R www-data:www-data /var/www/control_patrimonial
```

### Problema: Página en blanco sin cargar CSS/JS

**Solución**:
1. Limpiar caché del navegador
2. Revisar consola del navegador para errores
3. Verificar que CDN de Bootstrap sea accesible

### Problema: Base de datos corrupta

**Solución**:
```bash
# Backup
cp data/inventario_patrimonial.db data/inventario_patrimonial.db.backup

# Recrear (cuidado: pierde datos)
rm data/inventario_patrimonial.db

# Reiniciar aplicación
python run.py
```

---

## 📞 Soporte

Para problemas o preguntas:

1. Revisar archivo de logs: `logs/app.log`
2. Activar `DEBUG=True` en `.env`
3. Consultar documentación en `MEJORAS_IMPLEMENTADAS.md`
4. Contactar al equipo de desarrollo

---

## 📄 Licencia

MIT License - Ver LICENSE file para detalles

---

## 👥 Contribuciones

Las contribuciones son bienvenidas. Para cambios mayores:

1. Fork el repositorio
2. Crear rama para tu feature (`git checkout -b feature/AmazingFeature`)
3. Commit tus cambios (`git commit -m 'Add some AmazingFeature'`)
4. Push a la rama (`git push origin feature/AmazingFeature`)
5. Abrir Pull Request

---

## 🎯 Roadmap

### v2.0 (Próximo)
- [ ] Panel de administración mejorado
- [ ] Importación de datos desde Excel
- [ ] Reportes en PDF
- [ ] Notificaciones por email
- [ ] Autenticación LDAP/AD

### v3.0 (Futuro)
- [ ] Aplicación móvil
- [ ] Sincronización en tiempo real
- [ ] Código QR/Barcode scanning
- [ ] Integración con sistemas ERP
- [ ] Analytics avanzado

---

## 📝 Changelog

### v1.1 (26 Nov 2025)
- ✨ Mejoras de seguridad
- 🎨 Nuevo diseño UI
- 🔌 API REST completa
- 📝 Logging completo
- 📚 Documentación mejorada

### v1.0 (Inicial)
- Autenticación básica
- CRUD de bienes
- Estadísticas
- Dashboard

---

**Hecho con ❤️ para el Distrito Fiscal del Callao**
