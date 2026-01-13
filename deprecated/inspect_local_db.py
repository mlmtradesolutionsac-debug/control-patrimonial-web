import sqlite3
import os

db_path = 'data/inventario_patrimonial.db'

if not os.path.exists(db_path):
    print(f"Error: {db_path} no existe")
    exit(1)

conn = sqlite3.connect(db_path)
cursor = conn.cursor()

cursor.execute("SELECT name FROM sqlite_master WHERE type='table'")
tables = cursor.fetchall()

print("=== CONTENIDO LOCAL DE SQLITE ===")
print("=== CONTENIDO LOCAL DE SQLITE ===")
try:
    print(f"usuarios: {conn.execute('SELECT COUNT(*) FROM usuarios').fetchone()[0]}")
except: print("usuarios: 0 (o no existe)")

try:
    print(f"usuarios_app: {conn.execute('SELECT COUNT(*) FROM usuarios_app').fetchone()[0]}")
except: print("usuarios_app: 0 (o no existe)")

try:
    print(f"sedes: {conn.execute('SELECT COUNT(*) FROM sedes').fetchone()[0]}")
except: print("sedes: 0 (o no existe)")

try:
    print(f"unidades: {conn.execute('SELECT COUNT(*) FROM unidades').fetchone()[0]}")
except: print("unidades: 0 (o no existe)")

try:
    print(f"bienes: {conn.execute('SELECT COUNT(*) FROM bienes').fetchone()[0]}")
except: print("bienes: 0 (o no existe)")

try:
    print(f"historial: {conn.execute('SELECT COUNT(*) FROM historial').fetchone()[0]}")
except: print("historial: 0 (o no existe)")
print("=================================")
conn.close()
