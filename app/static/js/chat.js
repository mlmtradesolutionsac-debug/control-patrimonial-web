const chatMessages = document.getElementById('chatMessages');
const chatForm = document.getElementById('chatForm');
const userInput = document.getElementById('userInput');

// Añadir mensaje al chat
function addMessage(text, isUser = false) {
    const messageDiv = document.createElement('div');
    messageDiv.className = `mb-3 d-flex ${isUser ? 'justify-content-end' : 'justify-content-start'}`;

    const bubble = document.createElement('div');
    bubble.className = `p-3 rounded ${isUser ? 'bg-primary text-white' : 'bg-white border'}`;
    bubble.style.maxWidth = '70%';
    bubble.innerHTML = text;

    messageDiv.appendChild(bubble);
    chatMessages.appendChild(messageDiv);
    chatMessages.scrollTop = chatMessages.scrollHeight;
}

// Añadir resultados de búsqueda
function addResults(results, stats = null) {
    // Si hay estadísticas (sin resultados), mostrarlas
    if (stats) {
        addMessage(stats.message + '<br><br><em>Intenta buscar por: código patrimonial, denominación, marca, estado, sede, dependencia, o responsable.</em>');
        return;
    }

    if (results.length === 0) {
        addMessage('No encontré ningún bien con esos criterios. Intenta con otra búsqueda.');
        return;
    }

    let html = `<strong>Encontré ${results.length} bien(es):</strong><br><br>`;
    html += '<div class="table-responsive"><table class="table table-sm table-striped mb-0">';
    html += '<thead><tr><th>Código</th><th>Denominación</th><th>Marca</th><th>Sede</th><th>Estado</th></tr></thead><tbody>';

    results.forEach(bien => {
        const estadoBadge = bien.estado === 'b' || bien.estado === 'Bueno' ? 'success' :
            bien.estado === 'r' || bien.estado === 'Regular' ? 'warning' : 'danger';
        const estadoTexto = bien.estado === 'b' || bien.estado === 'Bueno' ? 'Bueno' :
            bien.estado === 'r' || bien.estado === 'Regular' ? 'Regular' : 'Malo';

        html += `<tr>
        <td class="fw-bold">${bien.codigo_patrimonial}</td>
        <td>${bien.denominacion}</td>
        <td>${bien.marca || '-'}</td>
        <td>${bien.sede || '-'}</td>
        <td><span class="badge bg-${estadoBadge}">${estadoTexto}</span></td>
    </tr>`;
    });

    html += '</tbody></table></div>';
    addMessage(html);
}

// Manejar envío del formulario
chatForm.addEventListener('submit', async (e) => {
    e.preventDefault();

    const query = userInput.value.trim();
    if (!query) return;

    // Limpiar mensaje de bienvenida en el primer mensaje
    if (chatMessages.querySelector('.text-center')) {
        chatMessages.innerHTML = '';
    }

    // Añadir mensaje del usuario
    addMessage(query, true);
    userInput.value = '';

    // Añadir indicador de carga
    addMessage('<div class="spinner-border spinner-border-sm me-2"></div>Buscando...');

    try {
        // Realizar búsqueda
        const response = await fetch('/chat/search', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({ query: query })
        });

        const data = await response.json();

        // Eliminar indicador de carga
        chatMessages.removeChild(chatMessages.lastChild);

        // Mostrar resultados
        addResults(data.results, data.stats);

    } catch (error) {
        chatMessages.removeChild(chatMessages.lastChild);
        addMessage('Ocurrió un error al buscar. Por favor, intenta de nuevo.');
        console.error('Error:', error);
    }
});
