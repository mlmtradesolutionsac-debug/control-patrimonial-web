#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import sys
import sqlite3
import logging
from datetime import datetime
from dotenv import load_dotenv
from sqlalchemy import create_engine, inspect, text
import psycopg2

# Forzar entorno de producción para asegurar uso de PostgreSQL
os.environ['FLASK_ENV'] = 'production'

# Configurar logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s'
)
logger = logging.getLogger(__name__)
if __name__ == '__main__':
    migrator = Migrator(SQLITE_DB, POSTGRES_URL)
    migrator.ejecutar()
