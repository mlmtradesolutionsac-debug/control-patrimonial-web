#!/bin/bash
set -e

# ==========================================
# Script de Despliegue - Control Patrimonial
# Google Cloud Run + Cloud SQL PostgreSQL
# ==========================================

# Configuración
PROJECT_ID="steam-outlet-480502-d7"
REGION="us-central1"
SERVICE_NAME="control-patrimo-web"
CLOUD_SQL_INSTANCE="$PROJECT_ID:$REGION:patrimonial-db"
SERVICE_ACCOUNT="cloud-run-sa@$PROJECT_ID.iam.gserviceaccount.com"

echo "=========================================="
echo "DESPLIEGUE: Control Patrimonial"
echo "=========================================="
echo "Proyecto:     $PROJECT_ID"
echo "Región:       $REGION"
echo "Servicio:     $SERVICE_NAME"
echo "Cloud SQL:    $CLOUD_SQL_INSTANCE"
echo "=========================================="

# Paso 1: Construir imagen en Cloud Build
echo ""
echo "[1/2] Construyendo imagen Docker en Cloud Build..."
gcloud builds submit --tag gcr.io/$PROJECT_ID/$SERVICE_NAME

# Paso 2: Desplegar a Cloud Run CON configuración completa
echo ""
echo "[2/2] Desplegando en Cloud Run..."
gcloud run deploy $SERVICE_NAME \
  --image gcr.io/$PROJECT_ID/$SERVICE_NAME \
  --platform managed \
  --region $REGION \
  --allow-unauthenticated \
  --memory 1024Mi \
  --cpu 1 \
  --timeout 120s \
  --add-cloudsql-instances $CLOUD_SQL_INSTANCE \
  --set-env-vars \
    "FLASK_ENV=production,\
CLOUD_SQL_CONNECTION_NAME=$CLOUD_SQL_INSTANCE,\
DB_USER=control_patrimonial,\
DB_NAME=control_patrimonial,\
LOG_LEVEL=INFO" \
  --set-secrets \
    "SECRET_KEY=SECRET_KEY:latest,\
DB_PASSWORD=db-password:latest" \
  --service-account $SERVICE_ACCOUNT \
  --health-initial-delay 30s \
  --health-timeout 5s \
  --health-check-http /health \
  --health-check-interval 10s

echo ""
echo "=========================================="
echo "✓ DESPLIEGUE COMPLETADO"
echo "=========================================="
echo ""
echo "Obteniendo URL del servicio..."
URL=$(gcloud run services describe $SERVICE_NAME --region $REGION --format='value(status.url)')
echo "URL: $URL"
echo ""
echo "Verificar health check:"
echo "  curl $URL/health"
echo ""
echo "Ver logs en tiempo real:"
echo "  gcloud run logs read $SERVICE_NAME --region $REGION --limit 50 -f"
