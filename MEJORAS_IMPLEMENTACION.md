# Plan de Implementación - 5 Mejoras al Sistema

**Fecha**: 27 Noviembre 2025
**Estado**: En Progreso
**Prioridad**: Completar todas las 5 mejoras

---

## 1. ✅ PAGINACIÓN AJAX (COMPLETADO)

### Lo que se hizo:
- ✅ Creado: `app/static/js/pagination.js` (310 líneas)
  - Clase `PaginationManager` para manejo de paginación dinámica
  - Carga de páginas sin recargar la página
  - Reemplazo automático de tabla y controles de paginación
  - Sincronización con filtros

- ✅ Modificado: `app/templates/main/dashboard.html`
  - Agregado `id="filtrosSidebar"` al formulario de filtros
  - Eliminados `onchange="this.form.submit()"` de los selects
  - Actualizado HTML de paginación con `data-page` en lugar de `href`
  - Agregada clase `footer-pagination-info` para actualizar dinámica
  - Reemplazado script inline por importación de `pagination.js`

### Cómo funciona:
1. Usuario cambia filtro o hace clic en página
2. JavaScript captura el evento sin recargar
3. Realiza petición AJAX a `/api/bienes` con filtros
4. Actualiza tabla y controles de paginación

### Estado: **LISTO PARA PROBAR**

---

## 2. 🚀 ENDPOINTS PARA EXPORTAR/IMPORTAR (PENDIENTE)

### Qué implementar:

En `app/api/routes.py`, agregar al final:

```python
from flask import send_file
from app.services.import_export_service import ImportService, ExportService
import io

# ==================== EXPORTACIÓN ====================

@bp.route('/exportar/excel', methods=['GET'])
@login_required
def exportar_excel():
    """Exportar bienes a Excel"""
    try:
        filtros = {
            'q': request.args.get('q', ''),
            'sede': request.args.get('sede', ''),
            'dependencia': request.args.get('dependencia', ''),
            'estado': request.args.get('estado', ''),
        }

        excel_bytes = ExportService.exportar_excel(filtros)

        return send_file(
            io.BytesIO(excel_bytes),
            mimetype='application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
            as_attachment=True,
            download_name=f'bienes_{datetime.now().strftime("%Y%m%d_%H%M%S")}.xlsx'
        )
    except Exception as e:
        return api_error(f'Error exportando: {str(e)}', 500)

@bp.route('/exportar/csv', methods=['GET'])
@login_required
def exportar_csv():
    """Exportar bienes a CSV"""
    try:
        filtros = {
            'q': request.args.get('q', ''),
            'sede': request.args.get('sede', ''),
            'dependencia': request.args.get('dependencia', ''),
            'estado': request.args.get('estado', ''),
        }

        csv_bytes = ExportService.exportar_csv(filtros)

        return send_file(
            io.BytesIO(csv_bytes),
            mimetype='text/csv',
            as_attachment=True,
            download_name=f'bienes_{datetime.now().strftime("%Y%m%d_%H%M%S")}.csv'
        )
    except Exception as e:
        return api_error(f'Error exportando: {str(e)}', 500)

# ==================== IMPORTACIÓN ====================

@bp.route('/importar/plantilla', methods=['GET'])
@login_required
def descargar_plantilla():
    """Descargar plantilla Excel vacía para importación"""
    try:
        excel_bytes = ExportService.generar_plantilla_importacion()

        return send_file(
            io.BytesIO(excel_bytes),
            mimetype='application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
            as_attachment=True,
            download_name='plantilla_importacion.xlsx'
        )
    except Exception as e:
        return api_error(f'Error generando plantilla: {str(e)}', 500)

@bp.route('/importar/excel', methods=['POST'])
@login_required
def importar_excel():
    """Importar bienes desde Excel"""
    try:
        if 'archivo' not in request.files:
            return api_error('No se proporcionó archivo', 400)

        file = request.files['archivo']
        if not file or not file.filename.endswith(('.xlsx', '.xls')):
            return api_error('El archivo debe ser .xlsx o .xls', 400)

        # Guardar temporalmente
        import tempfile
        with tempfile.NamedTemporaryFile(suffix='.xlsx', delete=False) as tmp:
            file.save(tmp.name)

            # Importar
            resultado = ImportService.importar_excel(tmp.name, current_user.username)

            # Limpiar
            os.unlink(tmp.name)

        log_action('IMPORT_EXCEL', f'Importados {resultado.get("creados", 0)} bienes')

        return api_success({
            'creados': resultado.get('creados', 0),
            'errores': len(resultado.get('errores', [])),
            'total_procesados': resultado.get('total_procesados', 0),
            'detalles_errores': resultado.get('errores', [])[:10]  # Primeros 10
        })
    except Exception as e:
        return api_error(f'Error importando: {str(e)}', 500)
```

