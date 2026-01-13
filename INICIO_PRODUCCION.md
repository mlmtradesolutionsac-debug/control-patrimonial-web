# GUÍA RÁPIDA - Iniciar Control Patrimonial en Producción

**Tiempo total**: 1 hora | **Dificultad**: Media

---

## 5 Pasos para Producción

### PASO 1: Preparar Variables de Entorno (5 min)

```bash
# Copiar template
cp .env.production .env

# Generar SECRET_KEY segura
python3 -c "import secrets; print('SECRET_KEY=' + secrets.token_hex(32))" >> .env

# Editar con valores reales
nano .env
```

**Valores clave a cambiar**:
- `SECRET_KEY` - Ya generada
- `DATABASE_URL` - URL de PostgreSQL (verás después)
- `LOG_LEVEL` - INFO (o DEBUG si necesitas)

---

### PASO 2: Setup PostgreSQL en Ubuntu (20 min)

**Si no tienes PostgreSQL**:
```bash
sudo bash setup_postgres.sh
```

Este script:
- Instala PostgreSQL
- Crea usuario y BD
- Configura permisos
- Crea el archivo .env automáticamente

**Si ya tienes PostgreSQL**:
```bash
# Crear usuario
sudo -u postgres psql -c "CREATE USER control_patrimonial WITH PASSWORD 'your_password';"

# Crear BD
sudo -u postgres psql -c "CREATE DATABASE control_patrimonial OWNER control_patrimonial;"

# Agregar URL a .env
echo "DATABASE_URL=postgresql://control_patrimonial:your_password@localhost/control_patrimonial" >> .env
```

---

### PASO 3: Instalar Dependencias (10 min)

```bash
# Instalar solo lo necesario para producción
pip install -r requirements.prod.txt
```

Esto instala:
- Flask y extensiones
- PostgreSQL driver (psycopg2)
- Gunicorn (servidor)
- Pandas, openpyxl, reportlab (importación/exportación)
- Y poco más (22 paquetes totales)

---

### PASO 4: Configurar Base de Datos (10 min)

```bash
# Inicializar migraciones (primera vez)
flask db init

# Crear estructura de tablas
flask db migrate -m "Initial migration"
flask db upgrade
```

**Si viniste de SQLite**:
```bash
# Migrar datos
python migrate_to_postgres.py
```

---

### PASO 5: Iniciar Aplicación (5 min)

**Opción A: Script automático** (RECOMENDADO)
```bash
bash start_production.sh
```

**Opción B: Directo con gunicorn**
```bash
gunicorn --config gunicorn_config.py wsgi:app
```

**Opción C: Con systemd** (más adelante en producción)
Ver: `DEPLOYMENT_UBUNTU_PRODUCCION.md`

---

## ✅ Verificar que funciona

```bash
# En otra terminal, probar que la app responde
curl http://127.0.0.1:8000

# Deberías ver HTML de login
# Si ves error, revisar logs/gunicorn_error.log
```

---

## 🔗 Acceso

```
URL: http://servidor:8000
Usuario: admin (o el que creaste)
Contraseña: (la que configuraste)
```

---

## 📊 Diferencias: Development vs Production

| Aspecto | Development | Production |
|---------|-------------|-----------|
| Base datos | SQLite (archivo) | PostgreSQL (servidor) |
| Servidor | Flask dev server | Gunicorn + workers |
| Debug | True | False |
| Reload automático | Sí | No |
| HTTPS | No | Sí (con Nginx) |
| Logging | Console | Archivos en logs/ |

---

## ⚠️ Problemas Comunes

### "Connexion refused"
```bash
# Verificar que PostgreSQL está corriendo
sudo systemctl status postgresql

# Si no está, iniciar
sudo systemctl start postgresql
```

### "No such module: psycopg2"
```bash
pip install psycopg2-binary
```

### "SECRET_KEY is too short"
```bash
# Regenerar clave fuerte
python3 -c "import secrets; print(secrets.token_hex(32))"
# Copiar a .env
```

### "Migrations not applied"
```bash
flask db upgrade
```

---

## 📈 Próximos Pasos

1. **Verificar funcionamiento**: Acceder a http://servidor:8000
2. **Testing**: Hacer login, buscar bienes, etc.
3. **Nginx + SSL**: Ver `DEPLOYMENT_UBUNTU_PRODUCCION.md`
4. **Monitoreo**: Ver logs en `logs/gunicorn_*.log`
5. **Backups**: Programar backups de PostgreSQL

---

## 📚 Documentación Completa

```
IMPLEMENTACION_EXITOSA.md              ← Resumen de cambios
OPTIMIZACION_PRODUCCION_COMPLETADA.md  ← Detalles técnicos
DEPLOYMENT_UBUNTU_PRODUCCION.md        ← Setup completo del servidor
FASE2_IMPORTACION_EXPORTACION.md      ← Importar/exportar datos
```

---

## 🚀 ¡Listo!

Si llegaste aquí con éxito:
```bash
# Ver que está corriendo
ps aux | grep gunicorn

# Ver logs
tail -f logs/gunicorn_error.log
tail -f logs/gunicorn_access.log

# Para detener
Ctrl+C (en la terminal de gunicorn)
```

**Enhorabuena - ¡Tu app está en producción!** 🎉

---

## 💡 Tips Útiles

### Ver información de workers
```bash
ps aux | grep gunicorn
```

### Cambiar número de workers
```bash
# Editar gunicorn_config.py
# O usar variable de entorno
export GUNICORN_WORKERS=4
gunicorn -c gunicorn_config.py wsgi:app
```

### Ver logs en tiempo real
```bash
tail -f logs/gunicorn_error.log
tail -f logs/gunicorn_access.log
```

### Probar sin Gunicorn (debugging)
```bash
export FLASK_ENV=production
python run.py  # Usa Flask dev server (NO PRODUCCIÓN)
```

---

**Archivo**: `INICIO_PRODUCCION.md`
**Version**: 1.0
**Actualizado**: 27 Nov 2025
