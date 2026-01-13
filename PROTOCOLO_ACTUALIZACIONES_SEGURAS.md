# PROTOCOLO DE ACTUALIZACIONES SEGURAS - Control Patrimonial

## ⚠️ PROBLEMA QUE OCURRIÓ

- SQLite tenía 12,826 bienes ✓
- PostgreSQL tenía solo 12,158 bienes ✗ (perdió 668 bienes)
- Pérdida de 217 valores de CAL 2025 = Caída del avance de 19.72% a 19.02%
- El sistema mostraba datos incompletos

**NUNCA MÁS DEBE OCURRIR ESTO**

---

## 1️⃣ REGLA DE ORO

**Cuando actualices con Excel, SIEMPRE:**

```
Excel → PostgreSQL (NO a SQLite)
                ↓
            Verificar en http://10.28.106.250
                ↓
         ✓ Confirmado en Producción
```

---

## 2️⃣ FLUJO CORRECTO PARA IMPORTAR/ACTUALIZAR BIENES

### PASO 1: Preparar el archivo Excel

El Excel debe tener estas columnas **exactamente**:
```
codigo_patrimonial | denominacion | responsable | cal_2025 | marca | modelo | ...
```

**Importante:** Asegúrate que los datos de CAL 2025 sean correctos en el Excel antes de importar.

### PASO 2: Hacer Backup (OBLIGATORIO)

```bash
# En el servidor
cd /home/patrimonio/control_patrimonial

# Backup de la BD actual
pg_dump -U control_patrimonial control_patrimonial > backup_antes_$(date +%Y%m%d_%H%M%S).sql

# O manualmente en PostgreSQL
psql -U control_patrimonial -d control_patrimonial -c "COPY (SELECT * FROM bienes) TO '/tmp/bienes_backup.csv' WITH CSV HEADER"
```

### PASO 3: Contar bienes ANTES

```bash
python3 << 'EOF'
from wsgi import app
from app.models_sqlalchemy import Bien

app.app_context().push()
print(f"Bienes ANTES: {Bien.query.count()}")
print(f"Con CAL 2025 ANTES: {Bien.query.filter(Bien.cal_2025 != None).count()}")
EOF
```

### PASO 4: Importar el Excel a PostgreSQL

```bash
# SIEMPRE usar el script en /scripts (que detecta BD automáticamente)
python scripts/import_bienes.py archivo_actualizado.xlsx

# O manualmente:
python scripts/import_bienes.py archivo.xlsx --update
```

### PASO 5: Verificar Integridad (CRÍTICO)

```bash
python3 << 'EOF'
from wsgi import app
from app.models_sqlalchemy import Bien

app.app_context().push()

bienes_ahora = Bien.query.count()
cal_ahora = Bien.query.filter(Bien.cal_2025 != None).count()

print(f"Bienes AHORA: {bienes_ahora}")
print(f"Con CAL 2025 AHORA: {cal_ahora}")
print(f"Avance: {cal_ahora/bienes_ahora*100:.2f}%")

# VALIDACIONES CRÍTICAS
if bienes_ahora < 12700:
    print("⚠️ ERROR: Bienes disminuyeron! Hacer rollback de inmediato")

if cal_ahora < 2400:
    print("⚠️ ERROR: CAL 2025 disminuyeron! Verificar integridad")
EOF
```

### PASO 6: Reiniciar Gunicorn

```bash
pkill -9 gunicorn
cd /home/patrimonio/control_patrimonial
nohup /home/patrimonio/control_patrimonial/venv/bin/gunicorn --config gunicorn_config.py wsgi:app > gunicorn.log 2>&1 &
sleep 3
ps aux | grep gunicorn | grep -v grep
```

### PASO 7: Verificar en Navegador

Accede a: http://10.28.106.250

Comprueba:
- ✓ Dashboard muestra ~12,826 bienes
- ✓ Avance es ~19.72% (o superior si agregaste CAL 2025)
- ✓ No hay errores en consola

---

## 3️⃣ LO QUE NUNCA HAGAS

| ❌ NUNCA HAGAS | ❌ CONSECUENCIA |
|---|---|
| Actualizar directamente SQLite local | Los cambios no aparecen en producción |
| Usar `update_bienes_from_excel.py` | Modifica SQLite, no PostgreSQL |
| Importar sin backup previo | Imposible recuperar si algo falla |
| Importar sin verificar integridad | Datos fantasma o pérdida silenciosa |
| Reiniciar antes de verificar | Cambios inválidos se propagan |

---

## 4️⃣ SCRIPTS PERMITIDOS AHORA

**USAR SOLO ESTOS:**

```bash
# Para actualizar bienes desde Excel (CORRECTO)
python scripts/import_bienes.py archivo.xlsx

# Para ver estado actual
python scripts/manage_users.py info

# Para crear/resetear admin
python scripts/manage_admin.py create password

# Para crear operadores
python scripts/manage_users.py default
```

**NO USES ESTOS (están deprecados):**
- ❌ `update_bienes_from_excel.py` (SQLite)
- ❌ `populate_users.py` (SQLite)
- ❌ Cualquier script en raíz excepto wsgi.py, run.py, config.py

---

## 5️⃣ VALIDACIONES AUTOMÁTICAS A AGREGAR (FUTURO)

Para máxima protección, se pueden implementar:

