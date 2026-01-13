# PLAN DE IMPLEMENTACIÓN - OPCIÓN B (3 SEMANAS)

**Fecha**: 27 de Noviembre de 2025
**Roadmap**: BALANCEADO (3 semanas)
**Top 3 Mejoras**: Importación/Exportación + Reportes + Gestión Usuarios
**Servidor**: Ubuntu dedicado, 1TB disco
**Email**: Postfix configurado

---

## 📊 RESUMEN EJECUTIVO

**Objetivo**: Llevar sistema a **PRODUCCIÓN v1.3 COMPLETO** en 3 semanas con todas las funciones principales.

**Timeline**:
- **Días 1-2** (1 hora): Performance fixes (Índices + Connection Pooling)
- **Día 3-5** (13 horas): Búsqueda Avanzada + Importación/Exportación
- **Día 6-8** (15 horas): Reportes + Gestión de Usuarios
- **Día 9-12** (Testing): Validación exhaustiva
- **Semana 3**: Deploy a Ubuntu

**Total**: ~40 horas = 5-6 días de trabajo concentrado

---

## ⚙️ FASE 0: PREPARACIÓN UBUNTU (PRE-REQUISITOS)

### Paso 1: Verificar versión Ubuntu
```bash
lsb_release -a
# Esperado: Ubuntu 20.04 LTS o superior
```

### Paso 2: Actualizar sistema
```bash
sudo apt-get update
sudo apt-get upgrade -y
```

### Paso 3: Instalar dependencias del sistema
```bash
sudo apt-get install -y \
    python3.10 \
    python3.10-venv \
    python3-pip \
    git \
    postgresql \
    postgresql-contrib \
    postfix \
    mailutils \
    sqlite3 \
    libpq-dev \
    build-essential \
    libssl-dev \
    libffi-dev
```

### Paso 4: Crear usuario para la aplicación
```bash
sudo useradd -m -s /bin/bash patrimonial
sudo usermod -aG sudo patrimonial
su - patrimonial
```

### Paso 5: Clonar repositorio
```bash
cd /opt
sudo mkdir -p /opt/control_patrimonial
sudo chown patrimonial:patrimonial /opt/control_patrimonial
cd /opt/control_patrimonial
git clone <tu-repo> .
# O copiar archivos locales
```

### Paso 6: Crear entorno virtual
```bash
cd /opt/control_patrimonial
python3.10 -m venv venv
source venv/bin/activate
pip install --upgrade pip setuptools wheel
```

---

## 🔧 FASE 1: PERFORMANCE FIXES (1 hora) - DÍAS 1-2

### Mejora 1.1: Índices de BD

**Archivo**: `app/models_sqlalchemy.py`

```python
# Agregar al final de la clase Bien:
from sqlalchemy import Index

class Bien(db.Model):
    # ... campos existentes ...

    __table_args__ = (
        Index('idx_bien_usuario_registro', 'usuario_registro'),
        Index('idx_bien_fecha_registro', 'fecha_registro'),
        Index('idx_bien_cal_2025', 'cal_2025'),
        Index('idx_bien_estado_sede', 'estado', 'sede_id'),
        Index('idx_historial_bien_usuario', 'bien_id', 'usuario'),
    )
```

**Comando de migración:**
```bash
flask db migrate -m "Add performance indexes"
flask db upgrade
```

**Verificación:**
```bash
sqlite3 data/inventario_patrimonial.db ".indexes bienes"
# Debe mostrar los 5 índices creados
```

---

### Mejora 1.2: Connection Pooling

**Archivo**: `config.py`

```python
class ProductionConfig(Config):
    SQLALCHEMY_ENGINE_OPTIONS = {
        'pool_size': 10,           # Máximo de conexiones activas
        'pool_recycle': 3600,      # Reciclar conexiones cada 1 hora
        'pool_pre_ping': True,     # Verificar conexión antes de usar
        'max_overflow': 20,        # Conexiones adicionales si necesario
    }

class DevelopmentConfig(Config):
    SQLALCHEMY_ENGINE_OPTIONS = {
        'pool_size': 5,
        'pool_recycle': 1800,
        'pool_pre_ping': True,
    }
```

**Testing:**
```bash
# Ejecutar test_sistema.py para verificar
python test_sistema.py
# Esperado: 29/29 tests PASS
```

