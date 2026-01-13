/**
 * Sistema de Exportación e Importación de Bienes
 * (Incrustado para evitar problemas MIME)
 */
class ExportImportManager {
    constructor() {
        const modalEl = document.getElementById('modalImportar');
        if (modalEl) {
            this.modal = new bootstrap.Modal(modalEl);
        }

        // Modal de confirmación de descarga
        const modalDescargaEl = document.getElementById('modalConfirmarDescarga');
        if (modalDescargaEl) {
            this.modalDescarga = new bootstrap.Modal(modalDescargaEl);
        }

        this.tipoDescarga = null; // 'excel' o 'csv'
        this.initListeners();
    }

    initListeners() {
        // Botones de exportación
        document.getElementById('btnExportarExcel')?.addEventListener('click', () => this.mostrarConfirmacion('excel'));
        document.getElementById('btnExportarCSV')?.addEventListener('click', () => this.mostrarConfirmacion('csv'));

        // Botón para abrir modal de importación
        document.getElementById('btnImportar')?.addEventListener('click', () => this.modal.show());

        // Botón para descargar plantilla
        document.getElementById('btnDescargarPlantilla')?.addEventListener('click', (e) => {
            e.preventDefault();
            this.descargarPlantilla();
        });

        // Botón para confirmar importación
        document.getElementById('btnConfirmarImportar')?.addEventListener('click', () => this.importarExcel());

        // Botón para confirmar descarga
        document.getElementById('btnConfirmarDescarga')?.addEventListener('click', () => this.confirmarDescarga());
    }

    mostrarConfirmacion(tipo) {
        this.tipoDescarga = tipo;
        const nombreArchivo = tipo === 'excel'
            ? `bienes_${new Date().toISOString().split('T')[0]}.xlsx`
            : `bienes_${new Date().toISOString().split('T')[0]}.csv`;

        document.getElementById('nombreArchivo').textContent = nombreArchivo;
        this.modalDescarga.show();
    }

    confirmarDescarga() {
        if (this.tipoDescarga === 'excel') {
            this.exportarExcel();
        } else if (this.tipoDescarga === 'csv') {
            this.exportarCSV();
        }
        this.modalDescarga.hide();
    }

    exportarExcel() {
        const filtros = this.getFilterParams();
        const params = new URLSearchParams(filtros).toString();
        window.location.href = `/api/exportar/excel?${params}`;
    }

    exportarCSV() {
        const filtros = this.getFilterParams();
        const params = new URLSearchParams(filtros).toString();
        window.location.href = `/api/exportar/csv?${params}`;
    }

    descargarPlantilla() {
        window.location.href = '/api/importar/plantilla';
    }

    getFilterParams() {
        return {
            q: document.querySelector('input[name="q"]')?.value || '',
            sede: document.querySelector('select[name="sede"]')?.value || '',
            dependencia: document.querySelector('select[name="dependencia"]')?.value || '',
            estado: document.querySelector('select[name="estado"]')?.value || '',
            inventariador: document.querySelector('select[name="inventariador"]')?.value || '',
            verificacion: document.querySelector('input[name="verificacion"]:checked')?.value || ''
        };
    }

    async importarExcel() {
        const fileInput = document.getElementById('archivoImportar');
        const file = fileInput.files[0];
        if (!file) {
            alert('Por favor selecciona un archivo');
            return;
        }

        const formData = new FormData();
        formData.append('archivo', file);

        this.showProgress();

        try {
            // Obtener token CSRF
            const csrfToken = document.querySelector('meta[name="csrf-token"]')?.getAttribute('content');

            const response = await fetch('/api/importar/excel', {
                method: 'POST',
                body: formData,
                headers: {
                    'X-CSRFToken': csrfToken // Importante para seguridad
                },
                credentials: 'same-origin'
            });

            const data = await response.json();

            if (data.success) {
                const mensaje = `
                Importación completada:
                - Creados: ${data.data.creados || 0}
                - Actualizados: ${data.data.actualizados || 0}
                - Errores: ${data.data.errores || 0}
            `;
                this.showResult(true, mensaje);

                // Recargar datos después de 2 segundos
                setTimeout(() => {
                    window.location.reload();
                }, 2000);
            } else {
                this.showResult(false, data.error || 'Error en la importación');
            }
        } catch (error) {
            this.showResult(false, `Error: ${error.message}`);
        }
    }

    showProgress() {
        const progress = document.getElementById('progressImportar');
        const result = document.getElementById('resultadoImportar');
        if (progress) progress.style.display = 'block';
        if (result) result.style.display = 'none';
    }

    showResult(success, message) {
        const progress = document.getElementById('progressImportar');
        const resultDiv = document.getElementById('resultadoImportar');

        if (progress) progress.style.display = 'none';

        if (resultDiv) {
            const alertDiv = resultDiv.querySelector('.alert');
            alertDiv.className = success ? 'alert alert-success' : 'alert alert-danger';
            alertDiv.innerText = message; // Usar innerText para saltos de línea
            resultDiv.style.display = 'block';
        } else {
            alert(message);
        }
    }
}

// Inicializar
document.addEventListener('DOMContentLoaded', () => {
    new ExportImportManager();
});
