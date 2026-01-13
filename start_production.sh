#!/bin/bash

###############################################################################
# Script de Inicio de Control Patrimonial en Producción
#
# Este script inicia la aplicación Flask usando Gunicorn en producción.
# Asume que PostgreSQL está instalado y la BD ya está configurada.
#
# Uso:
#   bash start_production.sh
#
# O hacerlo ejecutable:
#   chmod +x start_production.sh
#   ./start_production.sh
###############################################################################

set -e  # Salir si hay error

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${GREEN}=== Control Patrimonial - Inicio en Producción ===${NC}"
echo ""

# 1. Verificar que estamos en el directorio correcto
if [ ! -f "wsgi.py" ]; then
    echo -e "${RED}ERROR: wsgi.py no encontrado${NC}"
    echo "Ejecuta este script desde la raíz del proyecto"
    exit 1
fi

# 2. Verificar que el entorno virtual existe
if [ ! -d "venv" ]; then
    echo -e "${YELLOW}Entorno virtual no encontrado, creando...${NC}"
    python3 -m venv venv
fi

# 3. Activar entorno virtual
echo -e "${GREEN}Activando entorno virtual...${NC}"
source venv/bin/activate

# 4. Instalar/actualizar dependencias de producción
echo -e "${GREEN}Instalando dependencias...${NC}"
pip install -r requirements.prod.txt

# 5. Cargar variables de entorno
if [ -f ".env" ]; then
    echo -e "${GREEN}Cargando variables de entorno...${NC}"
    set -a
    source .env
    set +a
else
    echo -e "${YELLOW}Advertencia: archivo .env no encontrado${NC}"
    echo "Asegúrate de configurar las variables de entorno requeridas:"
    echo "  - FLASK_ENV=production"
    echo "  - DATABASE_URL=postgresql://user:pass@localhost/control_patrimonial"
    echo "  - SECRET_KEY=tu_clave_secreta_aqui"
fi

# 6. Crear directorio de logs si no existe
if [ ! -d "logs" ]; then
    echo -e "${GREEN}Creando directorio de logs...${NC}"
    mkdir -p logs
fi

# 7. Verificar conexión a PostgreSQL
echo -e "${GREEN}Verificando conexión a PostgreSQL...${NC}"
python3 -c "
import psycopg2
import os
try:
    db_url = os.environ.get('DATABASE_URL', 'postgresql://localhost/control_patrimonial')
    # Parsear URL simple
    conn = psycopg2.connect(db_url)
    conn.close()
    print('OK: Conexión a PostgreSQL exitosa')
except Exception as e:
    print(f'ERROR: No se puede conectar a PostgreSQL: {e}')
    exit(1)
" || exit 1

# 8. Ejecutar migraciones de BD
echo -e "${GREEN}Ejecutando migraciones de BD...${NC}"
flask db upgrade || true

# 9. Mostrar información de inicio
echo ""
echo -e "${GREEN}=== CONFIGURACIÓN ===${NC}"
echo "Directorio: $(pwd)"
echo "Entorno: $FLASK_ENV"
echo "Base de datos: $DATABASE_URL"
echo "Gunicorn workers: $(python -c "import multiprocessing; print(multiprocessing.cpu_count() * 2 + 1)")"
echo ""

# 10. Iniciar Gunicorn
echo -e "${GREEN}Iniciando Gunicorn...${NC}"
echo "Presiona Ctrl+C para detener"
echo ""

# Limpiar archivo PID anterior si existe
rm -f logs/gunicorn.pid

# Iniciar con configuración
gunicorn --config gunicorn_config.py wsgi:app --daemon

# Nota: El script se detiene aquí hasta que Gunicorn se cierre

echo ""
echo -e "${GREEN}Control Patrimonial detenido${NC}"
