# FASE 2: IMPORTACIÓN/EXPORTACIÓN - IMPLEMENTACIÓN LOCAL

**Tiempo estimado**: 6-8 horas
**Dificultad**: ⭐⭐ MEDIA
**Riesgo**: 🟡 BAJO-MEDIO (validación es crítica)

---

## 📋 QUÉ HAREMOS EN FASE 2

```
1. ✅ Crear ImportService y ExportService   ← YA HECHO
2. ⏳ Agregar rutas Flask (POST/GET)
3. ⏳ Crear templates HTML (formularios)
4. ⏳ Agregar método repository
5. ⏳ Probar localmente
```

---

## ✅ CAMBIOS YA REALIZADOS

### 1. ImportService y ExportService creados

**Archivo**: `app/services/import_export_service.py` (500+ líneas)

**Funcionalidades implementadas:**
- ✅ Importar Excel (con validación por fila)
- ✅ Importar CSV (UTF-8 y Latin-1)
- ✅ Exportar CSV
- ✅ Exportar Excel (con formato)
- ✅ Exportar PDF
- ✅ Generar plantilla estándar
- ✅ Manejo robusto de errores

---

## 📝 PRÓXIMOS PASOS - AGREGAR RUTAS

### Paso 1: Modificar `app/main/routes.py`

Agregar estas rutas al archivo `app/main/routes.py`:

```python
# Al inicio del archivo, agregar imports
from app.services.import_export_service import ImportService, ExportService
from werkzeug.utils import secure_filename
import os
from flask import send_file

# Constantes
UPLOAD_FOLDER = 'uploads/import'
ALLOWED_EXTENSIONS = {'xlsx', 'xls', 'csv'}

def allowed_file(filename):
    """Verificar extensión permitida"""
    return '.' in filename and filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS

# ====================== RUTAS DE IMPORTACIÓN ======================

@main.route('/importar', methods=['GET', 'POST'])
@login_required
def importar_bienes():
    """Página de importación de bienes"""
    if request.method == 'POST':
        # Verificar que hay archivo
        if 'archivo' not in request.files:
            flash('No se seleccionó archivo', 'danger')
            return redirect(request.url)

        archivo = request.files['archivo']

        if archivo.filename == '':
            flash('No se seleccionó archivo', 'danger')
            return redirect(request.url)

        # Validar extensión
        if not allowed_file(archivo.filename):
            flash('Tipo de archivo no permitido (usar Excel o CSV)', 'danger')
            return redirect(request.url)

        # Crear directorio si no existe
        os.makedirs(UPLOAD_FOLDER, exist_ok=True)

        # Guardar archivo temporal
        filename = secure_filename(archivo.filename)
        temp_path = os.path.join(UPLOAD_FOLDER, filename)
        archivo.save(temp_path)

        try:
            # Procesar importación
            resultado = ImportService.importar_excel(temp_path, current_user.username)
        finally:
            # Limpiar archivo temporal
            if os.path.exists(temp_path):
                os.remove(temp_path)

        # Mostrar resultado
        return render_template('importar/resultado.html', resultado=resultado)

    return render_template('importar/formulario.html')


@main.route('/descargar-plantilla')
@login_required
def descargar_plantilla():
    """Descargar plantilla Excel vacía para importación"""
    wb = ExportService.generar_plantilla_importacion()

    output = io.BytesIO()
    wb.save(output)
    output.seek(0)

    return send_file(
        output,
        mimetype='application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
        as_attachment=True,
        download_name='plantilla_importacion.xlsx'
    )


# ====================== RUTAS DE EXPORTACIÓN ======================

@main.route('/exportar/<formato>')
@login_required
def exportar_bienes(formato):
    """Exportar bienes en diferentes formatos"""
    filtros = request.args.to_dict()

    if formato == 'csv':
        content = ExportService.exportar_csv(filtros)
        return Response(
            content,
            mimetype='text/csv',
            headers={'Content-Disposition': 'attachment;filename=bienes.csv'}
        )

    elif formato == 'excel':
        wb = ExportService.exportar_excel(filtros)
        output = io.BytesIO()
        wb.save(output)
        output.seek(0)

        return send_file(
            output,
            mimetype='application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
            as_attachment=True,
            download_name='bienes.xlsx'
        )

    elif formato == 'pdf':
        pdf = ExportService.exportar_pdf(filtros)
        return send_file(
            pdf,
            mimetype='application/pdf',
            as_attachment=True,
            download_name='bienes.pdf'
        )

    else:
        flash('Formato no soportado', 'danger')
        return redirect(url_for('main.index'))
```

