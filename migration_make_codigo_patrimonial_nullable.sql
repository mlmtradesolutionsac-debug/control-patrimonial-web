-- Migración: Permitir que codigo_patrimonial sea NULL
-- Descripción: Cambiar la columna codigo_patrimonial de NOT NULL a NULL
--              para permitir crear bienes sin código patrimonial inicial
-- Fecha: 2025-12-15

-- Conectarse a la base de datos control_patrimonial
-- psql -h 35.222.111.223 -U control_patrimonial -d control_patrimonial

-- Ejecutar la migración:
ALTER TABLE bienes ALTER COLUMN codigo_patrimonial DROP NOT NULL;

-- Verificar que la migración fue exitosa:
-- SELECT column_name, is_nullable FROM information_schema.columns
-- WHERE table_name = 'bienes' AND column_name = 'codigo_patrimonial';
-- Debe mostrar: codigo_patrimonial | YES

-- También necesitamos registrar la migración en alembic_version
INSERT INTO alembic_version (version_num) VALUES ('allow_bienes_without_code')
ON CONFLICT DO NOTHING;