```python
# 1. Trigger en BD que previene eliminar bienes con CAL 2025
CREATE TRIGGER protect_cal_2025
BEFORE DELETE ON bienes
FOR EACH ROW
WHEN (OLD.cal_2025 IS NOT NULL)
EXECUTE PROCEDURE raise_exception('No se pueden eliminar bienes con CAL 2025');

# 2. Vista que muestra integridad
SELECT
    COUNT(*) as total_bienes,
    COUNT(CASE WHEN cal_2025 IS NOT NULL THEN 1 END) as con_cal_2025,
    ROUND(COUNT(CASE WHEN cal_2025 IS NOT NULL THEN 1 END)::NUMERIC
        / COUNT(*) * 100, 2) as avance_porcentaje
FROM bienes;

# 3. Log automático de cambios
-- Cada importación registra qué cambió
```

---

## 6️⃣ CHECKLIST PRE-IMPORTACIÓN

Antes de importar cualquier Excel:

- [ ] ¿Hice backup de PostgreSQL?
- [ ] ¿Conté bienes ANTES?
- [ ] ¿Conté CAL 2025 ANTES?
- [ ] ¿El Excel tiene formato correcto?
- [ ] ¿El Excel tiene datos de CAL 2025?
- [ ] ¿Estoy en PRODUCCIÓN (PostgreSQL) no desarrollo (SQLite)?
- [ ] ¿Usé el script correcto `scripts/import_bienes.py`?
- [ ] ¿Conté bienes DESPUÉS y son >= bienes ANTES?
- [ ] ¿Conté CAL 2025 DESPUÉS y son >= CAL 2025 ANTES?
- [ ] ¿Reinicié gunicorn?
- [ ] ¿Verifiqué en navegador que todo se ve bien?

---

## 7️⃣ ALERTAS Y UMBRALES

**Si algo de esto ocurre, DETENTE INMEDIATAMENTE:**

| Alerta | Acción |
|---|---|
| Total de bienes < 12,700 | ROLLBACK: restaurar backup |
| CAL 2025 < 2,400 | ROLLBACK: restaurar backup |
| Avance < 19.5% | INVESTIGAR: qué pasó |
| Errores en gunicorn.log | REVISAR: hay problema en app |
| Dashboard muestra 0 bienes | ERROR CRÍTICO: reiniciar servidor |

---

## 8️⃣ COMANDO RÁPIDO DE VERIFICACIÓN

Guarda esto en un script `check_integrity.sh`:

```bash
#!/bin/bash

echo "="*70
echo "VERIFICACIÓN DE INTEGRIDAD - Control Patrimonial"
echo "="*70

cd /home/patrimonio/control_patrimonial

python3 << 'EOF'
from wsgi import app
from app.models_sqlalchemy import Bien

app.app_context().push()

total = Bien.query.count()
con_cal = Bien.query.filter(Bien.cal_2025 != None).count()
avance = (con_cal / total * 100) if total > 0 else 0

print(f"\nTotal bienes:      {total}")
print(f"Con CAL 2025:      {con_cal}")
print(f"Avance actual:     {avance:.2f}%")

# Alertas
if total < 12700:
    print("\n⚠️ ALERTA: Bienes por debajo de 12,700")
if avance < 19.5:
    print("\n⚠️ ALERTA: Avance por debajo de 19.5%")
if total == 12826 and con_cal >= 2500:
    print("\n✓ SISTEMA ÍNTEGRO: Todo está correcto")

print()
EOF
```

Ejecución:
```bash
bash check_integrity.sh
```

---

## 9️⃣ EN CASO DE EMERGENCIA (ROLLBACK)

Si algo se daña:

```bash
# 1. Parar la aplicación
pkill -9 gunicorn

# 2. Restaurar backup
psql -U control_patrimonial -d control_patrimonial < backup_antes_20251204_130000.sql

# 3. Reiniciar
cd /home/patrimonio/control_patrimonial
nohup /home/patrimonio/control_patrimonial/venv/bin/gunicorn --config gunicorn_config.py wsgi:app > gunicorn.log 2>&1 &

# 4. Verificar
sleep 3
ps aux | grep gunicorn | grep -v grep
```

---

## 🔟 IMPORTANTE: SINCRONIZACIÓN FUTURA

**Para evitar que SQLite y PostgreSQL se desincronicen:**

Opción A (Recomendada): **Migrar completamente a PostgreSQL en desarrollo**
```bash
# Configurar SQLite_DEV para usar PostgreSQL local
# Eliminar completamente SQLite
```

Opción B: **Mantener sincronización diaria**
```bash
# Script que verifica ambas BD cada mañana
python sync_sqlite_postgresql.py
```

Opción C (Actual): **NUNCA tocar SQLite después de migración completada**
```bash
# Solo usar PostgreSQL en producción
# Solo actualizaciones a través de scripts que usan PostgreSQL
```

---

## RESUMEN FINAL

**Lo que pasó:**
- Importaste datos a SQLite local
- Pero PostgreSQL (producción) nunca se actualizó
- 668 bienes quedaron solo en SQLite
- El sistema mostraba 12,158 en lugar de 12,826

**Lo que hacemos ahora:**
- ✅ PostgreSQL tiene los 12,826 bienes
- ✅ CAL 2025 = 2,529 (avance 19.72%)
- ✅ Vista `vw_resumen_inventario` funciona
- ✅ Scripts consolidados en `/scripts/`

**Garantía a futuro:**
- Siempre verificar con backup
- Siempre contar ANTES y DESPUÉS
- Siempre verificar en navegador
- Siempre mantener >= 12,826 bienes
- Siempre mantener CAL 2025 >= 2,500

**Si alguna vez los números bajan, es señal de que algo falló.**

