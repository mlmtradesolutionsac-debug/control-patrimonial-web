# Migración SQLite → PostgreSQL

Guía paso-a-paso para migrar la base de datos de SQLite a PostgreSQL en producción.

## Pre-requisitos

- PostgreSQL 12+ instalado en servidor
- psycopg2-binary en requirements.txt (ya presente)
- Acceso SSH al servidor de producción
- Backup de la BD SQLite

## Paso 1: Crear usuario y base de datos en PostgreSQL

```bash
# En el servidor, conectarse como postgres
sudo -u postgres psql

# Crear usuario (ejecutar en psql)
CREATE USER control_patrimonial WITH ENCRYPTED PASSWORD 'password_seguro_aqui';

# Crear base de datos
CREATE DATABASE control_patrimonial OWNER control_patrimonial;

# Otorgar permisos
GRANT ALL PRIVILEGES ON DATABASE control_patrimonial TO control_patrimonial;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON TABLES TO control_patrimonial;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON SEQUENCES TO control_patrimonial;

# Salir
\q
```

## Paso 2: Probar conexión desde aplicación

```bash
# Instalar PostgreSQL client tools (si no están)
sudo apt-get install postgresql-client

# Probar conexión
psql -h localhost -U control_patrimonial -d control_patrimonial -c "SELECT 1"
```

## Paso 3: Actualizar configuración

### 3.1 Archivo .env.production

```bash
# Agregar esta línea con la URL correcta
DATABASE_URL=postgresql://control_patrimonial:password_seguro_aqui@localhost:5432/control_patrimonial
```

### 3.2 Archivo config.py (ya configurado)

La configuración ya soporta DATABASE_URL. Verificar que ProductionConfig use:

```python
SQLALCHEMY_DATABASE_URI = os.environ.get(
    'DATABASE_URL',
    'postgresql://...'
)
```

## Paso 4: Crear esquema en PostgreSQL

```bash
# En el servidor
cd /opt/control_patrimonial

# Exportar variables de entorno
export FLASK_ENV=production
export DATABASE_URL="postgresql://control_patrimonial:password@localhost:5432/control_patrimonial"

# Crear todas las tablas (sin datos aún)
python -m flask db upgrade

# Verificar tablas creadas
psql -h localhost -U control_patrimonial -d control_patrimonial -c "\dt"
```

## Paso 5: Migrar datos de SQLite a PostgreSQL

### Opción A: Script de migración automática

```bash
# Ejecutar script de migración
cd /opt/control_patrimonial
python scripts/migrate_sqlite_to_postgresql.py \
    --sqlite-db data/inventario_patrimonial.db \
    --postgresql-url "postgresql://control_patrimonial:password@localhost:5432/control_patrimonial"
```

### Opción B: Migración manual con SQL

```bash
# 1. Exportar datos de SQLite
sqlite3 data/inventario_patrimonial.db << 'EOF'
.mode csv
.output usuarios.csv
SELECT * FROM usuarios;
EOF

# 2. Importar a PostgreSQL
PGPASSWORD='password' psql -h localhost -U control_patrimonial -d control_patrimonial << 'EOF'
\COPY usuarios FROM 'usuarios.csv' WITH (FORMAT csv);
EOF
```

## Paso 6: Validar migración

```bash
# Contar registros en SQLite
sqlite3 data/inventario_patrimonial.db "SELECT COUNT(*) FROM bienes;"

# Contar registros en PostgreSQL
psql -h localhost -U control_patrimonial -d control_patrimonial -c "SELECT COUNT(*) FROM bienes;"

# Deben coincidir los números
```

## Paso 7: Actualizar aplicación para usar PostgreSQL

```bash
# Actualizar config
export FLASK_ENV=production
export DATABASE_URL="postgresql://control_patrimonial:password@localhost:5432/control_patrimonial"

# Reiniciar aplicación
sudo systemctl restart control_patrimonial

# Verificar logs
sudo journalctl -u control_patrimonial -n 50 -f
```

## Paso 8: Rollback (si algo falla)

### Para volver a SQLite:

```bash
# 1. Restaurar BD SQLite del backup
cp data/inventario_patrimonial.db.backup data/inventario_patrimonial.db

# 2. Desconfigurar DATABASE_URL
unset DATABASE_URL

# 3. Reiniciar aplicación
sudo systemctl restart control_patrimonial

# 4. Verificar
curl http://localhost:8000/api/health
```

### Para limpiar PostgreSQL:

```bash
sudo -u postgres psql << 'EOF'
DROP DATABASE IF EXISTS control_patrimonial;
DROP USER IF EXISTS control_patrimonial;
\q
EOF
```

## Configuración Connection Pool para PostgreSQL

El archivo `config.py` ya contiene configuración optimizada para PostgreSQL:

```python
SQLALCHEMY_ENGINE_OPTIONS = {
    'pool_size': 10,           # Conexiones por worker de Gunicorn
    'pool_recycle': 3600,      # Reciclar cada 1 hora
    'pool_pre_ping': True,     # Verificar conexión antes de usar
    'max_overflow': 20,        # Conexiones adicionales para picos
}
```

## Troubleshooting

### Error: "could not connect to server"

```bash
# Verificar que PostgreSQL está ejecutándose
sudo systemctl status postgresql

# Verificar credenciales
psql -h localhost -U control_patrimonial -d control_patrimonial
```

### Error: "permission denied for schema public"

```bash
# Ejecutar como postgres
sudo -u postgres psql -d control_patrimonial << 'EOF'
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON TABLES TO control_patrimonial;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON SEQUENCES TO control_patrimonial;
\q
EOF
```

### Error: "duplicate key value violates unique constraint"

```bash
# Verificar valores únicos en SQLite antes de migrar
sqlite3 data/inventario_patrimonial.db << 'EOF'
SELECT codigo_patrimonial, COUNT(*) FROM bienes GROUP BY codigo_patrimonial HAVING COUNT(*) > 1;
SELECT cod_barras, COUNT(*) FROM bienes WHERE cod_barras IS NOT NULL GROUP BY cod_barras HAVING COUNT(*) > 1;
SELECT serie, COUNT(*) FROM bienes WHERE serie IS NOT NULL GROUP BY serie HAVING COUNT(*) > 1;
EOF
```

## Monitoreo Post-Migración

```bash
# Ver estadísticas de conexiones
psql -h localhost -U control_patrimonial -d control_patrimonial -c "SELECT datname, count(*) FROM pg_stat_activity GROUP BY datname;"

# Ver tamaño de la BD
psql -h localhost -U control_patrimonial -d control_patrimonial -c "SELECT pg_size_pretty(pg_database_size('control_patrimonial'));"

# Ver índices
psql -h localhost -U control_patrimonial -d control_patrimonial -c "\di"
```

## Checklist

- [ ] PostgreSQL instalado y ejecutándose
- [ ] Usuario 'control_patrimonial' creado
- [ ] Base de datos 'control_patrimonial' creada
- [ ] Conexión probada desde cliente psql
- [ ] DATABASE_URL definido correctamente en .env.production
- [ ] Esquema creado con `flask db upgrade`
- [ ] Datos migrados de SQLite
- [ ] Registros validados (contar y comparar)
- [ ] Aplicación reiniciada
- [ ] Logs verificados sin errores
- [ ] Health check pasó correctamente
- [ ] Backup de SQLite guardado seguramente

## Referencias

- [PostgreSQL Documentation](https://www.postgresql.org/docs/)
- [SQLAlchemy PostgreSQL](https://docs.sqlalchemy.org/en/14/dialects/postgresql.html)
- [Psycopg2 Documentation](https://www.psycopg.org/)
