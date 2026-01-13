#!/bin/bash

###############################################################################
# Script de Setup - PostgreSQL para Control Patrimonial
#
# Este script instala y configura PostgreSQL en Ubuntu/Debian para producción.
# ADVERTENCIA: Este script requiere acceso sudo.
#
# Uso:
#   bash setup_postgres.sh
#
# O:
#   sudo bash setup_postgres.sh
###############################################################################

set -e  # Salir si hay error

# Colores
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}=== Setup PostgreSQL para Control Patrimonial ===${NC}"
echo ""

# Verificar que se ejecuta como sudo
if [ "$EUID" -ne 0 ]; then
   echo -e "${RED}Este script debe ejecutarse con sudo${NC}"
   echo "Uso: sudo bash setup_postgres.sh"
   exit 1
fi

# 1. Actualizar paquetes del sistema
echo -e "${GREEN}1. Actualizando paquetes del sistema...${NC}"
apt-get update
apt-get upgrade -y

# 2. Instalar PostgreSQL
echo -e "${GREEN}2. Instalando PostgreSQL...${NC}"
apt-get install -y postgresql postgresql-contrib postgresql-client

# 3. Iniciar servicio PostgreSQL
echo -e "${GREEN}3. Iniciando servicio PostgreSQL...${NC}"
systemctl start postgresql
systemctl enable postgresql  # Auto-iniciar al boot

# 4. Crear usuario y base de datos
echo -e "${GREEN}4. Creando usuario y base de datos...${NC}"
echo ""
echo -e "${YELLOW}NOTA: Se creará un usuario 'control_patrimonial' con contraseña segura${NC}"
echo ""

# Generar contraseña segura
DB_PASSWORD=$(openssl rand -base64 32)

# Crear usuario
sudo -u postgres psql <<EOF
CREATE USER control_patrimonial WITH ENCRYPTED PASSWORD '$DB_PASSWORD';
EOF

# Crear base de datos
sudo -u postgres psql <<EOF
CREATE DATABASE control_patrimonial OWNER control_patrimonial;
EOF

# Configurar permisos
sudo -u postgres psql <<EOF
ALTER ROLE control_patrimonial SET client_encoding TO 'utf8';
ALTER ROLE control_patrimonial SET default_transaction_isolation TO 'read committed';
ALTER ROLE control_patrimonial SET default_transaction_deferrable TO on;
ALTER ROLE control_patrimonial SET timezone TO 'UTC';
GRANT ALL PRIVILEGES ON DATABASE control_patrimonial TO control_patrimonial;
EOF

# 5. Configurar pg_hba.conf para permitir conexiones locales
echo -e "${GREEN}5. Configurando pg_hba.conf...${NC}"
PG_VERSION=$(sudo -u postgres psql --version | awk '{print $3}' | cut -d. -f1)
PG_CONFIG_DIR="/etc/postgresql/${PG_VERSION}/main"

# Hacer backup
cp "$PG_CONFIG_DIR/pg_hba.conf" "$PG_CONFIG_DIR/pg_hba.conf.backup"

# Agregar línea para conexión local (si no existe)
if ! grep -q "local   control_patrimonial" "$PG_CONFIG_DIR/pg_hba.conf"; then
    echo "local   control_patrimonial      control_patrimonial                     md5" >> "$PG_CONFIG_DIR/pg_hba.conf"
fi

# Recargar configuración
systemctl reload postgresql

# 6. Mostrar información de conexión
echo ""
echo -e "${GREEN}=== CONFIGURACIÓN COMPLETADA ===${NC}"
echo ""
echo -e "${BLUE}Información de conexión:${NC}"
echo "  Usuario: control_patrimonial"
echo "  Contraseña: $DB_PASSWORD"
echo "  Host: localhost"
echo "  Puerto: 5432"
echo "  Base de datos: control_patrimonial"
echo ""

# 7. Generar URL de conexión
DATABASE_URL="postgresql://control_patrimonial:$DB_PASSWORD@localhost:5432/control_patrimonial"
echo -e "${BLUE}URL de conexión:${NC}"
echo "$DATABASE_URL"
echo ""

# 8. Crear archivo .env con configuración
echo -e "${GREEN}6. Creando archivo .env...${NC}"
if [ -f ".env" ]; then
    echo -e "${YELLOW}Advertencia: .env ya existe, no se sobrescribe${NC}"
else
    cat > .env <<EOF
# Control Patrimonial - Configuración de Producción
FLASK_ENV=production
SECRET_KEY=$(python3 -c "import secrets; print(secrets.token_hex(32))")
DATABASE_URL=$DATABASE_URL
LOG_LEVEL=INFO
SESSION_COOKIE_SECURE=True
SESSION_COOKIE_HTTPONLY=True
REMEMBER_COOKIE_SECURE=True
REMEMBER_COOKIE_HTTPONLY=True
EOF
    chmod 600 .env
    echo -e "${GREEN}Archivo .env creado con permisos 600${NC}"
fi

# 9. Verificar conexión
echo ""
echo -e "${GREEN}7. Verificando conexión...${NC}"
PGPASSWORD="$DB_PASSWORD" psql -U control_patrimonial -d control_patrimonial -h localhost -c "SELECT version();" && echo -e "${GREEN}Conexión exitosa${NC}" || echo -e "${RED}Error en conexión${NC}"

# 10. Información final
echo ""
echo -e "${GREEN}=== PRÓXIMOS PASOS ===${NC}"
echo ""
echo "1. Editar .env con valores reales si es necesario:"
echo "   nano .env"
echo ""
echo "2. Crear estructura de tablas (si no existe):"
echo "   flask db upgrade"
echo ""
echo "3. Migrar datos de SQLite a PostgreSQL (si aplica):"
echo "   python migrate_to_postgres.py"
echo ""
echo "4. Iniciar la aplicación:"
echo "   bash start_production.sh"
echo ""
echo -e "${BLUE}IMPORTANTE:${NC}"
echo "- Cambiar SECRET_KEY en .env"
echo "- Cambiar PASSWORD de PostgreSQL"
echo "- No compartir .env"
echo "- Hacer backup regular de la BD"
echo ""
echo -e "${GREEN}Setup completado${NC}"
