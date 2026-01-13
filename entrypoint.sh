#!/bin/bash

echo "================================"
echo "Control Patrimonial - Entrypoint"
echo "================================"

# Establecer valores por defecto si faltan
export FLASK_ENV=${FLASK_ENV:-production}
export SECRET_KEY=${SECRET_KEY:-dev-key-change-in-production}
export PORT=${PORT:-8080}
export DATABASE_URL=${DATABASE_URL:-postgresql://control_patrimonial:Control2025@35.222.111.223:5432/control_patrimonial}

echo "Puerto: $PORT"
echo "Entorno: $FLASK_ENV"

if [ ! -z "$DATABASE_URL" ]; then
    echo "Base de datos: ${DATABASE_URL:0:30}..."
else
    echo "⚠️  DATABASE_URL no configurada - usando fallback"
fi

# Ejecutar migraciones de base de datos (si DATABASE_URL está configurada)
echo "Ejecutando migraciones de base de datos..."
if [ ! -z "$DATABASE_URL" ]; then
    python /app/init_db.py
    echo "✓ Inicialización de tablas completada"

    python /app/migrate_add_responsable_name.py
    echo "✓ Migraciones de esquema completadas"

    python /app/create_visitor_user.py
    echo "✓ Usuario visitor creado/verificado"
else
    echo "⚠️  DATABASE_URL no configurada - saltando migraciones"
    echo "    Las migraciones se ejecutarán vía API endpoint"
fi
echo "Iniciando Gunicorn..."
echo "================================"

# Iniciar Gunicorn
exec /usr/local/bin/gunicorn --bind 0.0.0.0:$PORT --workers 1 --threads 8 --timeout 60 wsgi:app --log-level debug --access-logfile - --error-logfile -