---

## 🎨 PASO 2: CREAR TEMPLATES HTML

### Template 1: `app/templates/importar/formulario.html`

```html
{% extends 'base.html' %}

{% block content %}
<div class="container mt-5">
    <div class="row">
        <div class="col-md-8 offset-md-2">
            <h1 class="mb-4">Importar Bienes</h1>

            <!-- Instrucciones -->
            <div class="alert alert-info">
                <h5>Cómo importar bienes:</h5>
                <ol>
                    <li>
                        <a href="{{ url_for('main.descargar_plantilla') }}" class="alert-link">
                            Descargar plantilla Excel
                        </a>
                    </li>
                    <li>Llenar la plantilla con tus datos</li>
                    <li>Subir el archivo Excel o CSV</li>
                    <li>Revisar resultados</li>
                </ol>
            </div>

            <!-- Formulario de upload -->
            <form method="POST" enctype="multipart/form-data" class="card p-4">
                <div class="form-group mb-3">
                    <label for="archivo" class="form-label">Seleccionar archivo:</label>
                    <input type="file" class="form-control" id="archivo" name="archivo"
                           accept=".xlsx,.xls,.csv" required>
                    <small class="form-text text-muted">
                        Formatos soportados: .xlsx, .xls, .csv
                    </small>
                </div>

                <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                    <button type="submit" class="btn btn-primary">Importar</button>
                    <a href="{{ url_for('main.index') }}" class="btn btn-secondary">Cancelar</a>
                </div>
            </form>

            <!-- Ejemplo de estructura -->
            <div class="mt-5">
                <h5>Estructura esperada de la plantilla:</h5>
                <table class="table table-sm table-striped">
                    <thead class="table-light">
                        <tr>
                            <th>Código Patrimonial</th>
                            <th>Denominación</th>
                            <th>Sede ID</th>
                            <th>Estado</th>
                            <th>Marca</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>PATRI-2025-001</td>
                            <td>Computadora HP</td>
                            <td>1</td>
                            <td>Bueno</td>
                            <td>HP</td>
                        </tr>
                        <tr>
                            <td>PATRI-2025-002</td>
                            <td>Escritorio</td>
                            <td>2</td>
                            <td>Regular</td>
                            <td>Furniture Co</td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <!-- Validaciones -->
            <div class="mt-4">
                <h5>Validaciones que se aplican:</h5>
                <ul>
                    <li>Código patrimonial: requerido, máximo 50 caracteres, debe ser único</li>
                    <li>Denominación: requerido, máximo 200 caracteres</li>
                    <li>Sede: requerido, debe ser un número válido</li>
                    <li>Estado: debe ser uno de: b, r, m, Bueno, Regular, Malo</li>
                    <li>Cada error se reporta por fila (no fallar el lote completo)</li>
                </ul>
            </div>
        </div>
    </div>
</div>
{% endblock %}
```

### Template 2: `app/templates/importar/resultado.html`

