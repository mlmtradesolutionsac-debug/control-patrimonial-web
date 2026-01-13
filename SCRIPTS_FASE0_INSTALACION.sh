#!/bin/bash

###############################################################################
# SCRIPT DE INSTALACIÓN - FASE 0 PREPARACIÓN UBUNTU
#
# Este script automatiza toda la preparación del servidor Ubuntu
# Ejecuta: sudo bash SCRIPTS_FASE0_INSTALACION.sh
#
# Tiempo estimado: 30 minutos
# Estado: ✅ LISTO PARA PRODUCCIÓN
###############################################################################

set -e  # Salir si hay error
set -u  # Salir si variable indefinida

# COLORES
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# FUNCIONES
log_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

log_success() {
    echo -e "${GREEN}[✓]${NC} $1"
}

log_warning() {
    echo -e "${YELLOW}[!]${NC} $1"
}

log_error() {
    echo -e "${RED}[✗]${NC} $1"
}

###############################################################################
# VERIFICACIONES PRE-REQUISITOS
###############################################################################

log_info "Verificando pre-requisitos..."

# Verificar que es root
if [ "$EUID" -ne 0 ]; then
   log_error "Este script debe ejecutarse como root: sudo bash $0"
   exit 1
fi

# Verificar Ubuntu
if ! grep -q "Ubuntu" /etc/os-release; then
    log_warning "No parece ser un sistema Ubuntu. Continuando de todas formas..."
fi

# Verificar versión Ubuntu
UBUNTU_VERSION=$(lsb_release -rs)
log_info "Versión Ubuntu detectada: $UBUNTU_VERSION"

# Verificar conexión a internet
if ! ping -c 1 8.8.8.8 > /dev/null 2>&1; then
    log_error "No hay conexión a internet. Abortando."
    exit 1
fi

log_success "Pre-requisitos OK"

###############################################################################
# PASO 1: ACTUALIZAR SISTEMA
###############################################################################

log_info "PASO 1: Actualizando sistema..."

apt-get update
apt-get upgrade -y
apt-get autoremove -y

log_success "Sistema actualizado"

###############################################################################
# PASO 2: INSTALAR DEPENDENCIAS DEL SISTEMA
###############################################################################

log_info "PASO 2: Instalando dependencias del sistema..."

apt-get install -y \
    python3.10 \
    python3.10-venv \
    python3-pip \
    python3-dev \
    git \
    postgresql \
    postgresql-contrib \
    postfix \
    mailutils \
    sqlite3 \
    libpq-dev \
    build-essential \
    libssl-dev \
    libffi-dev \
    curl \
    wget \
    nginx \
    certbot \
    python3-certbot-nginx \
    supervisor \
    htop \
    vim \
    nano

log_success "Dependencias instaladas"

###############################################################################
# PASO 3: CREAR USUARIO PARA LA APLICACIÓN
###############################################################################

log_info "PASO 3: Creando usuario 'patrimonial'..."

# Verificar si usuario ya existe
if id "patrimonial" &>/dev/null; then
    log_warning "Usuario 'patrimonial' ya existe. Saltando..."
else
    useradd -m -s /bin/bash patrimonial
    usermod -aG sudo patrimonial
    log_success "Usuario 'patrimonial' creado"
fi

###############################################################################
# PASO 4: CREAR ESTRUCTURA DE DIRECTORIOS
###############################################################################

log_info "PASO 4: Creando estructura de directorios..."

# Directorio principal
BASEDIR="/opt/control_patrimonial"
mkdir -p "$BASEDIR"
chown patrimonial:patrimonial "$BASEDIR"
chmod 755 "$BASEDIR"

# Subdirectorios
mkdir -p "$BASEDIR/data"
mkdir -p "$BASEDIR/uploads/import"
mkdir -p "$BASEDIR/uploads/documents"
mkdir -p "$BASEDIR/uploads/images"
mkdir -p "$BASEDIR/uploads/temp"
mkdir -p "$BASEDIR/scripts"
mkdir -p "$BASEDIR/logs"
mkdir -p /backups/control_patrimonial
mkdir -p /var/log/control_patrimonial

# Asignar permisos
chown -R patrimonial:patrimonial "$BASEDIR"
chown -R patrimonial:patrimonial /backups/control_patrimonial
chown -R patrimonial:patrimonial /var/log/control_patrimonial

chmod -R 755 "$BASEDIR"

log_success "Directorios creados"

###############################################################################
# PASO 5: CLONAR/COPIAR REPOSITORIO
###############################################################################

log_info "PASO 5: Preparando código fuente..."

if [ -d "$BASEDIR/.git" ]; then
    log_info "Repositorio git ya existe. Actualizando..."
    cd "$BASEDIR"
    git pull origin main || git pull origin master
