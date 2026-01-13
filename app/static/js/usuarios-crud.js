document.addEventListener('DOMContentLoaded', function() {
    // ==================== VARIABLES ====================
    let usuarioSeleccionado = null;
    const modal = new bootstrap.Modal(document.getElementById('modalUsuario'));

    // ==================== FUNCIONES AUXILIARES ====================
    function actualizarBotones() {
        const seleccionados = document.querySelectorAll('.chk-usuario:checked').length;
        document.getElementById('btnEditar').disabled = seleccionados !== 1;
        document.getElementById('btnReset').disabled = seleccionados !== 1;
        document.getElementById('btnEliminar').disabled = seleccionados === 0;
    }

    function obtenerSeleccionados() {
        const checkboxes = document.querySelectorAll('.chk-usuario:checked');
        return Array.from(checkboxes).map(cb => cb.value);
    }

    async function mostrarAlerta(mensaje, tipo = 'info') {
        const alertClass = `alert-${tipo}`;
        const html = `
            <div class="alert ${alertClass} alert-dismissible fade show" role="alert">
                ${mensaje}
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        `;
        const container = document.createElement('div');
        container.innerHTML = html;
        document.body.insertBefore(container.firstElementChild, document.body.firstChild);
    }

    // ==================== MANEJO DE SELECCIÓN ====================
    document.getElementById('chkSeleccionarTodos').addEventListener('change', function(e) {
        document.querySelectorAll('.chk-usuario').forEach(cb => cb.checked = e.target.checked);
        actualizarBotones();
    });

    document.querySelectorAll('.chk-usuario').forEach(cb => {
        cb.addEventListener('change', actualizarBotones);
    });

    // ==================== BOTONES ====================
    document.getElementById('btnNueva').addEventListener('click', function() {
        usuarioSeleccionado = null;
        document.getElementById('formUsuario').reset();
        document.getElementById('inputUsername').disabled = false;
        document.getElementById('inputUsername').value = '';
        document.getElementById('inputNombre').value = '';
        document.getElementById('inputPassword').value = '';
        document.getElementById('inputRol').value = 'operador';
        document.getElementById('inputActivo').checked = true;
        document.getElementById('modalTitulo').textContent = 'Nueva Cuenta';
        document.getElementById('passwordHint').textContent = 'Requerido para nueva cuenta';
        document.getElementById('inputPassword').required = true;
        modal.show();
    });

    document.getElementById('btnEditar').addEventListener('click', function() {
        const seleccionados = obtenerSeleccionados();
        if (seleccionados.length !== 1) return;

        const username = seleccionados[0];
        const row = document.querySelector(`[data-username="${username}"]`);
        const cells = row.querySelectorAll('td');

        usuarioSeleccionado = username;
        document.getElementById('inputUsername').value = username;
        document.getElementById('inputUsername').disabled = true;
        document.getElementById('inputNombre').value = cells[2].textContent.trim();
        document.getElementById('inputRol').value = cells[3].textContent.trim();
        document.getElementById('inputPassword').value = '';
        document.getElementById('inputPassword').required = false;
        document.getElementById('inputActivo').checked = cells[4].querySelector('.badge-success') !== null;
        document.getElementById('modalTitulo').textContent = `Editar: ${username}`;
        document.getElementById('passwordHint').textContent = 'Dejar en blanco para no cambiar';
        modal.show();
    });

    document.getElementById('btnGuardar').addEventListener('click', async function() {
        const username = document.getElementById('inputUsername').value;
        const nombre = document.getElementById('inputNombre').value;
        const rol = document.getElementById('inputRol').value;
        const password = document.getElementById('inputPassword').value;
        const activo = document.getElementById('inputActivo').checked;

        if (!username || !nombre) {
            mostrarAlerta('Usuario y nombre son requeridos', 'danger');
            return;
        }

        if (!usuarioSeleccionado && !password) {
            mostrarAlerta('Contraseña es requerida para nueva cuenta', 'danger');
            return;
        }

        try {
            const data = { nombre, rol, activo };
            if (password) data.password = password;

            const url = usuarioSeleccionado
                ? `/api/usuarios/${usuarioSeleccionado}`
                : '/api/usuarios';

            const method = usuarioSeleccionado ? 'PUT' : 'POST';

            const response = await fetch(url, {
                method: method,
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(usuarioSeleccionado ? data : { username, ...data })
            });

            const result = await response.json();

            if (!response.ok) {
                mostrarAlerta(result.error || 'Error al guardar', 'danger');
                return;
            }

            modal.hide();
            mostrarAlerta(usuarioSeleccionado ? 'Usuario actualizado' : 'Usuario creado', 'success');
            location.reload();
        } catch (error) {
            mostrarAlerta('Error: ' + error.message, 'danger');
        }
    });

    document.getElementById('btnReset').addEventListener('click', async function() {
        const seleccionados = obtenerSeleccionados();
        if (seleccionados.length !== 1) return;

        const username = seleccionados[0];

        if (!confirm(`¿Resetear contraseña de ${username}?`)) return;

        try {
            const response = await fetch(`/api/usuarios/${username}/reset-password`, {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' }
            });

            const result = await response.json();

            if (!response.ok) {
                mostrarAlerta(result.error || 'Error al resetear', 'danger');
                return;
            }

            const newPass = result.data.password_temporal;
            mostrarAlerta(
                `Contraseña temporal: <strong>${newPass}</strong> (Copiar y compartir de forma segura)`,
                'success'
            );
        } catch (error) {
            mostrarAlerta('Error: ' + error.message, 'danger');
        }
    });

    document.getElementById('btnEliminar').addEventListener('click', async function() {
        const seleccionados = obtenerSeleccionados();
        if (seleccionados.length === 0) return;

        if (!confirm(`¿Eliminar ${seleccionados.length} usuario(s)?`)) return;

        try {
            let errores = [];
            for (const username of seleccionados) {
                const response = await fetch(`/api/usuarios/${username}`, { method: 'DELETE' });
                if (!response.ok) {
                    const result = await response.json();
                    errores.push(`${username}: ${result.error}`);
                }
            }

            if (errores.length > 0) {
                mostrarAlerta('Errores: ' + errores.join(', '), 'warning');
            } else {
                mostrarAlerta('Usuario(s) eliminado(s)', 'success');
            }

            location.reload();
        } catch (error) {
            mostrarAlerta('Error: ' + error.message, 'danger');
        }
    });
});
