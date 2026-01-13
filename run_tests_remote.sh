#!/bin/bash
# Script para ejecutar tests en servidor remoto: 10.28.106.250

set -e

echo "================================"
echo "Ejecutando Tests en Servidor"
echo "IP: 10.28.106.250"
echo "Usuario: patrimonio"
echo "================================"
echo ""

# Variables
REMOTE_HOST="10.28.106.250"
REMOTE_USER="patrimonio"
REMOTE_PASSWORD="T1C050p06769077"
REMOTE_PATH="/home/patrimonio/control_patrimonial"

# 1. Conectar y verificar estructura
echo "1️⃣ Verificando conexión al servidor..."
plink -pw ${REMOTE_PASSWORD} -l ${REMOTE_USER} ${REMOTE_HOST} "cd ${REMOTE_PATH} && pwd"
echo "✅ Conexión verificada"
echo ""

# 2. Actualizar tests si hay cambios locales
echo "2️⃣ Sincronizando tests..."
pscp -pw ${REMOTE_PASSWORD} -r "E:\PROYECTOS WEB\control_patrimonial_web\tests\test_*.py" \
  ${REMOTE_USER}@${REMOTE_HOST}:${REMOTE_PATH}/tests/
echo "✅ Tests sincronizados"
echo ""

# 3. Ejecutar tests
echo "3️⃣ Ejecutando tests..."
plink -pw ${REMOTE_PASSWORD} -l ${REMOTE_USER} ${REMOTE_HOST} \
  "cd ${REMOTE_PATH} && source venv/bin/activate && python -m pytest tests/test_auth.py tests/test_api.py tests/test_import_export.py -v --tb=short"
echo ""

# 4. Generar reporte de cobertura
echo "4️⃣ Generando reporte de cobertura..."
plink -pw ${REMOTE_PASSWORD} -l ${REMOTE_USER} ${REMOTE_HOST} \
  "cd ${REMOTE_PATH} && source venv/bin/activate && python -m pytest tests/test_auth.py tests/test_api.py tests/test_import_export.py --cov=app --cov-report=term-missing"
echo ""

echo "================================"
echo "✅ Pruebas completadas"
echo "================================"
