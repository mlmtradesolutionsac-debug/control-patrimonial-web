# Corrección Masiva de Estados CAL 2025

## Propósito

Este script corrige automáticamente los bienes que tienen **CAL 2025 registrado** pero están marcados con estado **"Malo"**.

### Lógica de la Corrección

- **Condición**: Un bien con CAL 2025 significa que fue verificado/inventariado en 2025
- **Problema**: Un bien verificado NO debería tener estado "Malo" (destruido/irrecuperable)
- **Solución**: Cambiar estado de "Malo" → "Regular" (mantenible) para todos los bienes que cumplan:
  - `cal_2025` ≠ NULL (tiene valor)
  - `cal_2025` ≠ '' (no está vacío)
  - `estado` = 'm' (estado es "Malo")

---

## Cómo Usar

### Paso 1: SIMULACIÓN (Recomendado - Sin Cambios)

Primero, **simula** qué bienes serían corregidos sin hacer cambios:

```bash
flask corregir-cal-2025 --dry-run
```

**Salida esperada:**
```
================================================================================
CORRECCION DE ESTADOS: Bienes con CAL 2025 en estado MALO → REGULAR
================================================================================

⚠️  MODO SIMULACIÓN (--dry-run): Los cambios NO se guardarán

Bienes encontrados para corregir: 47

Detalles de bienes a corregir:
--------------------------------------------------------------------------------
  1. 464196 | SILLA FIJA DE MADERA
     → CAL 2025: 067891 | Estado ACTUAL: Malo (m) → NUEVO: Regular (r)
  2. 742456 | ESCRITORIO MADERA
     → CAL 2025: 067892 | Estado ACTUAL: Malo (m) → NUEVO: Regular (r)
  ... y 45 bienes más

✓ Simulación completada exitosamente
   Se corregirían 47 registros si ejecutas sin --dry-run
```

### Paso 2: BACKUP (Muy Recomendado)

Antes de ejecutar en producción, **haz backup** de tu base de datos:

#### Opción A: PostgreSQL (Cloud SQL)
```bash
pg_dump postgresql://usuario:contraseña@host:puerto/base_datos > backup_antes_correccion.sql
```

#### Opción B: SQLite (Desarrollo)
```bash
cp app.db app.db.backup
```

### Paso 3: EJECUTAR LA CORRECCIÓN

Una vez confirmado el --dry-run y con backup hecho:

```bash
flask corregir-cal-2025
```

Se te pedirá confirmar:
```
¿Confirmas corregir 47 registros? (S/N): S
```

**Escribe `S` y presiona Enter para confirmar.**

### Salida Esperada

```
================================================================================
CORRECCION DE ESTADOS: Bienes con CAL 2025 en estado MALO → REGULAR
================================================================================

Bienes encontrados para corregir: 47

Detalles de bienes a corregir:
[...]

Ejecutando UPDATE masivo...
✓ UPDATE ejecutado: 47 registros actualizados

================================================================================
ESTADISTICAS FINALES
================================================================================
Total bienes: 1604
Bienes con CAL 2025: 1604

Estado BUENO (b):   200
Estado REGULAR (r): 1354  ← Aumentó de 1307 a 1354 (+47)
Estado MALO (m):    50    ← Disminuyó de 97 a 50

Registros corregidos: 47

✓ Corrección completada exitosamente
```

---

## Verificación en el Dashboard

Después de ejecutar la corrección:

1. **Recarga el dashboard** en tu navegador (Ctrl+F5 para forzar)
2. Verifica que los totales por estado se hayan actualizado:
   - Estado REGULAR debe aumentar
   - Estado MALO debe disminuir
3. Los gráficos y estadísticas se actualizarán automáticamente (no hay cambios de código necesarios)

---

## Opciones Disponibles

```bash
# Solo simulación (sin cambios)
flask corregir-cal-2025 --dry-run

# Ejecutar con backup previo (recomendado en producción)
flask corregir-cal-2025 --backup

# Ejecutar sin confirmación (cuidado: requiere --dry-run primero)
flask corregir-cal-2025
```

---

## Detalles Técnicos

### Campos Afectados

| Campo | Valor |
|-------|-------|
| `estado` | 'm' → 'r' (Malo → Regular) |
| `cal_2025` | Sin cambios (must NOT be NULL o '') |
| Otros campos | Sin cambios |

### Performance

- **Operación**: UPDATE masivo con SQLAlchemy (sin bucles)
- **Tiempo esperado**: < 1 segundo para 1000+ registros
- **Bloqueo de BD**: Mínimo (operación atómica)
- **Transacción**: Automática con commit/rollback en errores

### Logging

- Se registra en los logs de la aplicación como acción `CORRECCION_MASIVA_CAL_2025`
- Se incluye la cantidad de registros actualizados
- En caso de error, se realiza rollback automático

---

## Reversa (Si Hay Problemas)

Si necesitas revertir los cambios:

### Opción A: Restaurar Desde Backup
```bash
# PostgreSQL
psql postgresql://usuario:contraseña@host:puerto/base_datos < backup_antes_correccion.sql

# SQLite
cp app.db.backup app.db
```

### Opción B: Script de Reversa Manual (SQL)
Si no tienes backup, puedes ejecutar SQL directo:
```sql
UPDATE bienes SET estado = 'm'
WHERE cal_2025 IS NOT NULL AND cal_2025 != '' AND estado = 'r'
AND id IN (SELECT bien_id FROM historial WHERE accion = 'CORRECCION_MASIVA_CAL_2025');
```

---

## Troubleshooting

### "Command 'corregir-cal-2025' not found"
- Asegúrate de estar en el directorio raíz del proyecto
- Activa el venv: `source venv/Scripts/activate` (Windows) o `source venv/bin/activate` (Linux)
- Verifica que `app/commands.py` esté actualizado

### "Database connection error"
- Verifica que la BD esté accesible
- Si usas Cloud SQL, confirma que tienes credenciales correctas
- Para Cloud Run, ejecuta: `gcloud sql connect` primero

### "No changes detected" (--dry-run devuelve 0)
- ✓ Normal si ya no hay bienes con CAL 2025 + estado Malo
- Ejecuta el script anterior y verifica los bienes

---

## Recomendaciones Finales

1. **Siempre ejecuta --dry-run primero** antes de cualquier cambio real
2. **Haz backup** antes de producción
3. **Verifica en el dashboard** después de la corrección
4. **Documenta** cuándo ejecutaste esto (para auditoría)

---

**Última actualización**: 2026-01-05
**Autor**: Claude (Senior Python/Flask Developer)
