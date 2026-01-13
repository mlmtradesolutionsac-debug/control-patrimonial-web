# Guía de Scripts - Control Patrimonial

## ⚠️ IMPORTANTE: Arquitectura Dual de Base de Datos

Este proyecto mantiene **dos bases de datos**:

| Ambiente | Base de Datos | Uso |
|----------|--------------|-----|
| **Desarrollo** | SQLite local | Desarrollo en tu máquina |
| **Producción** | PostgreSQL remoto (10.28.106.250) | Sistema en producción en servidor |

**Los scripts automáticamente detectan dónde se están ejecutando y usan la BD correcta.**

---

## Cómo Verificar Dónde Estás

### En Windows (Desarrollo)
```bash
cd E:\PROYECTOS WEB\control_patrimonial_web
python scripts/manage_users.py info
```

Verás: `SQLite (Desarrollo)` + ruta a `inventario_patrimonial.db`

### En Servidor (Producción)
```bash
cd /home/patrimonio/control_patrimonial
python scripts/manage_users.py info
```

Verás: `PostgreSQL (Producción)` + `10.28.106.250`

---

## Scripts Principales

### 1️⃣ Gestión de Usuarios Operadores

**Script:** `scripts/manage_users.py`

#### Listar usuarios
```bash
python scripts/manage_users.py list
```

#### Crear un usuario
```bash
python scripts/manage_users.py create <usuario> <contraseña> [cargo]
```

**Ejemplo:**
```bash
python scripts/manage_users.py create juanperez 123456 OPERADOR
```

#### Crear operadores por defecto (6 usuarios)
```bash
python scripts/manage_users.py default
```

Crea: acajas, afernandez, equiñonez, jcoronado, osandi, rcalderon

#### Cambiar contraseña de un usuario
```bash
python scripts/manage_users.py change-pass <usuario> <contraseña>
```

#### Eliminar usuario
```bash
python scripts/manage_users.py delete <usuario>
```

#### Ver información de la base de datos
```bash
python scripts/manage_users.py info
```

---

### 2️⃣ Gestión del Administrador

**Script:** `scripts/manage_admin.py`

**IMPORTANTE:** El admin debe estar EN TABLA `usuarios`, NO en `usuarios_app`

#### Crear/resetear admin
```bash
python scripts/manage_admin.py create [contraseña]
```

**Ejemplo:**
```bash
python scripts/manage_admin.py create AdminPassword123
```

Si no das contraseña, se pide interactivamente.

#### Verificar estado del admin
```bash
python scripts/manage_admin.py check
```

Verifica que esté en la tabla correcta.

#### Resetear contraseña del admin
```bash
python scripts/manage_admin.py reset [contraseña]
```

---

### 3️⃣ Importar Bienes desde Excel

**Script:** `scripts/import_bienes.py`

Importa/actualiza bienes desde archivos Excel (.xlsx)

#### Importar archivo (insertar + actualizar)
```bash
python scripts/import_bienes.py ruta/al/archivo.xlsx
```

#### Solo actualizar bienes existentes
```bash
python scripts/import_bienes.py archivo.xlsx --update
```

#### Solo insertar bienes nuevos
```bash
python scripts/import_bienes.py archivo.xlsx --insert
```

**Características:**
- ✅ Detecta cambios automáticamente
- ✅ Trunca campos según límites de BD
- ✅ Crea backup de SQLite antes de importar
- ✅ Procesa en lotes de 100 registros
- ✅ Funciona con SQLite y PostgreSQL

**Formato del Excel:**
- Primera fila = encabezados
- Campos requeridos: `codigo_patrimonial`
- Campos opcionales: `denominacion`, `marca`, `modelo`, `responsable`, `estado`, `serie`, `ubicacion_texto`, `observaciones`, `cal_2025`, `sede_id`, `unidad_id`

---

### 4️⃣ Verificar Estado de la Base de Datos

**Script:** `scripts/db_helper.py`

```bash
python scripts/db_helper.py
```

Muestra:
- Tipo de BD actual (SQLite o PostgreSQL)
- Ubicación/conexión
- Estadísticas (bienes, sedes, unidades, usuarios)

---

## Flujos de Trabajo Comunes

### Flujo 1: Preparar el servidor con datos y usuarios

1. **Verificar que estés en servidor:**
   ```bash
   python scripts/manage_users.py info
   # Debe mostrar: PostgreSQL (Producción)
   ```

2. **Crear administrador:**
   ```bash
   python scripts/manage_admin.py create AdminPassword123
   ```

3. **Crear operadores por defecto:**
   ```bash
   python scripts/manage_users.py default
   ```

4. **Importar bienes desde Excel:**
   ```bash
   python scripts/import_bienes.py /ruta/al/bienes_actualizados.xlsx
   ```

5. **Verificar que todo funcionó:**
   ```bash
   python scripts/manage_users.py info
   # Verifica bienes, usuarios, etc.
   ```