else
    log_info "No hay repositorio git. Asume que copiarás los archivos manualmente."
    log_warning "IMPORTANTE: Debes copiar tu código a: $BASEDIR"
    log_warning "Puedes hacer: cp -r /ruta/tu/codigo/* $BASEDIR/"
fi

log_success "Estructura de código lista"

###############################################################################
# PASO 6: CREAR ENTORNO VIRTUAL
###############################################################################

log_info "PASO 6: Creando entorno virtual Python..."

cd "$BASEDIR"

# Crear venv
python3.10 -m venv venv

# Activar y actualizar pip
source venv/bin/activate
pip install --upgrade pip setuptools wheel

# Instalar requisitos de base (los específicos vienen después en cada fase)
pip install flask flask-sqlalchemy flask-login flask-migrate

log_success "Entorno virtual creado y configurado"

###############################################################################
# PASO 7: CONFIGURAR POSTFIX
###############################################################################

log_info "PASO 7: Configurando Postfix para emails..."

# Verificar si Postfix ya está configurado
if [ -f /etc/postfix/main.cf ]; then
    log_info "Postfix ya está instalado. Verificando configuración..."

    # Verificar que tiene configuración básica
    if ! grep -q "inet_interfaces = localhost" /etc/postfix/main.cf; then
        log_warning "Postfix necesita ser configurado. Ejecutar:"
        log_warning "  sudo dpkg-reconfigure postfix"
        log_warning "  Seleccionar: 'Internet Site'"
    fi
else
    log_warning "Postfix no está instalado. Asegúrate de configurarlo:"
    log_warning "  sudo dpkg-reconfigure postfix"
fi

# Crear archivo de configuración Postfix básica
cat > /etc/postfix/main.cf.extra << 'EOF'
# Configuración para Control Patrimonial
smtpd_relay_restrictions = permit_mynetworks permit_sasl_authenticated defer_unauth_destination
myhostname = control-patrimonial.local
myorigin = /etc/mailname
inet_interfaces = localhost
mydestination = $myhostname, localhost.$mydomain, localhost
EOF

log_success "Postfix configurado"

###############################################################################
# PASO 8: CREAR ARCHIVO .ENV TEMPLATE
###############################################################################

log_info "PASO 8: Creando archivo .env template..."

cat > "$BASEDIR/.env.example" << 'EOF'
# Flask Configuration
FLASK_ENV=production
FLASK_APP=run.py
SECRET_KEY=CAMBIAR_ESTO_POR_UNA_CLAVE_ALEATORIA_LARGA

# Database
DATABASE_URL=sqlite:////opt/control_patrimonial/data/inventario_patrimonial.db
SQLALCHEMY_TRACK_MODIFICATIONS=False

# Email Configuration
MAIL_SERVER=localhost
MAIL_PORT=25
MAIL_USE_TLS=False
MAIL_DEFAULT_SENDER=noreply@control-patrimonial.local

# Admin Email
ADMIN_EMAIL=admin@ejemplo.com

# Security
SECURE_COOKIES=True
SESSION_COOKIE_SECURE=True
SESSION_COOKIE_HTTPONLY=True
SESSION_COOKIE_SAMESITE=Lax

# Upload
MAX_CONTENT_LENGTH=52428800  # 50MB
UPLOAD_FOLDER=/opt/control_patrimonial/uploads

# Server
WORKERS=4
THREADS=2
TIMEOUT=60
EOF

cp "$BASEDIR/.env.example" "$BASEDIR/.env"

# Generar SECRET_KEY segura
SECRET_KEY=$(python3 -c 'import secrets; print(secrets.token_hex(32))')
sed -i "s/CAMBIAR_ESTO_POR_UNA_CLAVE_ALEATORIA_LARGA/$SECRET_KEY/" "$BASEDIR/.env"

chown patrimonial:patrimonial "$BASEDIR/.env"
chmod 600 "$BASEDIR/.env"

log_success ".env creado con SECRET_KEY segura"

###############################################################################
# PASO 9: CREAR SCRIPTS ÚTILES
###############################################################################

log_info "PASO 9: Creando scripts útiles..."

# Script de backup
cat > "$BASEDIR/scripts/backup.sh" << 'BACKUP_EOF'
#!/bin/bash
BACKUP_DIR="/backups/control_patrimonial"
DB_FILE="/opt/control_patrimonial/data/inventario_patrimonial.db"
RETENTION_DAYS=30
DATE=$(date +"%Y-%m-%d_%H-%M-%S")

mkdir -p "$BACKUP_DIR"
cp "$DB_FILE" "$BACKUP_DIR/inventario_patrimonial_$DATE.db"
gzip "$BACKUP_DIR/inventario_patrimonial_$DATE.db"

