"""
Configuración de Gunicorn para Producción

Archivo de configuración para Gunicorn que optimiza el rendimiento
y la seguridad de la aplicación Flask en producción.

Uso:
    gunicorn --config gunicorn_config.py wsgi:app

O si está en el mismo directorio:
    gunicorn -c gunicorn_config.py wsgi:app
"""

import multiprocessing
import os

# ===== BINDING =====
# Puerto y dirección donde escucha Gunicorn
# Cloud Run pasa el puerto en la variable PORT (por defecto 8080)
port = os.environ.get('PORT', '8080')
bind = os.environ.get('GUNICORN_BIND', f'0.0.0.0:{port}')
backlog = 2048

# ===== WORKERS =====
# Número de procesos workers
# Recomendación: (2 x núcleos) + 1
workers = int(os.environ.get('GUNICORN_WORKERS', multiprocessing.cpu_count() * 2 + 1))
worker_class = 'sync'
worker_connections = 1000
timeout = 120
keepalive = 5

# ===== LOGGING =====
# Archivos de logs
accesslog = '-'
errorlog = '-'
loglevel = os.environ.get('GUNICORN_LOG_LEVEL', 'info')
access_log_format = '%(h)s %(l)s %(u)s %(t)s "%(r)s" %(s)s %(b)s "%(f)s" "%(a)s" %(D)s'

# ===== PROCESS NAMING =====
proc_name = 'control_patrimonial'

# ===== SERVER MECHANICS =====
daemon = False
pidfile = 'logs/gunicorn.pid'
umask = 0o022
user = None
group = None
tmp_upload_dir = None

# ===== SSL (Opcional) =====
# Habilitar si usas HTTPS directo con Gunicorn
# keyfile = '/ruta/a/keyfile.pem'
# certfile = '/ruta/a/certfile.pem'

# ===== HEADERS =====
# Raw env vars pasadas a la aplicación
raw_env = [
    'FLASK_ENV=production',
]

# ===== CALLBACKS =====
def when_ready(server):
    """Callback cuando Gunicorn está listo"""
    print(f'Gunicorn iniciado con {workers} workers')
    print(f'Escuchando en {bind}')

def on_starting(server):
    """Callback al iniciar Gunicorn"""
    # Log directory creation removed for Cloud Run compatibility
    pass

# ===== NOTAS DE CONFIGURACIÓN =====
#
# PERFORMANCE:
# - workers: Número de procesos (2 x CPU + 1)
# - worker_class: 'sync' para mayoría de apps
# - keepalive: Tiempo de conexión viva (segundos)
#
# SEGURIDAD:
# - bind: 127.0.0.1 si está detrás de Nginx
# - bind: 0.0.0.0 si está expuesto directamente (NO recomendado)
# - Usar SSL/TLS con certificados válidos
#
# LOGGING:
# - Mantener logs en directorio accesible
# - Rotar logs regularmente (usar logrotate)
#
# MONITOREO:
# - Monitorear uso de CPU y memoria
# - Alertas si workers mueren
# - Health checks: /health o similar
#
# VARIABLES DE ENTORNO (opcional):
# GUNICORN_WORKERS=4
# GUNICORN_BIND=0.0.0.0:8000
# GUNICORN_ACCESS_LOG=/var/log/gunicorn/access.log
# GUNICORN_ERROR_LOG=/var/log/gunicorn/error.log