---

### Flujo 2: Actualizar datos en producción

1. **Copiar archivo Excel al servidor:**
   ```bash
   scp bienes_nuevos.xlsx patrimonio@10.28.106.250:/home/patrimonio/control_patrimonial/
   ```

2. **En el servidor, importar:**
   ```bash
   cd ~/control_patrimonial
   python scripts/import_bienes.py bienes_nuevos.xlsx
   ```

3. **Reiniciar aplicación:**
   ```bash
   sudo systemctl restart gunicorn
   # O manualmente:
   pkill -9 gunicorn
   nohup gunicorn --config gunicorn_config.py wsgi:app > gunicorn.log 2>&1 &
   ```

---

### Flujo 3: Resetear admin cuando está bloqueado

```bash
python scripts/manage_admin.py reset NuevaContraseña456
```

---

### Flujo 4: Auditar quién es responsable de un bien

```bash
python scripts/manage_users.py info
```

O directamente con SQL en la BD:

**SQLite:**
```bash
sqlite3 data/inventario_patrimonial.db "SELECT codigo_patrimonial, responsable FROM bienes WHERE responsable LIKE '%FERNANDEZ%';"
```

**PostgreSQL en servidor:**
```bash
cd ~/control_patrimonial
python -c "from wsgi import app; from app.models_sqlalchemy import Bien; app.app_context().push(); bienes = Bien.query.filter(Bien.responsable.ilike('%FERNANDEZ%')).all(); print('\n'.join(f'{b.codigo_patrimonial}: {b.responsable}' for b in bienes))"
```

---

## Problemas Comunes y Soluciones

### ❌ "Error: No me deja ingresar"

**Causa:** Admin no existe o está en tabla incorrecta

**Solución:**
```bash
python scripts/manage_admin.py check      # Verificar estado
python scripts/manage_admin.py create     # Recrear admin
```

---

### ❌ "Los cambios no aparecen en la aplicación"

**Causa:** Estabas actualizando SQLite pero aplicación lee de PostgreSQL

**Solución:**
1. Verificar dónde estás: `python scripts/manage_users.py info`
2. Si está en desarrollo (SQLite) pero necesitas producción:
   - Copiar archivo al servidor
   - Ejecutar scripts EN el servidor

---

### ❌ "Cambios lentos o bloqueos"

**Causa:** Grandes importaciones causan locks en SQLite

**Solución:**
- En desarrollo: Aceptable, SQLite es más lento
- En producción: Contactar al administrador si sucede

---

### ❌ "Operador no puede ingresar después de crear"

**Causa:** Usuario creado en tabla incorrecta

**Solución:** Usa siempre `manage_users.py`, no scripts anteriores

---

## Referencia Rápida

```bash
# USUARIOS
python scripts/manage_users.py list                    # Listar
python scripts/manage_users.py create u p              # Crear
python scripts/manage_users.py delete u                # Eliminar
python scripts/manage_users.py default                 # Crear 6 por defecto

# ADMIN
python scripts/manage_admin.py check                   # Verificar
python scripts/manage_admin.py create p                # Crear/resetear
python scripts/manage_admin.py reset p                 # Cambiar contraseña

# BIENES
python scripts/import_bienes.py archivo.xlsx           # Importar

# INFO
python scripts/manage_users.py info                    # Ver estadísticas
python scripts/db_helper.py                            # Ver BD actual
```

---

## Historial de Cambios

### v2.0 (Consolidación)
- ✅ Scripts unificados para SQLite y PostgreSQL
- ✅ Detección automática de BD
- ✅ Mayor seguridad (confirmaciones en operaciones destructivas)
- ✅ Mejor documentación

### v1.0 (Scripts separados - OBSOLETOS)
- ❌ Scripts SQLite: `populate_users.py`, `update_bienes_from_excel.py`
- ❌ Scripts PostgreSQL: `populate_users_postgresql.py`, etc.
- ❌ Causaba confusión sobre cuál ejecutar

---

## Para Desarrolladores

### Crear nuevo script usando la utilidad de detección

```python
#!/usr/bin/env python3
import sys
from pathlib import Path
sys.path.insert(0, str(Path(__file__).parent.parent))

from wsgi import app
from app import db
from scripts.db_helper import print_db_info, print_success, print_error

# Tu código aquí
with app.app_context():
    # Automáticamente usa la BD correcta
    pass
```

### Disponible en db_helper.py:
- `get_db_info()` - Información de la BD
- `print_db_info()` - Mostrar info
- `require_confirmation()` - Pedir confirmación
- `get_db_stats()` - Estadísticas
- `print_success()`, `print_error()`, `print_warning()` - Formateo

---

## Contacto y Soporte

Para problemas o sugerencias:
- Consulta este documento primero
- Verifica en `ARQUITECTURA.md` la estructura del proyecto
- Revisar logs: `tail -f gunicorn.log`