---

## 📥 FASE 2: IMPORTACIÓN/EXPORTACIÓN (6-8h) - DÍAS 3-4

### Paso 1: Instalar dependencias
```bash
pip install openpyxl pandas reportlab Pillow
```

### Paso 2: Crear servicio de importación

**Archivo**: `app/services/import_service.py` (NUEVO)

```python
"""
Servicio de importación de bienes desde Excel/CSV
"""
import pandas as pd
from datetime import datetime
from app.repository import RepoSQLAlchemy as Repo
from app.utils import validate_bien_data

class ImportService:
    """Gestiona importación de bienes desde archivos"""

    @staticmethod
    def importar_excel(archivo_path, usuario_actual):
        """
        Importar bienes desde archivo Excel

        Returns:
            {
                'success': bool,
                'creados': int,
                'errores': list,
                'total_procesados': int
            }
        """
        try:
            df = pd.read_excel(archivo_path)
            repo = Repo()

            errores = []
            creados = 0

            for idx, row in df.iterrows():
                try:
                    # Construir diccionario de datos
                    data = {
                        'codigo_patrimonial': str(row.get('Código Patrimonial', '')).strip(),
                        'denominacion': str(row.get('Denominación', '')).strip(),
                        'sede': str(row.get('Sede ID', '')).strip(),
                        'estado': str(row.get('Estado', '')).strip(),
                        'unidad': str(row.get('Unidad', '')).strip() if 'Unidad' in row else '',
                        'marca': str(row.get('Marca', '')).strip() if 'Marca' in row else '',
                        'modelo': str(row.get('Modelo', '')).strip() if 'Modelo' in row else '',
                        'serie': str(row.get('Serie', '')).strip() if 'Serie' in row else '',
                        'ubicacion': str(row.get('Ubicación', '')).strip() if 'Ubicación' in row else '',
                    }

                    # Validar datos
                    validation_errors = validate_bien_data(data)

                    if validation_errors:
                        errores.append({
                            'fila': idx + 2,  # +2 porque Excel es 1-indexed y tiene header
                            'codigo': data.get('codigo_patrimonial', 'SIN_CÓDIGO'),
                            'errores': validation_errors
                        })
                    else:
                        # Verificar que no exista el código patrimonial
                        bien_existe = repo.obtener_bien_por_codigo(data['codigo_patrimonial'])

                        if bien_existe:
                            errores.append({
                                'fila': idx + 2,
                                'codigo': data['codigo_patrimonial'],
                                'errores': ['Código patrimonial ya existe en la BD']
                            })
                        else:
                            # Crear bien
                            repo.crear_bien(data, usuario_actual)
                            creados += 1

                except Exception as e:
                    errores.append({
                        'fila': idx + 2,
                        'error': f'Error procesando fila: {str(e)}'
                    })

            return {
                'success': len(errores) == 0,
                'creados': creados,
                'errores': errores,
                'total_procesados': len(df),
                'mensaje': f'Importados {creados} de {len(df)} bienes'
            }

        except Exception as e:
            return {
                'success': False,
                'creados': 0,
                'errores': [f'Error al leer archivo: {str(e)}'],
                'total_procesados': 0
            }

    @staticmethod
    def importar_csv(archivo_path, usuario_actual):
        """Importar desde CSV (similar a Excel)"""
        try:
            df = pd.read_csv(archivo_path, encoding='utf-8')
            return ImportService.importar_excel(archivo_path, usuario_actual)
        except UnicodeDecodeError:
            # Reintentar con encoding diferente
            df = pd.read_csv(archivo_path, encoding='latin-1')
            return ImportService.importar_excel(archivo_path, usuario_actual)
```

### Paso 3: Crear servicio de exportación

**Archivo**: `app/services/export_service.py` (NUEVO)

