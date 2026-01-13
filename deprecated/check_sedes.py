import sqlite3

conn = sqlite3.connect('data/inventario_patrimonial.db')
c = conn.cursor()

# Ver columnas de bienes
c.execute('PRAGMA table_info(bienes)')
print("Columnas de la tabla bienes:")
for col in c.fetchall():
    print(f"  {col[1]} ({col[2]})")

print("\n" + "="*50 + "\n")

# Ver distribución por sede (columna de texto)
c.execute('SELECT sede, COUNT(*) FROM bienes GROUP BY sede LIMIT 10')
print("Bienes por sede (columna texto):")
for row in c.fetchall():
    print(f"  {row[0]}: {row[1]}")

print("\n" + "="*50 + "\n")

# Ver distribución por sede_id
c.execute('SELECT sede_id, COUNT(*) FROM bienes GROUP BY sede_id')
print("Bienes por sede_id:")
for row in c.fetchall():
    print(f"  sede_id={row[0]}: {row[1]}")

conn.close()
