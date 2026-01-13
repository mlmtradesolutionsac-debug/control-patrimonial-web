#!/usr/bin/env python
"""Apply pending database migrations"""

import os
from alembic.config import Config
from alembic.command import upgrade

# Configurar Alembic
alembic_cfg = Config('migrations/alembic.ini')
alembic_cfg.set_main_option('sqlalchemy.url', os.environ.get('DATABASE_URL', ''))

# Aplicar migraciones pendientes
print("Aplicando migraciones pendientes...")
try:
    upgrade(alembic_cfg, 'head')
    print("✅ Migraciones aplicadas exitosamente")
except Exception as e:
    print(f"❌ Error al aplicar migraciones: {str(e)}")
    raise