```python
"""
Servicio de exportación de bienes a múltiples formatos
"""
import io
import csv
from datetime import datetime
from openpyxl import Workbook
from openpyxl.styles import Font, PatternFill, Alignment
from reportlab.lib import colors
from reportlab.lib.pagesizes import letter, A4
from reportlab.platypus import SimpleDocTemplate, Table, TableStyle, Paragraph, Spacer
from reportlab.lib.styles import getSampleStyleSheet, ParagraphStyle
from reportlab.lib.units import inch
from app.repository import RepoSQLAlchemy as Repo

class ExportService:
    """Gestiona exportación de bienes a múltiples formatos"""

    @staticmethod
    def exportar_csv(filtros=None):
        """Exportar a CSV"""
        repo = Repo()
        bienes = repo.listar_bienes(filtros or {})

        output = io.StringIO()
        if not bienes:
            return output

        # Campos a exportar
        campos = ['id', 'codigo_patrimonial', 'denominacion', 'estado',
                 'sede_nombre', 'unidad_nombre', 'marca', 'modelo',
                 'serie', 'ubicacion', 'fecha_registro']

        writer = csv.DictWriter(output, fieldnames=campos)
        writer.writeheader()

        for bien in bienes:
            # Crear fila con campos disponibles
            fila = {campo: bien.get(campo, '') for campo in campos}
            writer.writerow(fila)

        return output.getvalue()

    @staticmethod
    def exportar_excel(filtros=None, titulo='Reporte de Bienes'):
        """Exportar a Excel con formato"""
        repo = Repo()
        bienes = repo.listar_bienes(filtros or {})

        wb = Workbook()
        ws = wb.active
        ws.title = 'Bienes'

        # Estilos
        header_fill = PatternFill(start_color='4472C4', end_color='4472C4', fill_type='solid')
        header_font = Font(bold=True, color='FFFFFF')

        # Encabezados
        headers = ['ID', 'Código', 'Denominación', 'Estado', 'Sede', 'Unidad',
                  'Marca', 'Modelo', 'Serie', 'Ubicación', 'Fecha Registro']

        for col_num, header in enumerate(headers, 1):
            cell = ws.cell(row=1, column=col_num, value=header)
            cell.fill = header_fill
            cell.font = header_font
            cell.alignment = Alignment(horizontal='center', vertical='center')

        # Datos
        for row_num, bien in enumerate(bienes, 2):
            ws.cell(row=row_num, column=1, value=bien.get('id', ''))
            ws.cell(row=row_num, column=2, value=bien.get('codigo_patrimonial', ''))
            ws.cell(row=row_num, column=3, value=bien.get('denominacion', ''))
            ws.cell(row=row_num, column=4, value=bien.get('estado', ''))
            ws.cell(row=row_num, column=5, value=bien.get('sede_nombre', ''))
            ws.cell(row=row_num, column=6, value=bien.get('unidad_nombre', ''))
            ws.cell(row=row_num, column=7, value=bien.get('marca', ''))
            ws.cell(row=row_num, column=8, value=bien.get('modelo', ''))
            ws.cell(row=row_num, column=9, value=bien.get('serie', ''))
            ws.cell(row=row_num, column=10, value=bien.get('ubicacion', ''))
            ws.cell(row=row_num, column=11, value=bien.get('fecha_registro', ''))

        # Auto-ajustar columnas
        for col in ws.columns:
            max_length = 0
            column = col[0].column_letter
            for cell in col:
                try:
                    if len(str(cell.value)) > max_length:
                        max_length = len(cell.value)
                except:
                    pass
            adjusted_width = (max_length + 2)
            ws.column_dimensions[column].width = adjusted_width

        return wb

    @staticmethod
    def exportar_pdf(filtros=None, titulo='Reporte de Bienes Patrimoniales'):
        """Exportar a PDF"""
        repo = Repo()
        bienes = repo.listar_bienes(filtros or {}, limit=10000)

        # Crear PDF en memoria
        pdf_buffer = io.BytesIO()
        doc = SimpleDocTemplate(pdf_buffer, pagesize=letter)
        elements = []

        # Estilos
        styles = getSampleStyleSheet()
        title_style = ParagraphStyle(
            'CustomTitle',
            parent=styles['Heading1'],
            fontSize=18,
            textColor=colors.HexColor('#1F4E78'),
            spaceAfter=20,
            alignment=1  # Centrado
        )

        # Título
        elements.append(Paragraph(titulo, title_style))
        elements.append(Spacer(1, 0.3*inch))

        # Información de generación
        fecha_gen = datetime.now().strftime('%d/%m/%Y %H:%M:%S')
        info_style = ParagraphStyle('Info', parent=styles['Normal'], fontSize=9)
        elements.append(Paragraph(f'Generado: {fecha_gen} | Total de bienes: {len(bienes)}', info_style))
        elements.append(Spacer(1, 0.2*inch))

        # Tabla de datos
        data = [['Código', 'Denominación', 'Estado', 'Sede', 'Ubicación']]

        for bien in bienes[:100]:  # Limitar a 100 por página (PDF es grande)
            data.append([
                str(bien.get('codigo_patrimonial', ''))[:15],
                str(bien.get('denominacion', ''))[:30],
                str(bien.get('estado', ''))[:10],
                str(bien.get('sede_nombre', ''))[:15],
                str(bien.get('ubicacion', ''))[:20]
            ])

        table = Table(data, colWidths=[1.2*inch, 2*inch, 0.8*inch, 1.2*inch, 1.3*inch])
        table.setStyle(TableStyle([
            ('BACKGROUND', (0, 0), (-1, 0), colors.HexColor('#4472C4')),
            ('TEXTCOLOR', (0, 0), (-1, 0), colors.whitesmoke),
            ('ALIGN', (0, 0), (-1, -1), 'CENTER'),
            ('FONTNAME', (0, 0), (-1, 0), 'Helvetica-Bold'),
            ('FONTSIZE', (0, 0), (-1, 0), 10),
            ('BOTTOMPADDING', (0, 0), (-1, 0), 12),
            ('BACKGROUND', (0, 1), (-1, -1), colors.beige),
            ('GRID', (0, 0), (-1, -1), 1, colors.black),
            ('FONTSIZE', (0, 1), (-1, -1), 8),
        ]))

        elements.append(table)

        doc.build(elements)
        pdf_buffer.seek(0)
        return pdf_buffer
```

