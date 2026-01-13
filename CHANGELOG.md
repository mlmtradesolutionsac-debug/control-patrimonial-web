# Changelog - Control Patrimonial

Todos los cambios notables en este proyecto serán documentados en este archivo.

El formato está basado en [Keep a Changelog](https://keepachangelog.com/es-ES/1.0.0/),
y este proyecto sigue [Semantic Versioning](https://semver.org/lang/es/).

---

## [1.1.0] - 2025-11-27

### Agregado (Added)
- 🔍 **Búsqueda autocompletable para Dependencias**: Campo de dependencias ahora incluye búsqueda en tiempo real sin necesidad de scroll infinito
- 🔍 **Búsqueda autocompletable para Responsables**: Campo de responsables convertido a select inteligente con capacidad de agregar nuevos responsables sobre la marcha
- ✅ **Validación de campos únicos**: Sistema previene duplicados en:
  - `codigo_patrimonial` (ya existía)
  - `cod_barras` (nuevo)
  - `serie` (nuevo)
  - `cal_2025` (nuevo)
- 📊 **Restricciones a nivel BD**: Agregadas constraints de unicidad en modelo SQLAlchemy
- 🗄️ **Obtención de responsables**: Nueva función `obtener_responsables()` en repositorio
- 📝 **Script de actualización automática**: `update-server.sh` para simplificar actualizaciones en producción
- 📋 **CHANGELOG.md**: Documentación de versiones y cambios

### Modificado (Changed)
- 🎨 **UI/UX mejorada**: Formulario de bienes con selects inteligentes (Select2 con fallback vanilla JS)
- 📐 **Validación extendida**: `validate_bien_data()` ahora verifica unicidad de campos
- 🔐 **Mejor manejo de ediciones**: Validación inteligente que permite mantener valores propios sin marcar como duplicado

### Corregido (Fixed)
- 🐛 **CAL 2025 mostraba decimales**: Ahora muestra valores como enteros (fix anterior en 1.0.1 fue solo parcial)
- 🐛 **Estadísticas con sedes inválidas**: Filtrados "tipoSIGA 36", "SIGA 5", "Distrito Fiscal del Callao"

---

## [1.0.1] - 2025-11-27

### Corregido (Fixed)
- 🐛 **CAL 2025 en panel de detalles**: Agregado `parseInt()` en JavaScript para mostrar como entero
- 🐛 **Estadísticas con datos inválidos**: Agregado filtro en `obtener_progreso_por_sede()` para excluir sedes inválidas
- 🐛 **Paginación**: Cambiado de 20 a 15 bienes por página

### Modificado (Changed)
- 🔍 **Filtro de sedes**: Excluye "Distrito Fiscal del Callao" de listados

---

## [1.0.0] - 2025-11-27

### Agregado (Added)
- 🎉 **Versión Inicial en Producción**
- 📊 **Sistema completo de gestión patrimonial** con:
  - ✅ Autenticación de usuarios (Administrador + Operadores)
  - ✅ CRUD completo de bienes patrimoniales
  - ✅ Búsqueda y filtrado avanzado
  - ✅ Importación/Exportación (Excel, CSV)
  - ✅ Estadísticas y reportes
  - ✅ Historial de cambios
  - ✅ Gestión de usuarios operadores
  - ✅ Interfaz responsive con tema oscuro/claro
  - ✅ API REST con 30+ endpoints

### Características Técnicas
- **Framework**: Flask 3.1.2
- **Base de Datos**: SQLite (desarrollo), PostgreSQL (producción)
- **ORM**: SQLAlchemy 2.0.44
- **Frontend**: Bootstrap 5.3, JavaScript vanilla
- **Seguridad**: CSRF protection, XSS prevention, SQL injection prevention
- **Performance**: Connection pooling, índices de BD, caché
- **Logging**: Sistema completo de auditoría y logs

### Estructura
- 📁 Arquitectura modular con blueprints
- 📁 Separación clara: auth, main, api, services
- 📁 Documentación extensiva (25,000+ líneas)
- 📁 Scripts de instalación y deploy
- 📁 Guías de producción para Ubuntu

---

## Notas sobre Versioning

### Cómo se versionan los cambios:

**MAJOR (X.0.0)**: Cambios que rompen compatibilidad
- Requieren migración manual de BD
- Pueden requiere reinstalación

**MINOR (1.X.0)**: Nuevas features compatibles
- No requieren cambios en BD existentes
- Usuarios pueden usar nuevas features opcionalmente

**PATCH (1.0.X)**: Bug fixes
- Correcciones menores
- Mejoras de rendimiento

### Cómo actualizar:

```bash
# Descarga automática de cambios
./update-server.sh

# Manualmente:
git pull origin main
pip install -r requirements.prod.txt
flask db upgrade  # Si hay migraciones
systemctl restart control_patrimonial
```

---

## Roadmap Futuro (Planeado)

### v1.2.0 (Próximo)
- [ ] 📧 Email para notificaciones
- [ ] 📱 API móvil mejorada
- [ ] 🔔 Notificaciones en tiempo real
- [ ] 📈 Gráficos interactivos mejorados

### v1.3.0
- [ ] 🔗 Integración con ERP externo
- [ ] 📸 Fotos de bienes
- [ ] 🗺️ Mapa de ubicaciones
- [ ] 📊 Reportes personalizables

### v2.0.0
- [ ] ⚙️ Arquitectura con microservicios
- [ ] 📱 Aplicación móvil nativa
- [ ] 🤖 Machine Learning para predicciones
- [ ] 🌍 Soporte multi-idioma
- [ ] ☁️ Sincronización en nube

---

## Autores y Créditos

- **Desarrollador Principal**: Asistente Claude
- **Periodo de Desarrollo**: Noviembre 2025
- **Cliente**: Ministerio Público / Distrito Fiscal

---

## Licencia

Este proyecto está bajo licencia MIT. Ver archivo `LICENSE` para más detalles.

---

## Contacto y Soporte

Para reportar bugs, sugerencias o actualizaciones:
- 📧 Email: admin@control-patrimonial.local
- 🐛 Issues: Reportar en repositorio interno
- 📞 Soporte: Contactar administrador del sistema
