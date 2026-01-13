document.addEventListener('DOMContentLoaded', function () {
    // Limpiar prefijo "CAL'" del campo CAL 2025 cuando se escanea código de barras
    const cal2025Field = document.getElementById('cal_2025');
    if (cal2025Field) {
        cal2025Field.addEventListener('input', function (e) {
            let value = this.value;
            // Si el valor comienza con "CAL'" o "CAL-", remover ese prefijo
            if (value.startsWith("CAL'")) {
                this.value = value.replace(/^CAL'/, '').trim();
            } else if (value.startsWith("CAL-")) {
                this.value = value.replace(/^CAL-/, '').trim();
            }
        });

        // También limpiar el valor inicial si ya está presente
        if (cal2025Field.value) {
            let val = cal2025Field.value;
            if (val.startsWith("CAL'")) {
                cal2025Field.value = val.replace(/^CAL'/, '').trim();
            } else if (val.startsWith("CAL-")) {
                cal2025Field.value = val.replace(/^CAL-/, '').trim();
            }
        }
    }

    // Inicializar Select2 para Dependencias
    const dependencySelect = document.getElementById('unidad_id');
    if (dependencySelect && dependencySelect.classList.contains('select2-dependencia')) {
        initializeSearchableSelect(dependencySelect, 'Buscar dependencia...');
    }

    // Inicializar Select2 para Responsables (con capacidad de agregar nuevos)
    const responsableSelect = document.getElementById('responsable');
    if (responsableSelect && responsableSelect.classList.contains('select2-responsable')) {
        initializeSearchableSelect(responsableSelect, 'Buscar o ingresar responsable...', true);
    }

    function initializeSearchableSelect(selectElement, placeholderText, allowNew = false) {
        try {
            // Intentar usar Select2 si está disponible
            if (window.$ && $.fn.select2) {
                const config = {
                    placeholder: placeholderText,
                    language: 'es',
                    allowClear: false,
                    width: '100%',
                    matcher: function (params, data) {
                        if (!params.term || params.term.trim() === '') {
                            return data;
                        }
                        var searchTerm = params.term.toLowerCase();
                        var text = data.text.toLowerCase();
                        if (text.indexOf(searchTerm) > -1) {
                            return data;
                        }
                        return null;
                    }
                };

                // Si permite nuevos valores (como responsables)
                if (allowNew) {
                    config.tags = true;
                    config.createTag = function (params) {
                        var term = $.trim(params.term);
                        if (term === '') {
                            return null;
                        }
                        return {
                            id: term.toUpperCase(),
                            text: term.toUpperCase()
                        };
                    };
                }

                $(selectElement).select2(config);
            } else {
                // Fallback: Implementar filtro manual sin Select2
                implementManualFilter(selectElement, placeholderText, allowNew);
            }
        } catch (e) {
            // Si Select2 falla, usar filtro manual
            implementManualFilter(selectElement, placeholderText, allowNew);
        }
    }

    function implementManualFilter(selectElement, placeholderText, allowNew = false) {
        // Crear contenedor para búsqueda
        const searchContainer = document.createElement('div');
        searchContainer.style.marginBottom = '8px';

        const searchInput = document.createElement('input');
        searchInput.type = 'text';
        searchInput.className = 'form-control form-control-sm';
        searchInput.placeholder = placeholderText;
        searchInput.style.fontSize = '0.8rem';

        selectElement.parentElement.insertBefore(searchContainer, selectElement);
        searchContainer.appendChild(searchInput);

        // Guardar opciones originales
        const allOptions = Array.from(selectElement.options).map(opt => ({
            value: opt.value,
            text: opt.text,
            selected: opt.selected
        }));

        // Evento de búsqueda
        searchInput.addEventListener('input', function () {
            const searchTerm = this.value.toLowerCase().trim();

            // Limpiar opciones
            selectElement.innerHTML = '';

            // Agregar opción vacía
            const blankOption = document.createElement('option');
            blankOption.value = '';
            blankOption.text = allowNew ? 'Seleccione o ingrese' : 'Seleccione';
            selectElement.appendChild(blankOption);

            // Filtrar y mostrar opciones
            allOptions.forEach(opt => {
                if (opt.text.toLowerCase().includes(searchTerm)) {
                    const option = document.createElement('option');
                    option.value = opt.value;
                    option.text = opt.text;
                    option.selected = opt.selected;
                    selectElement.appendChild(option);
                }
            });

            // Si se permite nuevos valores y hay texto, agregar opción para crear nuevo
            if (allowNew && searchTerm && !allOptions.some(o => o.text.toLowerCase() === searchTerm)) {
                const newOption = document.createElement('option');
                const upperSearchTerm = searchTerm.toUpperCase();
                newOption.value = upperSearchTerm;
                newOption.text = `➕ Nuevo: "${upperSearchTerm}"`;
                newOption.selected = true;
                selectElement.appendChild(newOption);
            }
        });

        // Restaurar opciones al hacer focus
        searchInput.addEventListener('focus', function () {
            selectElement.innerHTML = '';
            const blankOption = document.createElement('option');
            blankOption.value = '';
            blankOption.text = allowNew ? 'Seleccione o ingrese' : 'Seleccione';
            selectElement.appendChild(blankOption);

            allOptions.forEach(opt => {
                const option = document.createElement('option');
                option.value = opt.value;
                option.text = opt.text;
                option.selected = opt.selected;
                selectElement.appendChild(option);
            });
        });
    }
});