### Paso 4: Crear rutas

**Archivo**: `app/main/routes.py` (AGREGAR)

```python
from app.services.import_service import ImportService
from app.services.export_service import ExportService
from werkzeug.utils import secure_filename
import os

UPLOAD_FOLDER = 'uploads/import'
ALLOWED_EXTENSIONS = {'xlsx', 'xls', 'csv'}

@main.route('/importar', methods=['GET', 'POST'])
@login_required
@requiere_permiso('crear')  # Solo usuarios que puedan crear bienes
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
        if not ('.' in archivo.filename and
                archivo.filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS):
            flash('Tipo de archivo no permitido (usar Excel o CSV)', 'danger')
            return redirect(request.url)

        # Guardar archivo temporal
        filename = secure_filename(archivo.filename)
        temp_path = os.path.join(UPLOAD_FOLDER, filename)
        os.makedirs(UPLOAD_FOLDER, exist_ok=True)
        archivo.save(temp_path)

        # Procesar importación
        resultado = ImportService.importar_excel(temp_path, current_user.username)

        # Limpiar archivo temporal
        os.remove(temp_path)

        # Mostrar resultado
        if resultado['success']:
            flash(f"✅ {resultado['mensaje']}", 'success')
        else:
            if resultado['errores']:
                flash(f"⚠️ {resultado['mensaje']} - Errores encontrados", 'warning')
            else:
                flash(f"❌ Error: {resultado['errores'][0]}", 'danger')

        # Mostrar errores si los hay
        return render_template('importar/resultado.html', resultado=resultado)

    return render_template('importar/formulario.html')

@main.route('/descargar-plantilla')
def descargar_plantilla():
    """Descargar plantilla Excel vacía para importación"""
    wb = Workbook()
    ws = wb.active
    ws.title = 'Bienes'

    # Headers
    headers = ['Código Patrimonial', 'Denominación', 'Sede ID', 'Estado',
              'Unidad', 'Marca', 'Modelo', 'Serie', 'Ubicación']
    ws.append(headers)

    # Ejemplo
    ws.append(['PATRI-2025-001', 'Equipo de Ejemplo', '1', 'Bueno',
              'Administración', 'Marca X', 'Modelo Y', 'SN123456', 'Oficina 1'])

    # Guardar en memoria
    output = io.BytesIO()
    wb.save(output)
    output.seek(0)

    return send_file(
        output,
        mimetype='application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
        as_attachment=True,
        download_name='plantilla_importacion.xlsx'
    )

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

### Paso 5: Crear templates

**Archivo**: `app/templates/importar/formulario.html` (NUEVO)

```html
{% extends 'base.html' %}

