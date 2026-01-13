#!/bin/bash

# Script para ejecutar migraciones en Cloud Run vía API

API_URL="https://control-patrimonial-195522615542.us-central1.run.app"
ADMIN_USER="admin"
ADMIN_PASS="admin"
COOKIES="/tmp/cookies.txt"

echo "================================"
echo "Ejecutar Migraciones en Cloud SQL"
echo "================================"

# Paso 1: Hacer login y obtener cookie de sesión
echo -e "\n[1/3] Autenticando como admin..."

curl -s -c $COOKIES \
  -X POST "$API_URL/auth/login" \
  -d "username=$ADMIN_USER&password=$ADMIN_PASS" \
  -L > /dev/null

if [ $? -eq 0 ]; then
    echo "[OK] Autenticación exitosa"
else
    echo "[ERROR] Error al autenticarse"
    exit 1
fi

# Paso 2: Obtener CSRF token de la página de migraciones
echo -e "\n[2/3] Obteniendo CSRF token..."

CSRF=$(curl -s -b $COOKIES "$API_URL/admin/" | grep -oP 'csrf_token.*?value="\K[^"]+' | head -1)

if [ -z "$CSRF" ]; then
    echo "[ADVERTENCIA] No se pudo obtener CSRF token, intentando sin él..."
    CSRF="none"
fi

# Paso 3: Ejecutar migraciones vía API
echo -e "\n[3/3] Ejecutando migraciones..."

curl -s -b $COOKIES -X POST "$API_URL/api/admin/run-migrations" \
  -H "Content-Type: application/json" \
  -H "X-CSRFToken: $CSRF" \
  -d "{}" | python -m json.tool

echo -e "\n================================"
echo "Proceso completado"
echo "================================"

# Limpiar cookies
rm -f $COOKIES
