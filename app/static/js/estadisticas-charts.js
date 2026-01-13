document.addEventListener('DOMContentLoaded', function () {
    // Leer datos desde el container div
    const chartsContainer = document.getElementById('chartsContainer');
    if (!chartsContainer) return;

    // Parsear JSON desde data attributes
    const sedesData = JSON.parse(chartsContainer.dataset.sedes || '[]');
    const dependenciasData = JSON.parse(chartsContainer.dataset.dependencias || '[]');
    const estadoData = JSON.parse(chartsContainer.dataset.estado || '{}');

    // Opciones comunes para gráficos responsivos
    const responsiveOptions = {
        responsive: true,
        maintainAspectRatio: false,
        plugins: {
            legend: {
                position: 'bottom',
                labels: { boxWidth: 12, font: { size: 10 } }
            }
        }
    };

    // Gráfico Sedes
    const chartSedesEl = document.getElementById('chartSedes');
    if (chartSedesEl) {
        new Chart(chartSedesEl, {
            type: 'bar',
            data: {
                labels: sedesData.map(d => d.sede_nombre),
                datasets: [{
                    label: 'Inventariados',
                    data: sedesData.map(d => d.inventariados),
                    backgroundColor: '#0d6efd'
                }, {
                    label: 'Total',
                    data: sedesData.map(d => d.total),
                    backgroundColor: '#e9ecef',
                    type: 'bar'
                }]
            },
            options: {
                ...responsiveOptions,
                indexAxis: 'y',
                scales: { x: { stacked: false }, y: { stacked: true } },
                plugins: {
                    legend: {
                        position: 'bottom',
                        labels: { boxWidth: 12, font: { size: 10 } }
                    }
                }
            }
        });
    }

    // Gráfico Dependencias (Top 10)
    const chartDependenciasEl = document.getElementById('chartDependencias');
    if (chartDependenciasEl) {
        new Chart(chartDependenciasEl, {
            type: 'bar',
            data: {
                labels: dependenciasData.slice(0, 10).map(d => d.dependencia_nombre),
                datasets: [{
                    label: 'Inventariados',
                    data: dependenciasData.slice(0, 10).map(d => d.inventariados),
                    backgroundColor: '#198754'
                }]
            },
            options: {
                ...responsiveOptions,
                indexAxis: 'y'
            }
        });
    }

    // Gráfico Estado
    const chartEstadoEl = document.getElementById('chartEstado');
    if (chartEstadoEl) {
        new Chart(chartEstadoEl, {
            type: 'doughnut',
            data: {
                labels: Object.keys(estadoData),
                datasets: [{
                    data: Object.values(estadoData),
                    backgroundColor: ['#198754', '#ffc107', '#dc3545', '#0dcaf0']
                }]
            },
            options: responsiveOptions
        });
    }
});
