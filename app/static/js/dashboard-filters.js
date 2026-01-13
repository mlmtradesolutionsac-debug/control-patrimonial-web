document.addEventListener('DOMContentLoaded', function () {
    const form = document.getElementById('filtrosSidebar');

    // Enviar formulario automáticamente al cambiar selects
    const selects = form.querySelectorAll('select');
    selects.forEach(select => {
        select.addEventListener('change', () => form.submit());
    });

    // Enviar formulario automáticamente al cambiar radio buttons de verificación
    const verificacionRadios = form.querySelectorAll('input[name="verificacion"]');
    verificacionRadios.forEach(radio => {
        radio.addEventListener('change', () => form.submit());
    });

    // Botón limpiar
    const btnLimpiar = document.getElementById('btnLimpiarFiltros');
    if (btnLimpiar) {
        btnLimpiar.addEventListener('click', () => {
            // Limpiar inputs
            form.querySelectorAll('input[type="text"]').forEach(input => input.value = '');
            form.querySelectorAll('select').forEach(select => select.value = '');

            // Resetear radio buttons de verificación a "Todos"
            const verificacionTodos = form.querySelector('input[name="verificacion"][value=""]');
            if (verificacionTodos) {
                verificacionTodos.checked = true;
            }

            // Enviar formulario limpio
            form.submit();
        });
    }

    // Manejador de clicks en filas de la tabla para mostrar detalles
    const tablaBienes = document.getElementById('tablaBienes');
    const panelDetalles = document.getElementById('panelDetalles');
    const panelVacio = document.getElementById('panelVacio');
    const btnEditar = document.getElementById('btnEditar');
    const btnCerrarDetalles = document.getElementById('btnCerrarDetalles');

    if (tablaBienes) {
        // Obtener datos del bien desde la tabla y mostrar en el panel de detalles
        tablaBienes.addEventListener('click', function (e) {
            const row = e.target.closest('tr[data-id]');
            if (!row) return;

            const bienId = row.dataset.id;
            const cells = row.querySelectorAll('td');

            if (cells.length > 0) {
                // Extraer datos de las celdas de la tabla
                const codigo = cells[0]?.textContent?.trim() || '-';
                const barras = cells[1]?.textContent?.trim() || '-';
                const denominacion = cells[2]?.textContent?.trim() || '-';
                const marca = cells[3]?.textContent?.trim() || '-';
                const serie = cells[4]?.textContent?.trim() || '-';
                const responsable = cells[5]?.textContent?.trim() || '-';
                const sede = cells[6]?.textContent?.trim() || '-';
                const dependencia = cells[7]?.textContent?.trim() || '-';
                const estado = cells[8]?.textContent?.trim() || '-';

                // Llenar información básica
                document.getElementById('detalle-codigo').textContent = codigo;
                document.getElementById('detalle-barras').textContent = barras;
                document.getElementById('detalle-denominacion').textContent = denominacion;

                // Llenar especificaciones
                document.getElementById('detalle-marca').textContent = marca;
                document.getElementById('detalle-modelo').textContent = '-';
                document.getElementById('detalle-serie').textContent = serie;
                document.getElementById('detalle-estado').textContent = estado;

                // Llenar ubicación
                document.getElementById('detalle-sede').textContent = sede;
                document.getElementById('detalle-dependencia').textContent = dependencia;
                document.getElementById('detalle-ubicacion').textContent = '-';

                // Llenar responsabilidad
                document.getElementById('detalle-responsable').textContent = responsable;
                document.getElementById('detalle-descripcion').textContent = '-';

                // Llenar CAL values (inicialmente vacíos, se llenarán con AJAX)
                document.getElementById('detalle-cal2020').textContent = '-';
                document.getElementById('detalle-cal2021').textContent = '-';
                document.getElementById('detalle-cal2022').textContent = '-';
                document.getElementById('detalle-cal2023').textContent = '-';
                document.getElementById('detalle-cal2024').textContent = '-';
                document.getElementById('detalle-cal2025').textContent = '-';

                // Llenar observaciones
                document.getElementById('detalle-observaciones').textContent = '-';

                // Obtener detalles completos del bien via AJAX
                fetch(`/api/bienes/${bienId}`)
                    .then(response => {
                        if (!response.ok) throw new Error('Error al obtener detalles del bien');
                        return response.json();
                    })
                    .then(data => {
                        const bien = data.data || {};

                        // Actualizar con datos completos del servidor
                        document.getElementById('detalle-modelo').textContent = bien.modelo || '-';
                        document.getElementById('detalle-ubicacion').textContent = bien.ubicacion_texto || '-';
                        document.getElementById('detalle-descripcion').textContent = bien.descripcion || '-';
                        document.getElementById('detalle-observaciones').textContent = bien.observaciones || '-';

                        // Llenar CAL values desde el servidor
                        document.getElementById('detalle-cal2020').textContent = bien.cal_2020 || '-';
                        document.getElementById('detalle-cal2021').textContent = bien.cal_2021 || '-';
                        document.getElementById('detalle-cal2022').textContent = bien.cal_2022 || '-';
                        document.getElementById('detalle-cal2023').textContent = bien.cal_2023 || '-';
                        document.getElementById('detalle-cal2024').textContent = bien.cal_2024 || '-';
                        document.getElementById('detalle-cal2025').textContent = bien.cal_2025 || '-';
                    })
                    .catch(error => {
                        console.error('Error:', error);
                        // Mantener valores de la tabla si hay error en AJAX
                    });

                // Mostrar panel de detalles
                panelDetalles.style.display = 'block';
                if (panelVacio) panelVacio.style.display = 'none';

                // Actualizar botón Editar
                if (btnEditar) {
                    btnEditar.disabled = false;
                    btnEditar.onclick = function () {
                        const urlTemplate = btnEditar.getAttribute('data-url-template');
                        window.location.href = urlTemplate + bienId;
                    };
                }
            }
        });
    }

    // Cerrar panel de detalles
    if (btnCerrarDetalles) {
        btnCerrarDetalles.addEventListener('click', function () {
            panelDetalles.style.display = 'none';
            if (panelVacio) panelVacio.style.display = 'block';
        });
    }
});
