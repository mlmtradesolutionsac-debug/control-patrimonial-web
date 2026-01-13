#!/usr/bin/env python3
"""
Script para normalizar códigos de barras agregando ceros a la izquierda.

Este script busca todos los códigos de barras que tengan números pero sin
los ceros a la izquierda, y los normaliza a 7 dígitos (0414936).

Uso:
    python normalize_cod_barras.py

Requiere:
    - Estar en el directorio raíz de la aplicación
    - Tener acceso a la base de datos configurada en .env
"""

import sys
import os
from dotenv import load_dotenv

# Cargar variables de entorno
basedir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
load_dotenv(os.path.join(basedir, '.env'))

# Agregar el directorio raíz al path de Python
sys.path.insert(0, basedir)

from app import create_app
from app.models_sqlalchemy import db, Bien
import logging

# Configurar logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s'
)
logger = logging.getLogger(__name__)

def normalize_cod_barras():
    """
    Normalizar códigos de barras agregando ceros a la izquierda.
    """
    app = create_app()

    with app.app_context():
        try:
            # Obtener todos los bienes con códigos de barras
            bienes_con_codigo = Bien.query.filter(
                Bien.cod_barras.isnot(None),
                Bien.cod_barras != ''
            ).all()

            logger.info(f"Se encontraron {len(bienes_con_codigo)} bienes con códigos de barras")

            if not bienes_con_codigo:
                logger.info("No hay códigos de barras para normalizar")
                return

            actualizados = 0
            errores = 0

            for bien in bienes_con_codigo:
                try:
                    codigo_original = bien.cod_barras.strip()

                    # Si el código contiene solo dígitos, normalizarlo a 7 caracteres
                    if codigo_original.isdigit():
                        codigo_normalizado = codigo_original.zfill(7)

                        # Solo actualizar si cambió
                        if codigo_original != codigo_normalizado:
                            logger.info(
                                f"Bien ID {bien.id}: {codigo_original:>7} -> {codigo_normalizado} "
                                f"({bien.denominacion})"
                            )
                            bien.cod_barras = codigo_normalizado
                            actualizados += 1

                except Exception as e:
                    logger.error(f"Error normalizando bien ID {bien.id}: {str(e)}")
                    errores += 1

            # Guardar cambios
            if actualizados > 0:
                try:
                    db.session.commit()
                    logger.info(f"✓ Se normalizaron {actualizados} códigos de barras exitosamente")
                except Exception as e:
                    db.session.rollback()
                    logger.error(f"Error al guardar cambios en BD: {str(e)}")
                    return False
            else:
                logger.info("No hubo cambios que realizar (todos los códigos ya estaban normalizados)")

            if errores > 0:
                logger.warning(f"Se encontraron {errores} errores durante el procesamiento")

            return True

        except Exception as e:
            logger.error(f"Error fatal en el proceso de normalización: {str(e)}")
            return False

if __name__ == '__main__':
    logger.info("========================================")
    logger.info("INICIANDO NORMALIZACIÓN DE CÓDIGOS DE BARRAS")
    logger.info("========================================")

    success = normalize_cod_barras()

    logger.info("========================================")
    if success:
        logger.info("✓ Proceso completado exitosamente")
        sys.exit(0)
    else:
        logger.error("✗ Proceso terminó con errores")
        sys.exit(1)
