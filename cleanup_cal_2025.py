
import os
import re
from app import create_app, db
from app.models_sqlalchemy import Bien, Historial
from datetime import datetime

# Script para limpiar masivamente los prefijos 'CAL-' en la columna cal_2025
# Esto soluciona que se vean "0" en el dashboard.

app = create_app('production')  # Usar configuración de producción para conectar a Cloud SQL

def limpiar_cal_2025():
    with app.app_context():
        print("=== INICIANDO LIMPIEZA DE CAL_2025 ===")
        
        # 1. Buscar todos los bienes que tengan algún valor en cal_2025
        # (Filtramos los nulos para no perder tiempo)
        bienes = Bien.query.filter(Bien.cal_2025 != None).all()
        
        print(f"Total de bienes con cal_2025: {len(bienes)}")
        
        modificados = 0
        errores = 0
        
        for bien in bienes:
            valor_original = bien.cal_2025
            
            # Si es un número puro (string numérica), no hacemos nada
            if valor_original.isdigit():
                continue
                
            # Limpieza: Convertir a string, quitar espacios
            nuevo_valor = str(valor_original).strip()
            
            # Quitar prefijos comunes (case insensitive)
            nuevo_valor = re.sub(r'(?i)^CAL[\s\-\']+', '', nuevo_valor)
            
            # Si después de limpiar queda algo diferente al original
            if nuevo_valor != valor_original:
                try:
                    # Verificar si el nuevo valor ya existe en otro bien (para evitar duplicados únicos)
                    existe = Bien.query.filter_by(cal_2025=nuevo_valor).first()
                    
                    if existe:
                        print(f"[SKIP] Duplicado: {valor_original} -> {nuevo_valor} (Ya existe en ID {existe.id})")
                        continue
                        
                    bien.cal_2025 = nuevo_valor
                    modificados += 1
                    
                    # Mostrar progreso cada 50 cambios
                    if modificados % 50 == 0:
                        print(f"Progreso: {modificados} corregidos...")
                        db.session.commit() # Guardar por lotes
                        
                except Exception as e:
                    print(f"[ERROR] ID {bien.id}: {valor_original} -> {e}")
                    errores += 1
                    db.session.rollback()

        # Commit final
        if modificados > 0:
            db.session.commit()
            print(f"✅ ÉXITO: Se han guardado {modificados} correcciones.")
        else:
            print("ℹ️ No se encontraron registros que necesitaran corrección.")
            
        print("=== FIN DEL PROCESO ===")

if __name__ == '__main__':
    limpiar_cal_2025()
