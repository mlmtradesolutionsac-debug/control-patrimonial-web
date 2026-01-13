# Scripts Obsoletos - DEPRECATED

Este directorio contiene scripts que han sido **reemplazados** por versiones mejores y consolidadas.

⚠️ **NO USAR estos scripts** - Utiliza los scripts en `/scripts/` en su lugar.

---

## Por qué están aquí

Estos scripts tienen problemas:
- **Duplicación:** Existen versiones SQLite y PostgreSQL por separado
- **Confusión:** Difícil saber cuál ejecutar
- **Falta de validación:** No verifican si estás en el ambiente correcto
- **Sin confirmación:** Pueden borrar datos sin preguntar
- **Hardcoded:** Tienen credenciales o rutas fijas

---

## Mapeo de Migraciones

### Gestión de Usuarios

**Obsoletos:**
- `populate_users.py` (SQLite)
- `populate_users_postgresql.py` (PostgreSQL)

**Usar en su lugar:**
```bash
python scripts/manage_users.py create <usuario> <contraseña>
python scripts/manage_users.py default        # Crear 6 por defecto
python scripts/manage_users.py list           # Listar usuarios
```

---

### Gestión del Admin

**Obsoletos:**
- `crear_admin_postgres.py`
- `reset_admin_password.py`
- `reset_admin_postgres.py`
- `migrate_admin_to_correct_table.py`

**Usar en su lugar:**
```bash
python scripts/manage_admin.py create [contraseña]
python scripts/manage_admin.py reset  [contraseña]
python scripts/manage_admin.py check
```

---

### Importación de Bienes

**Obsoletos:**
- `update_bienes_from_excel.py` (SQLite)
- `update_bienes_postgresql.py` (PostgreSQL)
- `import_bienes_faltantes.py`
- `import_bienes_faltantes_v2.py`
- `import_excel_raw_sql.py`
- `import_excel_replace.py`
- `init_postgres_y_importar.py`

**Usar en su lugar:**
```bash
python scripts/import_bienes.py archivo.xlsx
python scripts/import_bienes.py archivo.xlsx --update    # Solo actualizar
python scripts/import_bienes.py archivo.xlsx --insert    # Solo insertar
```

---

### Migración de Bases de Datos

**Obsoletos:**
- `migrate_all_data_to_postgres.py`
- `migrate_all_data_to_postgres_v2.py`
- `migrate_sqlite_to_postgres_remote.py`
- `migrate_to_postgres.py`

**Estado:** Ya completado. No es necesario ejecutar de nuevo.

---

### Diagnóstico y Verificación

**Obsoletos:**
- `check_data_quality.py`
- `check_sedes.py`
- `check_sqlite_columns.py`
- `check_sqlite_schema.py`
- `check_users.py`
- `debug_connection.py`
- `debug_login.py`
- `debug_validation.py`
- `diagnose_backend.py`
- `diagnostico_bien.py`
- `find_the_data.py`
- `inspect_data.py`
- `inspect_dbs.py`
- `inspect_local_db.py`
- `inspect_tables.py`
- `inspect_users.py`
- `ver_estructura_usuarios.py`
- `verificar_migracion.py`
- `verificar_postgres.py`

**Usar en su lugar:**
```bash
python scripts/manage_users.py info      # Ver estadísticas de BD
python scripts/db_helper.py              # Ver información de BD actual
```

---

### Mantenimiento Peligroso

**Obsoletos:**
- `limpiar_db.py` (Peligroso - borra datos)
- `recrear_db_sin_unique.py` (Peligroso - modifica estructura)
- `install_app.py` (Obsoleto - instalar)
- `test_sistema.py` (Pruebas obsoletas)
- `test_sqlalchemy.py` (Pruebas obsoletas)
- `app_old.py` (Archivo antiguo)

**Nota:** Si necesitas estos, consulta con el administrador

---

## Línea de Tiempo

- **Antes (Noviembre 2024):** 45+ scripts en raíz (confusión)
- **Ahora (Diciembre 2024):** 5 scripts consolidados en `/scripts/` (claridad)

---

## Limpieza

Para eliminar completamente estos scripts:
```bash
rm -rf deprecated/
```

Pero es recomendable mantenerlos por un tiempo por referencia.

---

## Preguntas Frecuentes

**P:** ¿Por qué mantienen archivos obsoletos?
**R:** Por referencia histórica y por si alguien tiene procesos automatizados que los usen.

**P:** ¿Puedo ejecutar estos scripts?
**R:** Técnicamente sí, pero NO se recomienda. Podrían estar desactualizados o dañar datos.

**P:** ¿Qué pasa si accidentalmente ejecuto uno?
**R:** Idealmente solo leeran datos, pero algunos podría modificar/borrar. Por eso están aquí.

**P:** ¿Cómo agrego nuevas funcionalidades de scripts?
**R:** Agrégalos a los scripts en `/scripts/`, no crees nuevos aquí.

---

## Referencias

- Ver `SCRIPTS_GUIA.md` para documentación completa
- Ver `scripts/db_helper.py` para utilidades comunes
- Ver `scripts/manage_*.py` para ejemplos de implementación

