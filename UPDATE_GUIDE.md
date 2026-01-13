# Guía de Actualización - Control Patrimonial

## Actualización Rápida (Recomendado)

### En tu máquina local:

```bash
# 1. Hacer cambios en el código
# ... editas archivos ...

# 2. Probar localmente
python run.py

# 3. Commit y push
git add .
git commit -m "Feature: descripción del cambio"
git push origin main
```

### En el servidor:

```bash
# SSH al servidor
ssh usuario@tu-servidor.com

# Ir a la carpeta de la aplicación
cd /opt/control_patrimonial

# Ejecutar script de actualización
sudo ./update-server.sh
```

**¡Listo!** En ~1-2 minutos tu servidor estará actualizado.

---

## Proceso Detallado

### Paso 1: Preparar en Local

```bash
# Verificar cambios
git status

# Ver cambios sin staging
git diff

# Ver cambios staged
git diff --staged
```

### Paso 2: Commit y Push

```bash
# Agregar todos los cambios
git add .

# Crear commit con mensaje descriptivo
git commit -m "Tipo: descripción breve

Descripción más detallada si es necesario.
Cierra #123"

# Subir a repositorio
git push origin main
```

**Tipos de commit recomendados:**
- `feat:` Nueva funcionalidad
- `fix:` Corrección de bug
- `perf:` Mejora de rendimiento
- `refactor:` Cambio de código sin funcionalidad nueva
- `docs:` Cambios en documentación
- `style:` Cambios de formato/estilos
- `test:` Agregar o actualizar tests

### Paso 3: Actualizar Versión (Opcional)

Si es una versión nueva, actualiza:

```bash
# Editar VERSION
echo "1.1.1" > VERSION

# Editar CHANGELOG.md con cambios
vim CHANGELOG.md

# Commit
git add VERSION CHANGELOG.md
git commit -m "chore: release v1.1.1"
git push origin main

# Tag en git (opcional pero recomendado)
git tag -a v1.1.1 -m "Release v1.1.1"
git push origin v1.1.1
```

### Paso 4: Actualizar en Servidor

```bash
# SSH al servidor
ssh usuario@tu-servidor.com

# Navegar a la app
cd /opt/control_patrimonial

# Método automático (RECOMENDADO)
sudo ./update-server.sh

# Método manual (si falla el script)
sudo -u app git pull origin main
sudo -u app pip install -r requirements.prod.txt --quiet
sudo -u app flask db upgrade
sudo systemctl restart control_patrimonial
```

---

## Manejo de Errores

### Si la actualización falla:

```bash
# Ver logs de la aplicación
sudo journalctl -u control_patrimonial -n 50 -f

# Ver logs de actualización
tail -f /var/log/control_patrimonial/update.log

# Rollback a versión anterior
cd /opt/control_patrimonial
git log --oneline -10  # Ver commits recientes
git revert <commit-hash>  # Revertir un commit
git push origin main
sudo ./update-server.sh  # Aplicar rollback
```

### Si hay conflictos en git:

```bash
# Ver conflictos
git status

# Resolver conflictos manualmente
vim archivo-en-conflicto.py

# Marcar como resuelto
git add archivo-en-conflicto.py
git commit -m "fix: resolver conflicto de merge"
git push origin main
```

---

## Actualización con Cambios de Base de Datos

### Si agregaste nueva columna:

```bash
# En local: crear migración
flask db migrate -m "Add new_column to bienes table"

# Revisar archivo generado
vim migrations/versions/xxxxx_add_new_column.py

# Commit
git add migrations/
git commit -m "feat: add migration for new_column"
git push origin main
```

### En servidor: se ejecuta automáticamente

```bash
# El script ./update-server.sh ejecutará automáticamente:
flask db upgrade

# Si necesitas hacerlo manualmente:
sudo -u app flask db upgrade
```

### Rollback de migración:

```bash
# Si algo salió mal
flask db downgrade  # Revertir último cambio
flask db downgrade -1  # Revertir N cambios
```

---

## Actualizaciones sin Downtime (Avanzado)

Para actualizaciones que requieren 0 segundos de downtime:

```bash
# 1. Descargar cambios en segunda instancia
git clone /opt/control_patrimonial /opt/control_patrimonial.new

# 2. Actualizar nueva instancia
cd /opt/control_patrimonial.new
pip install -r requirements.prod.txt

# 3. Cambiar symlink
cd /opt
mv control_patrimonial control_patrimonial.old
mv control_patrimonial.new control_patrimonial

# 4. Reiniciar servicios
systemctl restart control_patrimonial

# 5. Si hay error, rollback
cd /opt
mv control_patrimonial control_patrimonial.new
mv control_patrimonial.old control_patrimonial
systemctl restart control_patrimonial
```

---

## Checklist de Actualización

- [ ] Probé cambios localmente
- [ ] Hice commit con mensaje descriptivo
- [ ] Subí cambios a GitHub (git push)
- [ ] Ejecuté `./update-server.sh` en servidor
- [ ] Verifiqué que el sistema está funcionando
- [ ] Actualicé CHANGELOG.md si es versión nueva
- [ ] Creé git tag si es versión nueva
- [ ] Documenté cambios para usuarios finales (si aplica)

---

## Monitoreo Post-Actualización

```bash
# Verificar que está ejecutándose
systemctl status control_patrimonial

# Ver logs en tiempo real
journalctl -u control_patrimonial -f

# Verificar salud
curl http://localhost:8000/api/health

# Ver uso de recursos
top
ps aux | grep control_patrimonial
```

---

## Programar Actualizaciones Automáticas

### Opción 1: Cron job diario

```bash
# Editar crontab
sudo crontab -e

# Agregar línea para actualizar cada madrugada (3 AM)
0 3 * * * /opt/control_patrimonial/update-server.sh >> /var/log/control_patrimonial/cron-update.log 2>&1
```

### Opción 2: Webhook desde GitHub

Si usas GitHub, puedes configurar webhooks para actualizar automáticamente al hacer push.

---

## Soporte y Ayuda

**Problema**: La actualización es lenta
**Solución**: Ejecuta en horario de menor carga

**Problema**: Error de permisos en BD
**Solución**: Verifica que usuario app tiene permisos en PostgreSQL

**Problema**: Cambios no aparecen
**Solución**: Limpia cache del navegador (Ctrl+Shift+Del)

**Problema**: API retorna 500
**Solución**: Revisa logs con `journalctl -u control_patrimonial -n 100`

---

## Contacto

Para problemas en actualización:
- Revisar logs: `/var/log/control_patrimonial/update.log`
- Contactar administrador: admin@control-patrimonial.local
- Documentación: Ver README.md