### Archivos a modificar:
- `app/api/routes.py` - Agregar los 4 endpoints arriba
- Necesita: `from datetime import datetime` e `import os` al inicio

---

## 3. 📁 FORMULARIOS DE IMPORTACIÓN (PENDIENTE)

### Qué implementar:

Agregar botones funcionales en `dashboard.html`:

```html
<!-- Reemplazar los botones disabled con: -->
<button class="btn btn-primary" id="btnExportarExcel" title="Descargar Excel con bienes actuales">
    <i class="bi bi-file-earmark-excel"></i> Exportar Excel
</button>
<button class="btn btn-primary" id="btnExportarCSV" title="Descargar CSV con bienes actuales">
    <i class="bi bi-file-earmark-text"></i> Exportar CSV
</button>
<button class="btn btn-primary" id="btnImportar" title="Subir Excel con nuevos bienes">
    <i class="bi bi-upload"></i> Importar
</button>
```

Crear modal para importar (agregar antes de `{% endblock %}`):

```html
<!-- Modal Importación -->
<div class="modal fade" id="modalImportar" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Importar Bienes</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <p class="text-muted small">Selecciona un archivo Excel (.xlsx) con los bienes a importar.</p>

                <div class="mb-3">
                    <a href="#" id="btnDescargarPlantilla" class="btn btn-outline-primary btn-sm">
                        <i class="bi bi-download"></i> Descargar plantilla
                    </a>
                </div>

                <div class="mb-3">
                    <label for="archivoImportar" class="form-label">Archivo Excel:</label>
                    <input type="file" class="form-control" id="archivoImportar" accept=".xlsx,.xls">
                </div>

                <div id="progressImportar" style="display:none;">
                    <div class="progress">
                        <div class="progress-bar progress-bar-striped progress-bar-animated"></div>
                    </div>
                </div>

                <div id="resultadoImportar" style="display:none;">
                    <div class="alert" role="alert"></div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                <button type="button" class="btn btn-primary" id="btnConfirmarImportar">Importar</button>
            </div>
        </div>
    </div>
</div>
```

Crear archivo `app/static/js/export-import.js`:

