-- ============================================================================
-- MIGRACIÓN: Actualizar estado de bienes CON CAL 2025 de MALO → REGULAR
-- ============================================================================
-- Fecha: 2026-01-22
-- Descripción:
--   Actualiza masivamente el estado de todos los bienes que tienen:
--   - Estado actual: MALO (m)
--   - CAL 2025: NO VACÍO (tienen valor de verificación)
--   Cambia su estado a: REGULAR (r)
--
-- Justificación:
--   Un bien con CAL 2025 significa que fue verificado/inventariado en 2025.
--   Un bien verificado NO debería tener estado MALO.
--   El estado correcto es REGULAR (mantenible) o BUENO (en funcionamiento).
--
-- Ejecución:
--   psql -h HOST -U usuario -d base_datos < migration_actualizar_estado_cal2025.sql
-- ============================================================================

BEGIN;

-- Paso 1: Verificar cuántos bienes van a cambiar
SELECT
    'VERIFICACION: Bienes a actualizar' as paso,
    COUNT(*) as cantidad
FROM bienes
WHERE estado = 'm'
  AND cal_2025 IS NOT NULL
  AND cal_2025 != ''
  AND cal_2025 != ' '
  AND cal_2025 != '0';

-- Paso 2: Registrar en historial (auditable)
INSERT INTO historial (bien_id, usuario, accion, detalle_json, fecha)
SELECT
    id,
    'migration_2026_01_22',
    'EDITAR',
    jsonb_build_object(
        'campo', 'estado',
        'valor_antes', estado,
        'valor_despues', 'r',
        'motivo', 'Migración: Actualizar MALO → REGULAR para bienes CON CAL 2025',
        'fecha_migracion', NOW()::text
    ),
    NOW()
FROM bienes
WHERE estado = 'm'
  AND cal_2025 IS NOT NULL
  AND cal_2025 != ''
  AND cal_2025 != ' '
  AND cal_2025 != '0';

-- Paso 3: Actualizar el estado
UPDATE bienes
SET estado = 'r'
WHERE estado = 'm'
  AND cal_2025 IS NOT NULL
  AND cal_2025 != ''
  AND cal_2025 != ' '
  AND cal_2025 != '0';

-- Paso 4: Verificar resultados
SELECT
    'RESULTADO: Bienes ahora en REGULAR con CAL 2025' as paso,
    COUNT(*) as cantidad
FROM bienes
WHERE estado = 'r'
  AND cal_2025 IS NOT NULL
  AND cal_2025 != '';

SELECT
    'RESULTADO: Bienes restantes en MALO' as paso,
    COUNT(*) as cantidad
FROM bienes
WHERE estado = 'm';

-- Confirmar cambios
COMMIT;

-- Nota: Si deseas hacer ROLLBACK en lugar de COMMIT, modifica la línea de arriba
