/**
 * Sistema de Interacción para Dashboard (Simplificado)
 * Maneja selección de filas y envío de paginación vía formulario
 */

document.addEventListener('DOMContentLoaded', function () {

    // =========================================================
    // 1. SELECCIÓN DE FILAS (Para activar botones Editar/Historial)
    // =========================================================
    let selectedId = null;
    const editBtn = document.getElementById('btnEditar');
    const historialBtn = document.getElementById('btnHistorial');
    const panelDetalles = document.getElementById('panelDetalles');
    const panelVacio = document.getElementById('panelVacio');
    const btnCerrarDetalles = document.getElementById('btnCerrarDetalles');

    const rows = document.querySelectorAll('#tablaBienes tbody tr[data-id]');
    rows.forEach(row => {
        row.addEventListener('click', function() {
            // Quitar selección previa
            rows.forEach(r => r.classList.remove('table-active'));

            // Seleccionar actual
            this.classList.add('table-active');
            selectedId = this.getAttribute('data-id');

            // Habilitar botones
            if(editBtn) editBtn.disabled = false;
            if(historialBtn) historialBtn.disabled = false;

            // Mostrar detalles del bien
            mostrarDetallesBien(this);
        });
    });

    // Función para mostrar detalles del bien desde la API
    async function mostrarDetallesBien(row) {
        const bienId = row.getAttribute('data-id');

        try {
            // Obtener datos completos del bien desde la API
            const response = await fetch(`/api/bienes/${bienId}`);
            const result = await response.json();

            if (!response.ok || !result.success) {
                console.error('Error al obtener detalles:', result.error);
                return;
            }

            const bien = result.data;

            // Obtener historial para mostrar última modificación
            let ultModFecha = '-', ultModUsuario = '-', ultModAccion = '-';
            try {
                const historialResponse = await fetch(`/api/historial/${bienId}`);
                const historialResult = await historialResponse.json();
                if (historialResult.success && historialResult.data.historial && historialResult.data.historial.length > 0) {
                    const latestChange = historialResult.data.historial[0]; // Primera es la más reciente (DESC order)
                    ultModFecha = latestChange.fecha || '-';
                    ultModUsuario = latestChange.usuario || '-';
                    ultModAccion = latestChange.accion || '-';
                }
            } catch (err) {
                console.warn('No se pudo obtener historial:', err);
            }

            // Función auxiliar para convertir estado
            const getEstadoHtml = (estado) => {
                if (estado && ['b', 'B', 'Bueno'].includes(estado)) {
                    return '<span class="badge bg-success">Bueno</span>';
                } else if (estado && ['r', 'R', 'Regular'].includes(estado)) {
                    return '<span class="badge bg-warning text-dark">Regular</span>';
                } else if (estado && ['m', 'M', 'Malo'].includes(estado)) {
                    return '<span class="badge bg-danger">Malo</span>';
                }
                return '<span class="badge bg-secondary">' + (estado || '-') + '</span>';
            };

            // Llenar todos los campos del panel de detalles
            document.getElementById('detalle-codigo').textContent = bien.codigo_patrimonial || '-';
            document.getElementById('detalle-barras').textContent = bien.cod_barras || '-';
            document.getElementById('detalle-denominacion').textContent = bien.denominacion || '-';
            document.getElementById('detalle-marca').textContent = bien.marca || '-';
            document.getElementById('detalle-modelo').textContent = bien.modelo || '-';
            document.getElementById('detalle-serie').textContent = bien.serie || '-';
            document.getElementById('detalle-estado').innerHTML = getEstadoHtml(bien.estado);
            document.getElementById('detalle-sede').textContent = bien.sede || '-';
            document.getElementById('detalle-dependencia').textContent = bien.dependencia || '-';
            document.getElementById('detalle-ubicacion').textContent = bien.ubicacion_texto || '-';
            document.getElementById('detalle-responsable').textContent = bien.responsable || '-';
            document.getElementById('detalle-descripcion').textContent = bien.descripcion || '-';
            document.getElementById('detalle-cal2020').textContent = bien.cal_2020 ? parseInt(bien.cal_2020) : '-';
            document.getElementById('detalle-cal2021').textContent = bien.cal_2021 ? parseInt(bien.cal_2021) : '-';
            document.getElementById('detalle-cal2022').textContent = bien.cal_2022 ? parseInt(bien.cal_2022) : '-';
            document.getElementById('detalle-cal2023').textContent = bien.cal_2023 ? parseInt(bien.cal_2023) : '-';
            document.getElementById('detalle-cal2024').textContent = bien.cal_2024 ? parseInt(bien.cal_2024) : '-';
            document.getElementById('detalle-cal2025').textContent = bien.cal_2025 ? parseInt(bien.cal_2025) : '-';

            // Mostrar última modificación
            document.getElementById('detalle-ultima-mod-fecha').textContent = ultModFecha;
            document.getElementById('detalle-ultima-mod-usuario').textContent = ultModUsuario;
            document.getElementById('detalle-ultima-mod-accion').textContent = ultModAccion;

            document.getElementById('detalle-observaciones').textContent = bien.observaciones || '-';

            // Mostrar panel de detalles
            if (panelDetalles) panelDetalles.style.display = 'block';
            if (panelVacio) panelVacio.style.display = 'none';

            // Scroll suave hacia el panel
            panelDetalles?.scrollIntoView({ behavior: 'smooth', block: 'nearest' });
        } catch (error) {
            console.error('Error al cargar detalles del bien:', error);
        }
    }

    // Botón para cerrar detalles
    if (btnCerrarDetalles) {
        btnCerrarDetalles.addEventListener('click', function() {
            if (panelDetalles) panelDetalles.style.display = 'none';
            if (panelVacio) panelVacio.style.display = 'block';

            // Quitar selección
            rows.forEach(r => r.classList.remove('table-active'));
            selectedId = null;

            // Deshabilitar botones
            if(editBtn) editBtn.disabled = true;
            if(historialBtn) historialBtn.disabled = true;
        });
    }

    // =========================================================
    // 2. ACCIONES DE BOTONES
    // =========================================================
    
    // Botón Editar
    if (editBtn) {
        editBtn.addEventListener('click', function () {
            if (selectedId) {
                let baseUrl = this.getAttribute('data-edit-url');
                // Limpiar URL placeholder (terminada en /0)
                if (baseUrl.endsWith('/0')) {
                    baseUrl = baseUrl.substring(0, baseUrl.length - 1);
                }
                window.location.href = baseUrl + selectedId;
            }
        });
    }

    // Botón Historial - Bitácora de Auditoría
    if (historialBtn) {
        historialBtn.addEventListener('click', function () {
             if (selectedId) {
                 fetch(`/api/historial/${selectedId}`)
                     .then(response => response.json())
                     .then(data => {
                         if (data.success && data.data.historial && data.data.historial.length > 0) {
                             // Mostrar bitácora de auditoría en una ventana nueva
                             let historialHTML = `
                                 <html>
                                 <head>
                                     <meta charset="UTF-8">
                                     <title>Bitácora de Auditoría - Bien ${selectedId}</title>
                                     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
                                     <style>
                                         body { padding: 20px; font-family: Arial, sans-serif; }
                                         .header { background-color: #2c3e50; color: white; padding: 15px; border-radius: 5px; margin-bottom: 20px; }
                                         .cambio { border-left: 4px solid #0d6efd; padding: 15px; margin-bottom: 15px; background-color: #f8f9fa; border-radius: 5px; }
                                         .campo-nombre { font-weight: bold; color: #0d6efd; margin-bottom: 10px; }
                                         .valor { padding: 8px; background-color: white; border: 1px solid #dee2e6; border-radius: 3px; margin: 5px 0; font-family: monospace; font-size: 12px; }
                                         .valor-anterior { border-left: 3px solid #dc3545; }
                                         .valor-nuevo { border-left: 3px solid #198754; }
                                         .fila-cambio { margin-bottom: 20px; padding-bottom: 20px; border-bottom: 1px solid #dee2e6; }
                                         .info-cambio { font-size: 12px; color: #6c757d; margin-bottom: 10px; }
                                     </style>
                                 </head>
                                 <body>
                                     <div class="header">
                                         <h3>📋 Bitácora de Auditoría</h3>
                                         <p class="mb-0">Bien ID: ${selectedId}</p>
                                     </div>
                             `;

                             data.data.historial.forEach((h, idx) => {
                                 let detallesHTML = '<div class="cambio" style="margin-top: 10px;">';

                                 try {
                                     let detalles = JSON.parse(h.detalle_json);
                                     if (typeof detalles === 'object' && detalles !== null) {
                                         // Si tiene estructura antes/después (EDITAR)
                                         Object.keys(detalles).forEach(campo => {
                                             let cambio = detalles[campo];
                                             if (cambio.anterior !== undefined && cambio.nuevo !== undefined) {
                                                 detallesHTML += `
                                                     <div style="margin-bottom: 10px;">
                                                         <strong style="color: #0d6efd;">${campo}:</strong>
                                                         <div class="valor valor-anterior">
                                                             <small style="color: #dc3545;">Anterior:</small> ${cambio.anterior || '(vacío)'}
                                                         </div>
                                                         <div class="valor valor-nuevo">
                                                             <small style="color: #198754;">Nuevo:</small> ${cambio.nuevo || '(vacío)'}
                                                         </div>
                                                     </div>
                                                 `;
                                             } else {
                                                 // Si es solo datos nuevos (CREAR)
                                                 detallesHTML += `
                                                     <div style="margin-bottom: 10px;">
                                                         <strong>${campo}:</strong> ${cambio || '(vacío)'}
                                                     </div>
                                                 `;
                                             }
                                         });
                                     }
                                 } catch(e) {
                                     detallesHTML += '<small>' + h.detalle_json + '</small>';
                                 }

                                 detallesHTML += '</div>';

                                 historialHTML += `
                                     <div class="fila-cambio">
                                         <div class="info-cambio">
                                             <strong>${h.accion}</strong> • Por: <strong>${h.usuario}</strong> • Fecha: <strong>${h.fecha || 'N/A'}</strong>
                                         </div>
                                         ${detallesHTML}
                                     </div>
                                 `;
                             });

                             historialHTML += '</body></html>';

                             const win = window.open('', 'Historial', 'width=1000,height=700');
                             win.document.write(historialHTML);
                         } else {
                             alert('Sin historial registrado para este bien');
                         }
                     })
                     .catch(error => {
                         console.error('Error:', error);
                         alert('Error al obtener historial: ' + error);
                     });
             }
        });
    }

    // =========================================================
    // 3. PAGINACIÓN (Enviar formulario al cambiar página)
    // =========================================================
    const paginationLinks = document.querySelectorAll('.pagination .page-link');
    const form = document.getElementById('filtrosSidebar');

    paginationLinks.forEach(link => {
        link.addEventListener('click', function(e) {
            e.preventDefault();
            const page = this.getAttribute('data-page');
            
            if(page && form) {
                // Crear o actualizar input hidden para 'page'
                let pageInput = form.querySelector('input[name="page"]');
                if (!pageInput) {
                    pageInput = document.createElement('input');
                    pageInput.type = 'hidden';
                    pageInput.name = 'page';
                    form.appendChild(pageInput);
                }
                pageInput.value = page;
                
                // Enviar formulario con filtros actuales + nueva página
                form.submit();
            }
        });
    });
});