```javascript
class ExportImportManager {
    constructor() {
        this.modal = new bootstrap.Modal(document.getElementById('modalImportar'));
        this.initListeners();
    }

    initListeners() {
        document.getElementById('btnExportarExcel')?.addEventListener('click', () => this.exportarExcel());
        document.getElementById('btnExportarCSV')?.addEventListener('click', () => this.exportarCSV());
        document.getElementById('btnImportar')?.addEventListener('click', () => this.modal.show());
        document.getElementById('btnDescargarPlantilla')?.addEventListener('click', (e) => {
            e.preventDefault();
            this.descargarPlantilla();
        });
        document.getElementById('btnConfirmarImportar')?.addEventListener('click', () => this.importarExcel());
    }

    exportarExcel() {
        const filtros = new URLSearchParams(this.getFilterParams()).toString();
        window.location.href = `/api/exportar/excel?${filtros}`;
    }

    exportarCSV() {
        const filtros = new URLSearchParams(this.getFilterParams()).toString();
        window.location.href = `/api/exportar/csv?${filtros}`;
    }

    descargarPlantilla() {
        window.location.href = '/api/importar/plantilla';
    }

    getFilterParams() {
        return {
            q: document.querySelector('input[name="q"]')?.value || '',
            sede: document.querySelector('select[name="sede"]')?.value || '',
            dependencia: document.querySelector('select[name="dependencia"]')?.value || '',
            estado: document.querySelector('select[name="estado"]')?.value || ''
        };
    }

    async importarExcel() {
        const file = document.getElementById('archivoImportar').files[0];
        if (!file) {
            alert('Selecciona un archivo');
            return;
        }

        const formData = new FormData();
        formData.append('archivo', file);

        this.showProgress();

        try {
            const response = await fetch('/api/importar/excel', {
                method: 'POST',
                body: formData,
                credentials: 'same-origin'
            });

            const data = await response.json();

            if (data.success) {
                this.showResult(true, `Importados ${data.data.creados} bienes`);
                setTimeout(() => window.location.reload(), 2000);
            } else {
                this.showResult(false, data.error || 'Error en importación');
            }
        } catch (error) {
            this.showResult(false, error.message);
        }
    }

    showProgress() {
        document.getElementById('progressImportar').style.display = 'block';
        document.getElementById('resultadoImportar').style.display = 'none';
    }

    showResult(success, message) {
        document.getElementById('progressImportar').style.display = 'none';
        const resultDiv = document.getElementById('resultadoImportar');
        const alertDiv = resultDiv.querySelector('.alert');

        alertDiv.className = success ? 'alert alert-success' : 'alert alert-danger';
        alertDiv.textContent = message;
        resultDiv.style.display = 'block';
    }
}

document.addEventListener('DOMContentLoaded', () => {
    new ExportImportManager();
});
```

---

## 4. ✏️ EDICIÓN INLINE EN TABLA (PENDIENTE)

Agregar acciones a cada fila en `pagination.js`:

```javascript
// En createTableRow(), agregar columna de acciones:
<td class="text-center">
    <button class="btn btn-sm btn-outline-primary" onclick="window.location.href='/editar/${bien.id}'">
        <i class="bi bi-pencil"></i>
    </button>
</td>
```

O implementar editor modal:

```javascript
// Agregar clase para edición inline
bien.acciones = `
    <button class="btn btn-sm btn-outline-primary edit-btn" data-id="${bien.id}">
        <i class="bi bi-pencil"></i>
    </button>
`;
```

---

## 5. 📋 HISTORIAL DE CAMBIOS (PENDIENTE)

Usa la tabla `historial` existente.

Endpoint para obtener historial:

```python
@bp.route('/historial/<int:bien_id>', methods=['GET'])
@login_required
def get_historial(bien_id):
    """Obtener historial de cambios de un bien"""
    repo = Repo()
    historial = repo.get_historial(bien_id)
    return api_success({'historial': historial})
```

Modal para mostrar historial en dashboard.

---

## RESUMEN DE ESTADO

| # | Mejora | Estado | Archivos |
|---|--------|--------|----------|
| 1 | Paginación AJAX | ✅ COMPLETO | pagination.js, dashboard.html |
| 2 | Endpoints Export/Import | 🚀 LISTO | api/routes.py (copiar código) |
| 3 | Formularios Importación | 📝 DISEÑADO | export-import.js, dashboard.html |
| 4 | Edición Inline | 📋 PLANIFICADO | pagination.js (agregar columna) |
| 5 | Historial Cambios | 📋 PLANIFICADO | api/routes.py + modal |

---

## PRÓXIMOS PASOS

1. **Hoy**: Copiar endpoints de ExportImport a `api/routes.py`
2. **Hoy**: Crear `export-import.js` y modal en dashboard
3. **Mañana**: Agregar edición inline
4. **Mañana**: Implementar historial

---

**Documento**: MEJORAS_IMPLEMENTACION.md
**Versión**: 1.0
**Última actualización**: 27 Nov 2025 15:45 UTC
