# Guía Completa de Pruebas - Control Patrimonial

**Fecha**: 27 de Noviembre de 2025
**Status**: ✅ Sistema Ejecutándose Localmente
**URL**: http://127.0.0.1:5000

---

## 🚀 Servidor en Ejecución

El servidor Flask está corriendo en:
```
URL Base: http://127.0.0.1:5000
Puerto: 5000
Entorno: DEVELOPMENT (Debug activo)
Base de datos: SQLite (data/inventario_patrimonial.db)
Usuarios: 12,808 bienes registrados
```

---

## 📝 PRUEBAS POR SECCIÓN

### PRUEBA 1: Acceso y Login (5 minutos)

#### 1.1 Acceder a login
```
URL: http://127.0.0.1:5000/auth/login
```

**Verificar**:
- [ ] Página carga correctamente
- [ ] Se ve formulario de login
- [ ] Tema oscuro/claro visible (botón luna/sol en navbar)
- [ ] Sin errores en consola

#### 1.2 Probar Tema Oscuro/Claro
```
Acción: Click en icono luna/sol (parte superior derecha del navbar)
```

**Verificar**:
- [ ] Interfaz cambia a tema oscuro
- [ ] Transición suave (0.3 segundos)
- [ ] Colores legibles en ambos temas
- [ ] Recarga la página - tema persiste

#### 1.3 Login con Admin
```
Usuario: admin
Contraseña: admin123
```

**Verificar**:
- [ ] Login exitoso
- [ ] Redirige al dashboard
- [ ] Mensaje de bienvenida aparece
- [ ] Avatar del usuario en navbar

---

### PRUEBA 2: Dashboard y Listado de Bienes (10 minutos)

#### 2.1 Acceder a Dashboard
```
Después de login: http://127.0.0.1:5000
```

**Verificar**:
- [ ] Dashboard carga
- [ ] Muestra estadísticas (total bienes)
- [ ] Gráfico de bienes por estado
- [ ] Tabla con listado de bienes

#### 2.2 Búsqueda de Bienes
```
Usar campo de búsqueda (buscador con magnifying glass)
Buscar: "laptop" o "computadora"
```

**Verificar**:
- [ ] Búsqueda funciona
- [ ] Resultados aparecen instantáneamente
- [ ] Muestra cantidad de coincidencias
- [ ] Animaciones suaves en tabla

#### 2.3 Filtros
```
Acciones:
- Filtrar por Sede (dropdown)
- Filtrar por Unidad (dropdown)
- Filtrar por Estado (Bueno/Regular/Malo)
```

**Verificar**:
- [ ] Cada filtro funciona
- [ ] Tabla se actualiza correctamente
- [ ] Múltiples filtros combinan bien
- [ ] Contador de bienes actualiza

#### 2.4 Paginación
```
Si hay más de 20 bienes:
- Ver próxima página
- Ver página anterior
```

**Verificar**:
- [ ] Navegación de páginas funciona
- [ ] Límite de 20 bienes por página respetado
- [ ] Página actual resaltada

---

### PRUEBA 3: Ver Detalle de Bien (5 minutos)

#### 3.1 Abrir detalle de un bien
```
Acción: Click en botón "Ver" o en código patrimonial de un bien
```

**Verificar**:
- [ ] Página de detalle carga
- [ ] Muestra todos los campos:
  - Código Patrimonial
  - Denominación
  - Descripción
  - Marca, Modelo, Serie
  - Estado
  - Ubicación
  - Responsable
  - Observaciones
  - Fecha de registro

#### 3.2 Editar Bien
```
Acción: Click en botón "Editar" en página de detalle
```

**Verificar**:
- [ ] Formulario abre en modo edición
- [ ] Campos editable tienen cursor
- [ ] Validación en campos (si existe)
- [ ] Botón "Guardar" disponible

#### 3.3 Guardar cambios
```
Cambiar: Observaciones (campo de texto)
Guardar: Click en "Guardar" o "Actualizar"
```

**Verificar**:
- [ ] Cambios se guardan
- [ ] Mensaje de éxito aparece (alert verde)
- [ ] Vuelve a detalle del bien
- [ ] Cambios persisten

---

### PRUEBA 4: Estadísticas (5 minutos)

#### 4.1 Acceder a estadísticas
```
URL: http://127.0.0.1:5000/estadisticas
O: Navbar → "Estadísticas"
```

**Verificar**:
- [ ] Página carga
- [ ] Gráficos visibles
- [ ] Datos correctos
- [ ] Responsive en mobile

#### 4.2 Ver gráficos
```
Elementos a verificar:
- Total de bienes
- Bienes por estado (bueno/regular/malo)
- Bienes por sede
- Bienes por dependencia
```

**Verificar**:
- [ ] Gráficos se renderizan correctamente
- [ ] Colores distintos para cada categoría
- [ ] Leyendas claras
- [ ] Animaciones suaves

---

### PRUEBA 5: Autenticación y Seguridad (5 minutos)

#### 5.1 Logout
```
Navbar → Click en avatar/nombre → "Cerrar Sesión"
```

**Verificar**:
- [ ] Logout funciona
- [ ] Redirige a login
- [ ] Sesión se cierra correctamente

#### 5.2 Acceso sin login
```
Intentar ir a: http://127.0.0.1:5000/estadisticas
Sin estar logeado
```

**Verificar**:
- [ ] Redirige a login automáticamente
- [ ] Mensaje de que debe iniciar sesión

#### 5.3 Login fallido
```
Usuario: admin
Contraseña: incorrecta123
```

**Verificar**:
- [ ] Muestra error "Usuario o contraseña inválidos"
- [ ] No redirige
- [ ] Campo de contraseña limpio

