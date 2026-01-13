#!/bin/bash
#
# Script de Actualización Automática - Control Patrimonial
#
# Uso: ./update-server.sh
#
# Este script:
# 1. Descarga los últimos cambios de git
# 2. Actualiza dependencias si es necesario
# 3. Ejecuta migraciones de BD si existen
# 4. Reinicia la aplicación
# 5. Verifica que el sistema esté funcionando
#
# Requiere: ssh en el servidor, permisos sudo para systemctl
#

set -e  # Salir si hay algún error

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Variables
APP_DIR="/opt/control_patrimonial"  # Cambiar según ruta del servidor
SERVICE_NAME="control_patrimonial"
LOG_FILE="/var/log/control_patrimonial/update.log"
BACKUP_DIR="/backups/control_patrimonial"

# Timestamp para logs
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

# Función para logging
log_info() {
    echo -e "${BLUE}[${TIMESTAMP}]${NC} ℹ️  $1" | tee -a "$LOG_FILE"
}

log_success() {
    echo -e "${GREEN}[${TIMESTAMP}]${NC} ✅ $1" | tee -a "$LOG_FILE"
}

log_warning() {
    echo -e "${YELLOW}[${TIMESTAMP}]${NC} ⚠️  $1" | tee -a "$LOG_FILE"
}

log_error() {
    echo -e "${RED}[${TIMESTAMP}]${NC} ❌ $1" | tee -a "$LOG_FILE"
}

# Header
echo -e "${BLUE}"
echo "═══════════════════════════════════════════════════════"
echo "  Control Patrimonial - Script de Actualización"
echo "═══════════════════════════════════════════════════════"
echo -e "${NC}"

log_info "Iniciando proceso de actualización..."

# Validar que estamos en la carpeta correcta
if [ ! -d "$APP_DIR" ]; then
    log_error "Directorio $APP_DIR no encontrado"
    exit 1
fi

cd "$APP_DIR"
log_success "Directorio verificado: $APP_DIR"

# ==================== PASO 1: DESCARGAR CAMBIOS ====================
log_info "📥 Descargando cambios de repositorio..."
if git pull origin main > /dev/null 2>&1; then
    log_success "Cambios descargados correctamente"
else
    log_error "Error al descargar cambios. Verifica conexión a git."
    exit 1
fi

# ==================== PASO 2: ACTUALIZAR DEPENDENCIAS ====================
log_info "📦 Verificando dependencias..."
if pip install -r requirements.prod.txt --quiet 2>/dev/null; then
    log_success "Dependencias actualizadas"
else
    log_warning "Error actualizando dependencias (no crítico)"
fi

# ==================== PASO 3: EJECUTAR MIGRACIONES ====================
log_info "🗄️  Ejecutando migraciones de base de datos..."
if flask db upgrade 2>/dev/null; then
    log_success "Migraciones ejecutadas"
else
    log_warning "Sin migraciones pendientes"
fi

# ==================== PASO 4: HACER BACKUP DE BD ====================
log_info "💾 Creando backup de base de datos..."
mkdir -p "$BACKUP_DIR"
BACKUP_FILE="$BACKUP_DIR/backup_$(date +%Y%m%d_%H%M%S).sql.gz"

if pg_dump control_patrimonial | gzip > "$BACKUP_FILE" 2>/dev/null; then
    log_success "Backup creado: $BACKUP_FILE"
    # Mantener solo últimos 10 backups
    ls -t "$BACKUP_DIR"/backup_*.sql.gz | tail -n +11 | xargs -r rm
else
    log_warning "No se pudo crear backup (base de datos no disponible)"
fi

# ==================== PASO 5: DETENER APLICACIÓN ====================
log_info "🛑 Deteniendo aplicación..."
if sudo systemctl stop "$SERVICE_NAME" 2>/dev/null; then
    log_success "Aplicación detenida"
    sleep 2
else
    log_warning "No se pudo detener el servicio (continuando...)"
fi

# ==================== PASO 6: LIMPIAR CACHE ====================
log_info "🧹 Limpiando cache..."
find . -type d -name __pycache__ -exec rm -rf {} + 2>/dev/null || true
find . -type f -name "*.pyc" -delete 2>/dev/null || true
log_success "Cache limpiado"

# ==================== PASO 7: REINICIAR APLICACIÓN ====================
log_info "🔁 Reiniciando aplicación..."
if sudo systemctl start "$SERVICE_NAME" 2>/dev/null; then
    log_success "Aplicación reiniciada"
else
    log_error "Error al reiniciar la aplicación"
    exit 1
fi

# Esperar a que se inicie
sleep 3

# ==================== PASO 8: VERIFICAR SALUD ====================
log_info "✅ Verificando salud del sistema..."
HEALTH_CHECK=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:8000/api/health 2>/dev/null || echo "000")

if [ "$HEALTH_CHECK" = "200" ]; then
    log_success "Sistema funcionando correctamente"
else
    log_error "Health check falló (código: $HEALTH_CHECK)"
    log_warning "Revisa los logs: journalctl -u $SERVICE_NAME -n 50"
    exit 1
fi

# ==================== RESUMEN FINAL ====================
echo ""
echo -e "${GREEN}═══════════════════════════════════════════════════════"
echo "  ✨ ¡Actualización Completada Exitosamente!"
echo "═══════════════════════════════════════════════════════${NC}"
echo ""
echo -e "📝 Versión actual:"
git describe --tags --always 2>/dev/null || echo "  Sin versión etiquetada"
echo ""
echo -e "📊 Último commit:"
git log -1 --pretty=format:"  %h - %s (%an, %ar)" 2>/dev/null
echo ""
echo -e "🔗 URL: http://tu-dominio.com"
echo -e "📋 Logs: tail -f /var/log/control_patrimonial/app.log"
echo ""

log_success "Proceso de actualización completado en $(date '+%Y-%m-%d %H:%M:%S')"
