# Script de Despliegue para Google Cloud Run (PowerShell)

# 1. Configuración de Variables
$PROJECT_ID = "steam-outlet-480502-d7"
$REGION = "us-central1"
$SERVICE_NAME = "control-patrimo-web"

Write-Host "=== Iniciando Despliegue a Google Cloud Run ===" -ForegroundColor Cyan
Write-Host "Proyecto: $PROJECT_ID"
Write-Host "Región: $REGION"
Write-Host "Servicio: $SERVICE_NAME"
Write-Host "==============================================="

# 2. Construir la imagen en la nube (Cloud Build)
Write-Host "Construyendo imagen Docker en Cloud Build..." -ForegroundColor Yellow
gcloud builds submit --tag gcr.io/$PROJECT_ID/$SERVICE_NAME

# 3. Desplegar en Cloud Run
Write-Host "Desplegando en Cloud Run..." -ForegroundColor Yellow

# Versión simplificada con timeout aumentado (implícito en configuración del servidor, pero aquí definimos la instancia)
gcloud run deploy $SERVICE_NAME `
  --image gcr.io/$PROJECT_ID/$SERVICE_NAME `
  --platform managed `
  --region $REGION `
  --allow-unauthenticated `
  --memory 1024Mi `
  --timeout 300

Write-Host "===============================================" -ForegroundColor Cyan
Write-Host "Si el despliegue fue exitoso, verás la URL arriba."