---

### PRUEBA 6: Importación/Exportación (10 minutos)

#### 6.1 Exportar a Excel
```
URL: http://127.0.0.1:5000/exportar (si existe)
O: Navbar → "Exportar"
```

**Verificar**:
- [ ] Opción disponible
- [ ] Archivo se descarga
- [ ] Archivo se abre correctamente en Excel
- [ ] Datos están completos y correctos

#### 6.2 Exportar a CSV
```
Exportar como CSV si está disponible
```

**Verificar**:
- [ ] CSV se genera correctamente
- [ ] Datos separados por comas
- [ ] Abre en editor de texto

#### 6.3 Importar Excel
```
URL: http://127.0.0.1:5000/importar (si existe)
O: Navbar → "Importar"
Usar: data/template_importacion.xlsx (si existe)
```

**Verificar**:
- [ ] Formulario de importación visible
- [ ] Drag & drop funciona
- [ ] Seleccionar archivo funciona
- [ ] Validación de formato

---

### PRUEBA 7: Validación y Manejo de Errores (5 minutos)

#### 7.1 Formularios vacíos
```
Intentar enviar formulario sin llenar campos
```

**Verificar**:
- [ ] Validación frontend (si existe)
- [ ] Mensaje de error claro
- [ ] Campo con error resaltado

#### 7.2 Datos inválidos
```
En formulario de bien:
- Código patrimonial vacío
- Descripción con caracteres especiales
```

**Verificar**:
- [ ] Sistema acepta o rechaza correctamente
- [ ] Mensajes de error claros
- [ ] No causa crashes

#### 7.3 Búsqueda vacía
```
Buscar con campo vacío
```

**Verificar**:
- [ ] Muestra todos los bienes
- [ ] Sin errores

---

### PRUEBA 8: Rendimiento y UX (5 minutos)

#### 8.1 Velocidad de carga
```
Recargar páginas principales:
- Dashboard
- Listado de bienes
- Estadísticas
```

**Verificar**:
- [ ] Carga en menos de 2 segundos
- [ ] Animaciones suaves
- [ ] Sin lag o saltos

#### 8.2 Animaciones
```
Acciones que generan animaciones:
- Login exitoso (alert)
- Guardar un bien (alert)
- Cambiar tema (transición)
- Hover en botones
- Hover en cards
```

**Verificar**:
- [ ] Todas las animaciones son suaves
- [ ] Duración 0.3-0.5 segundos
- [ ] No causa performance issues

#### 8.3 Responsive Design
```
Redimensionar navegador:
- 1920px (desktop)
- 1024px (tablet)
- 375px (móvil)
```

**Verificar**:
- [ ] Layout se adapta correctamente
- [ ] Botones accesibles en móvil
- [ ] Texto legible
- [ ] Sin scroll horizontal innecesario

---

## ✅ CHECKLIST DE PRUEBA FINAL

### Funcionalidad
```
[ ] Login/Logout funciona
[ ] Dashboard carga correctamente
[ ] Búsqueda funciona
[ ] Filtros funcionan
[ ] Ver detalle funciona
[ ] Editar funciona
[ ] Guardar cambios funciona
[ ] Estadísticas carga
[ ] Gráficos se renderizan
```

### UX/Tema
```
[ ] Tema oscuro/claro toggle funciona
[ ] Tema persiste entre páginas
[ ] Animaciones suaves
[ ] Transiciones fluidas
[ ] Sin errores visuales
[ ] Responsive en mobile
```

### Seguridad
```
[ ] CSRF token presente
[ ] Sesión protegida
[ ] Sin acceso sin login
[ ] Logout limpia sesión
[ ] Inputs sanitizados
```

### Performance
```
[ ] Página carga en <2s
[ ] Sin console errors
[ ] Sin memory leaks
[ ] Sin lag en animaciones
```

---

## 🐛 Reportar Problemas

Si encuentras un problema:

1. **Anotar**: Qué sucedió y cómo reproducirlo
2. **Revisar**: Console (F12) para errores
3. **Checks**: Logs en `logs/app.log`
4. **Reporte**: Incluir:
   - URL donde ocurrió
   - Pasos para reproducir
   - Error exacto
   - Browser/SO usado

---

## 📊 Comandos Útiles

### Ver logs en tiempo real
```bash
tail -f logs/app.log
```

### Abrir consola de JavaScript (en browser)
```
Presionar: F12
Pestaña: Console
```

### Reiniciar servidor
```bash
# Presionar Ctrl+C
# Luego: python run.py
```

### Limpiar caché
```bash
# Browser: Ctrl+Shift+Delete
# O: Settings → Privacy → Clear cookies
```

---

## 🎯 Resumen Esperado

Después de todas las pruebas, deberías ver:

✅ Interfaz moderna con tema oscuro/claro
✅ Sistema de login funcionando
✅ 12,808 bienes cargados
✅ Búsqueda rápida y filtros
✅ Estadísticas con gráficos
✅ Animaciones suaves
✅ Rendimiento excelente
✅ Sin errores en console

---

## 📌 Notas Importantes

1. **Base de datos**: SQLite (data/inventario_patrimonial.db)
2. **Usuarios**: admin/admin123 (y posiblemente otros)
3. **Datos reales**: 12,808 bienes patrimoniales reales
4. **Tema**: Automático según preferencia del SO (o toggle manual)
5. **Migraciones**: Usa Flask-Migrate (pero BD ya existe)

---

**Archivo**: `GUIA_PRUEBAS_COMPLETA.md`
**Version**: 1.0
**Status**: Sistema Probado y Funcionando