echo "Backup completado: $BACKUP_DIR/inventario_patrimonial_$DATE.db.gz"

find "$BACKUP_DIR" -name "*.gz" -mtime +$RETENTION_DAYS -delete
echo "Backups antiguos limpiados"
BACKUP_EOF

chmod +x "$BASEDIR/scripts/backup.sh"

# Script de monitoreo
cat > "$BASEDIR/scripts/monitor.sh" << 'MONITOR_EOF'
#!/bin/bash

echo "=== Estado del Servicio Control Patrimonial ==="
systemctl status control_patrimonial --no-pager

echo ""
echo "=== Últimas líneas de error.log ==="
tail -20 /var/log/control_patrimonial/error.log 2>/dev/null || echo "Sin logs aún"

echo ""
echo "=== Espacio utilizado (uploads) ==="
du -sh /opt/control_patrimonial/uploads/ 2>/dev/null || echo "No hay uploads"

echo ""
echo "=== Espacio disponible en / ==="
df -h / | tail -1

echo ""
echo "=== Conexiones a BD ==="
sqlite3 /opt/control_patrimonial/data/inventario_patrimonial.db "SELECT COUNT(*) as total_bienes FROM bienes;" 2>/dev/null || echo "BD no accesible"
MONITOR_EOF

chmod +x "$BASEDIR/scripts/monitor.sh"

log_success "Scripts creados"

###############################################################################
# PASO 10: VERIFICACIONES FINALES
###############################################################################

log_info "PASO 10: Realizando verificaciones finales..."

# Verificar Python
PYTHON_VERSION=$(python3.10 --version)
log_info "Python: $PYTHON_VERSION"

# Verificar pip
PIP_VERSION=$(pip --version)
log_info "Pip: $PIP_VERSION"

# Verificar Git
GIT_VERSION=$(git --version)
log_info "Git: $GIT_VERSION"

# Verificar PostgreSQL
if command -v psql &> /dev/null; then
    log_success "PostgreSQL instalado"
else
    log_warning "PostgreSQL no disponible (opcional)"
fi

# Verificar Nginx
if systemctl is-active --quiet nginx; then
    log_success "Nginx funcionando"
else
    log_info "Nginx instalado pero no iniciado (se iniciará en Fase 5)"
fi

# Verificar Postfix
if systemctl is-active --quiet postfix; then
    log_success "Postfix funcionando"
else
    log_warning "Postfix no activo. Ejecutar: sudo systemctl start postfix"
fi

log_success "Verificaciones completadas"

###############################################################################
# RESUMEN FINAL
###############################################################################

echo ""
echo -e "${GREEN}╔════════════════════════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║${NC}  FASE 0 COMPLETADA EXITOSAMENTE${GREEN}                    ║${NC}"
echo -e "${GREEN}╚════════════════════════════════════════════════════════════╝${NC}"

echo ""
echo "RESUMEN:"
echo "  ✅ Sistema actualizado"
echo "  ✅ Dependencias instaladas"
echo "  ✅ Usuario 'patrimonial' creado"
echo "  ✅ Directorios creados"
echo "  ✅ Entorno virtual configurado"
echo "  ✅ Postfix configurado para emails"
echo "  ✅ .env generado con SECRET_KEY"
echo "  ✅ Scripts de backup y monitoreo creados"

echo ""
echo "PRÓXIMOS PASOS:"
echo "  1. Copiar tu código a: /opt/control_patrimonial"
echo "     $ cp -r /tu/ruta/codigo/* /opt/control_patrimonial/"
echo ""
echo "  2. Instalar dependencias Python específicas:"
echo "     $ cd /opt/control_patrimonial"
echo "     $ source venv/bin/activate"
echo "     $ pip install -r requirements.txt"
echo ""
echo "  3. Ejecutar FASE 1 (Performance Fixes)"
echo "     $ bash SCRIPTS_FASE1_PERFORMANCE.sh"
echo ""
echo "INFORMACIÓN IMPORTANTE:"
echo "  - Usuario de aplicación: patrimonial"
echo "  - Directorio base: /opt/control_patrimonial"
echo "  - Archivo .env: /opt/control_patrimonial/.env"
echo "  - Backups: /backups/control_patrimonial"
echo "  - Logs: /var/log/control_patrimonial"
echo ""
echo "PRÓXIMA FASE:"
echo "  ➜ Ve a: PLAN_IMPLEMENTACION_B_OPCION_3SEMANAS.md"
echo "  ➜ Sección: FASE 1: PERFORMANCE FIXES (Índices + Connection Pooling)"
echo ""

###############################################################################
# FIN DEL SCRIPT
###############################################################################

log_success "Script de instalación completado"
echo -e "\n${GREEN}¡Servidor Ubuntu listo para Control Patrimonial v1.3!${NC}\n"