{% block content %}
<div class="container mt-5">
    <div class="row">
        <div class="col-md-8 offset-md-2">
            <h1 class="mb-4">Importar Bienes</h1>

            <!-- Instrucciones -->
            <div class="alert alert-info">
                <h5>Cómo usar:</h5>
                <ol>
                    <li><a href="{{ url_for('main.descargar_plantilla') }}" class="alert-link">Descargar plantilla</a></li>
                    <li>Llenar la plantilla con tus datos</li>
                    <li>Subir el archivo Excel o CSV</li>
                    <li>Verificar resultados</li>
                </ol>
            </div>

            <!-- Formulario -->
            <form method="POST" enctype="multipart/form-data">
                <div class="form-group mb-3">
                    <label for="archivo">Seleccionar archivo (Excel o CSV):</label>
                    <input type="file" class="form-control" id="archivo" name="archivo"
                           accept=".xlsx,.xls,.csv" required>
                    <small class="form-text text-muted">
                        Formatos soportados: .xlsx, .xls, .csv
                    </small>
                </div>

                <button type="submit" class="btn btn-primary">Importar</button>
                <a href="{{ url_for('main.index') }}" class="btn btn-secondary">Cancelar</a>
            </form>

            <!-- Ejemplo de estructura -->
            <div class="mt-5">
                <h5>Estructura esperada:</h5>
                <table class="table table-sm">
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
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
{% endblock %}
```

**Archivo**: `app/templates/importar/resultado.html` (NUEVO)

```html
{% extends 'base.html' %}

{% block content %}
<div class="container mt-5">
    <div class="row">
        <div class="col-md-8 offset-md-2">
            <h1 class="mb-4">Resultado de Importación</h1>

            <!-- Resumen -->
            <div class="alert alert-primary">
                <h5>Resumen</h5>
                <p>Total procesados: <strong>{{ resultado.total_procesados }}</strong></p>
                <p>Creados exitosamente: <strong class="text-success">{{ resultado.creados }}</strong></p>
                <p>Errores encontrados: <strong class="text-danger">{{ resultado.errores|length }}</strong></p>
            </div>

            <!-- Errores si los hay -->
            {% if resultado.errores %}
            <div class="alert alert-warning">
                <h5>Errores encontrados:</h5>
                <table class="table table-sm table-striped">
                    <thead>
                        <tr>
                            <th>Fila</th>
                            <th>Código</th>
                            <th>Error</th>
                        </tr>
                    </thead>
                    <tbody>
                        {% for error in resultado.errores %}
                        <tr>
                            <td>{{ error.fila }}</td>
                            <td>{{ error.codigo }}</td>
                            <td>
                                {% if error.errores %}
                                    {{ error.errores|join(', ') }}
                                {% else %}
                                    {{ error.error }}
                                {% endif %}
                            </td>
                        </tr>
                        {% endfor %}
                    </tbody>
                </table>
            </div>
            {% endif %}

            <!-- Botones de acción -->
            <div class="mt-4">
                <a href="{{ url_for('main.importar_bienes') }}" class="btn btn-primary">Importar más bienes</a>
                <a href="{{ url_for('main.index') }}" class="btn btn-secondary">Volver al inicio</a>
            </div>
        </div>
    </div>
</div>
{% endblock %}
```

### Paso 6: Agregar método al repository

**Archivo**: `app/repository.py` (AGREGAR)

```python
def obtener_bien_por_codigo(self, codigo_patrimonial):
    """Obtener bien por código patrimonial"""
    return Bien.query.filter_by(codigo_patrimonial=codigo_patrimonial).first()
```

---

## 📊 FASE 3: REPORTES PERSONALIZADOS (7-10h) - DÍAS 5-7

**(Continuará en siguiente sección...)**

**Nota**: Este es un plan MUY LARGO. Continuaré con:
- Reportes (servicios, gráficos Chart.js, scheduler)
- Gestión de usuarios (roles, reset password)
- Postfix configuración
- Scripts de deployment
- Testing checklist
- Guía de deployment final

¿Quieres que continúe con las Fases 3-5 en el próximo mensaje?