```html
{% extends 'base.html' %}

{% block content %}
<div class="container mt-5">
    <div class="row">
        <div class="col-md-8 offset-md-2">
            <h1 class="mb-4">Resultado de Importación</h1>

            <!-- Resumen -->
            <div class="card mb-4">
                <div class="card-body">
                    <h5 class="card-title">Resumen</h5>
                    <p class="mb-2">
                        <strong>Total procesados:</strong> {{ resultado.total_procesados }}
                    </p>
                    <p class="mb-2">
                        <strong class="text-success">✓ Creados exitosamente:</strong> {{ resultado.creados }}
                    </p>
                    <p>
                        <strong class="text-danger">✗ Errores encontrados:</strong> {{ resultado.errores|length }}
                    </p>
                </div>
            </div>

            <!-- Estado general -->
            {% if resultado.success %}
            <div class="alert alert-success" role="alert">
                <h4 class="alert-heading">¡Importación exitosa!</h4>
                <p>{{ resultado.mensaje }}</p>
            </div>
            {% else %}
            <div class="alert alert-warning" role="alert">
                <h4 class="alert-heading">Importación parcial</h4>
                <p>{{ resultado.mensaje }}</p>
                <p>Se encontraron errores en algunas filas. Ver detalles abajo.</p>
            </div>
            {% endif %}

            <!-- Errores si los hay -->
            {% if resultado.errores %}
            <div class="card">
                <div class="card-header bg-danger text-white">
                    Errores encontrados ({{ resultado.errores|length }})
                </div>
                <div class="card-body p-0">
                    <table class="table table-sm table-striped mb-0">
                        <thead class="table-light">
                            <tr>
                                <th style="width: 80px;">Fila</th>
                                <th style="width: 150px;">Código</th>
                                <th>Error</th>
                            </tr>
                        </thead>
                        <tbody>
                            {% for error in resultado.errores %}
                            <tr>
                                <td>{{ error.fila }}</td>
                                <td><code>{{ error.codigo }}</code></td>
                                <td>
                                    {% if error.errores %}
                                        <small>{{ error.errores|join(', ') }}</small>
                                    {% else %}
                                        <small>{{ error.error }}</small>
                                    {% endif %}
                                </td>
                            </tr>
                            {% endfor %}
                        </tbody>
                    </table>
                </div>
            </div>
            {% endif %}

            <!-- Botones de acción -->
            <div class="mt-4">
                <a href="{{ url_for('main.importar_bienes') }}" class="btn btn-primary">
                    📥 Importar más bienes
                </a>
                <a href="{{ url_for('main.listar_bienes') }}" class="btn btn-success">
                    📋 Ver todos los bienes
                </a>
                <a href="{{ url_for('main.index') }}" class="btn btn-secondary">
                    🏠 Volver al inicio
                </a>
            </div>
        </div>
    </div>
</div>
{% endblock %}
```

---

## 🔧 PASO 3: AGREGAR MÉTODO AL REPOSITORY

Agregar a `app/repository.py`:

```python
def obtener_bien_por_codigo(self, codigo_patrimonial):
    """
    Obtener bien por código patrimonial

    Args:
        codigo_patrimonial: Código único del bien

    Returns:
        Objeto Bien o None
    """
    return Bien.query.filter_by(codigo_patrimonial=codigo_patrimonial).first()
```

---

## ✅ PASO 4: AGREGAR DEPENDENCIAS

```bash
# Activar entorno virtual
source venv/bin/activate  # Linux/Mac
# o
venv\Scripts\activate  # Windows

# Instalar dependencias
pip install openpyxl pandas reportlab

# Verificar que se instalaron
pip list | grep -E "openpyxl|pandas|reportlab"
```

---

## 🧪 PASO 5: PROBAR LOCALMENTE

### Test 1: Verificar que rutas funcionan

```bash
# Ejecutar Flask
flask run

# En navegador:
# http://localhost:5000/importar       ← Debe cargar formulario
# http://localhost:5000/descargar-plantilla  ← Debe descargar Excel
```

### Test 2: Probar importación

1. Descargar plantilla
2. Llenar con datos:
   ```
   Código Patrimonial: TEST-001
   Denominación: Computadora HP
   Sede ID: 1
   Estado: Bueno
   ```
3. Subir archivo
4. Verificar resultado

### Test 3: Probar exportación

