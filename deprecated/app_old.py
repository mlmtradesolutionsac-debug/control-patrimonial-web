from flask import Flask, render_template, request, redirect, url_for
import sqlite3

app = Flask(__name__)

def get_db():
    conn = sqlite3.connect('data/inventario_patrimonial.db')
    conn.row_factory = sqlite3.Row
    return conn

@app.route('/')
def dashboard():
    conn = get_db()
    cursor = conn.cursor()
    # Query actualizada para reflejar la estructura real de la tabla bienes
    query = """
    SELECT id, codigo_patrimonial, cod_barras as codigo_barras, denominacion, descripcion,
           marca, modelo, serie, estado, verificado, cal_2025, sede_id, unidad_id, ambiente_id,
           ubicacion_texto, responsable, responsable_dni, fecha_inventario, fecha_registro
    FROM bienes
    LIMIT 100
    """
    cursor.execute(query)
    bienes = cursor.fetchall()
    conn.close()
    return render_template('dashboard.html', bienes=bienes)

@app.route('/nuevo_bien', methods=['GET', 'POST'])
def nuevo_bien():
    if request.method == 'POST':
        # Datos actualizados según la estructura real de la tabla bienes
        conn = get_db()
        cursor = conn.cursor()
        try:
            cursor.execute("""
                INSERT INTO bienes (
                    codigo_patrimonial, cod_barras, denominacion, descripcion, marca, modelo, serie,
                    estado, verificado, cal_2025, sede_id, unidad_id, ambiente_id, ubicacion_texto,
                    responsable, responsable_dni, fecha_inventario
                ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
            """, (
                request.form['codigo_patrimonial'],
                request.form['codigo_barras'],
                request.form['denominacion'],
                request.form['descripcion'],
                request.form['marca'],
                request.form['modelo'],
                request.form['serie'],
                request.form['estado'],
                request.form['verificado'],
                request.form['cal_2025'],
                request.form['sede_id'],
                request.form['unidad_id'],
                request.form['ambiente_id'],
                request.form['ubicacion_texto'],
                request.form['responsable'],
                request.form['responsable_dni'],
                request.form['fecha_inventario']
            ))
            conn.commit()
            conn.close()
            return redirect(url_for('dashboard'))
        except Exception as e:
            conn.close()
            # En una implementación real, sería mejor manejar el error de forma más específica
            print(f"Error al insertar: {e}")
            return render_template('nuevo_bien.html', error=str(e))
    else:
        return render_template('nuevo_bien.html')

@app.route('/editar_bien/<int:id>', methods=['GET', 'POST'])
def editar_bien(id):
    conn = get_db()
    cursor = conn.cursor()
    if request.method == 'POST':
        try:
            cursor.execute("""
                UPDATE bienes SET
                    codigo_patrimonial=?, cod_barras=?, denominacion=?, descripcion=?, marca=?,
                    modelo=?, serie=?, estado=?, verificado=?, cal_2025=?, sede_id=?, unidad_id=?,
                    ambiente_id=?, ubicacion_texto=?, responsable=?, responsable_dni=?,
                    fecha_inventario=?
                WHERE id=?
            """, (
                request.form['codigo_patrimonial'],
                request.form['codigo_barras'],
                request.form['denominacion'],
                request.form['descripcion'],
                request.form['marca'],
                request.form['modelo'],
                request.form['serie'],
                request.form['estado'],
                request.form['verificado'],
                request.form['cal_2025'],
                request.form['sede_id'],
                request.form['unidad_id'],
                request.form['ambiente_id'],
                request.form['ubicacion_texto'],
                request.form['responsable'],
                request.form['responsable_dni'],
                request.form['fecha_inventario'],
                id
            ))
            conn.commit()
            conn.close()
            return redirect(url_for('dashboard'))
        except Exception as e:
            conn.close()
            # En una implementación real, sería mejor manejar el error de forma más específica
            print(f"Error al actualizar: {e}")
            cursor.execute("SELECT * FROM bienes WHERE id=?", (id,))
            bien = cursor.fetchone()
            return render_template('editar_bien.html', bien=bien, error=str(e))
    else:
        cursor.execute("SELECT * FROM bienes WHERE id=?", (id,))
        bien = cursor.fetchone()
        conn.close()
        return render_template('editar_bien.html', bien=bien)

if __name__ == "__main__":
    app.run(debug=True)