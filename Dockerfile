# ===== STAGE 1: Builder (Compilar dependencias) =====
FROM python:3.11-slim AS builder

# Evitar archivos .pyc
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

# Instalar herramientas de compilación SOLO para este stage
RUN apt-get update && apt-get install -y \
    gcc \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Copiar requirements
COPY requirements.prod.txt .

# Instalar dependencias a /root/.local (--user flag)
RUN pip install --no-cache-dir --user -r requirements.prod.txt

# ===== STAGE 2: Runtime (Sin herramientas de compilación) =====
FROM python:3.11-slim

# Evitar archivos .pyc y buffering
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

# Copiar SOLO las librerías compiladas del stage anterior
COPY --from=builder /root/.local /root/.local
COPY --from=builder /root/.local/bin /usr/local/bin

# Actualizar PATH
ENV PATH=/root/.local/bin:$PATH

# Copiar código de la aplicación
COPY . .

# Cloud Run inyecta la variable PORT
ENV PORT=8080
ENV FLASK_ENV=production
ENV DATABASE_URL=postgresql://control_patrimonial:Control2025@35.222.111.223:5432/control_patrimonial
ENV SECRET_KEY=control-patrimonial-secret-key-production

# Copiar y preparar entrypoint
COPY entrypoint.sh .
# Fix común Windows: Eliminar caracteres \r (CR) que causan fallos en Linux
RUN sed -i 's/\r$//' entrypoint.sh
RUN chmod +x entrypoint.sh

# Usuario no root para seguridad (deshabilitado temporalmente para permitir acceso a gunicorn)
# RUN adduser --disabled-password --gecos '' appuser && \
#     chown -R appuser:appuser /app
#
# USER appuser



# Exponer puerto (informativo, Cloud Run lo inyecta)
EXPOSE 8080

# Ejecutar entrypoint que corre migraciones + gunicorn
CMD ["./entrypoint.sh"]