```bash
# En navegador:
# http://localhost:5000/exportar/csv    ← Descargar CSV
# http://localhost:5000/exportar/excel  ← Descargar Excel
# http://localhost:5000/exportar/pdf    ← Descargar PDF
```

---

## 📊 CHECKLIST FASE 2

```
CREACIÓN DE ARCHIVOS:
  [ ] ImportService creado (app/services/import_export_service.py)
  [ ] ExportService creado (mismo archivo)
  [ ] __init__.py en services/ creado

RUTAS FLASK:
  [ ] /importar (GET/POST) agregada
  [ ] /descargar-plantilla agregada
  [ ] /exportar/<formato> agregada
  [ ] Método obtener_bien_por_codigo() agregado al repository

TEMPLATES:
  [ ] app/templates/importar/formulario.html creado
  [ ] app/templates/importar/resultado.html creado

DEPENDENCIAS:
  [ ] pip install openpyxl pandas reportlab completado
  [ ] pip list muestra las 3 dependencias

TESTING LOCAL:
  [ ] flask run ejecuta sin errores
  [ ] /importar carga el formulario
  [ ] /descargar-plantilla descarga Excel
  [ ] Importación valida datos correctamente
  [ ] Exportación genera CSV/Excel/PDF
  [ ] 29/29 tests siguen pasando

¿TODO OK? → COMPLETADA FASE 2
```

---

## 🎯 CARACTERÍSTICAS IMPLEMENTADAS

```
IMPORTACIÓN:
  ✅ Excel (.xlsx, .xls)
  ✅ CSV (UTF-8, Latin-1)
  ✅ Validación por fila (no fallar todo)
  ✅ Detección automática de códigos duplicados
  ✅ Reporte detallado de errores
  ✅ Manejo robusto de excepciones

EXPORTACIÓN:
  ✅ CSV (con encoding UTF-8)
  ✅ Excel (con formato y estilos)
  ✅ PDF (profesional y bonito)
  ✅ Filtros aplicados a exportación
  ✅ Manejo de fechas y valores nulos

PLANTILLA:
  ✅ Excel con estructura correcta
  ✅ Ejemplo de datos
  ✅ Instrucciones incluidas
```

---

## 📈 TIEMPO POR COMPONENTE

```
ImportService/ExportService:  ✅ 1-2h (YA HECHO)
Rutas Flask:                  1-2h
Templates HTML:               1-1.5h
Testing:                      1-2h
Debugging:                    1-2h (si es necesario)

TOTAL:                        5-8 horas
```

---

## 🔄 SI ALGO FALLA

### Error: "ModuleNotFoundError: No module named 'openpyxl'"

```bash
pip install openpyxl pandas reportlab
```

### Error: "Template not found"

Verificar que los HTML están en:
```
app/templates/importar/
├── formulario.html
└── resultado.html
```

### Error en validación

Revisar que `validate_bien_data()` en `app/utils.py` existe y funciona correctamente.

---

## ✨ RESUMEN FASE 2

```
ANTES:
  ❌ Importación manual de bienes (lento)
  ❌ Sin exportación
  ❌ Sin plantillas

DESPUÉS:
  ✅ Importar Excel/CSV automáticamente
  ✅ Exportar CSV/Excel/PDF
  ✅ Plantilla estándar descargable
  ✅ Validación robusta
  ✅ Reportes de error detallados

IMPACTO: 10-20 minutos ahorrados por lote de datos
```

---

## 🚀 PRÓXIMO PASO

Una vez FASE 2 completada:

**PASAR A FASE 3: REPORTES PERSONALIZADOS** (10 horas)
- Gráficos con Chart.js
- Reportes automáticos
- Emails

Ver: `PLAN_FASE3_REPORTES_USUARIOS.md`

---

**Necesita ayuda con FASE 2? Revisa el código en:**
- `app/services/import_export_service.py` (500+ líneas, listo para usar)
- Los templates HTML arriba (copiar/pegar)
- Las rutas Flask arriba (copiar/pegar a routes.py)

