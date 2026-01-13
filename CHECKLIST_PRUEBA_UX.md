# CHECKLIST DE PRUEBA - MEJORAS UX

**Fecha**: 27 de Noviembre de 2025
**Tiempo estimado de prueba**: 5-10 minutos

---

## PASOS PARA PROBAR LOCALMENTE

### 1. Iniciar Aplicación
```bash
cd E:\PROYECTOS WEB\control_patrimonial_web
python -m flask run
```

Verás:
```
 * Running on http://127.0.0.1:5000
```

---

### 2. Probar Tema Claro (Por Defecto)

Abre navegador: http://127.0.0.1:5000

**Visual Checks:**
- [ ] Fondo blanco (#ffffff)
- [ ] Texto negro (#212529)
- [ ] Navbar con gradiente azul
- [ ] Footer color primario
- [ ] Cards con sombra suave
- [ ] Botón toggle visible en navbar (icono luna)

---

### 3. Probar Toggle de Tema

**Acción**: Click en el icono luna/sol en la navbar (parte superior derecha)

**Verás cambios inmediatos:**
- [ ] Fondo cambia a gris oscuro (#0f1419)
- [ ] Texto cambia a gris claro (#e0e0e0)
- [ ] Cards se oscurecen
- [ ] Navbar mantiene color (gradiente)
- [ ] Footer se adapta
- [ ] Icono cambia de luna a sol
- [ ] Transición suave sin parpadeos

---

### 4. Probar Transiciones de Color

**Acción**: Observa mientras cambias entre temas

**Verás:**
- [ ] Colores transicionan suavemente (0.3 segundos)
- [ ] Sin cambios abruptos
- [ ] Sin parpadeos
- [ ] Las sombras se adaptan gradualmente

---

### 5. Probar Hover Effects

**Acción**: Pasa el mouse sobre elementos

**Componentes:**
- [ ] **Card**: Se eleva ligeramente (translateY -4px) y sombra aumenta
- [ ] **Avatar**: Escala aumenta (1.1) cuando pasas mouse
- [ ] **Botón Toggle**: Opacidad de fondo aumenta, ícono rota 20 grados
- [ ] **Botón Primary**: Se eleva 2px y sombra aumenta
- [ ] **Links**: Color cambia a rojo (#ff6b6b)

---

### 6. Probar Animaciones

**Acción**: Realiza acciones que muestren mensajes

**Si hay alertas:**
- [ ] Mensaje slide in desde arriba (0.3s)
- [ ] Smooth animation sin saltos

**Contenido principal:**
- [ ] Fade in desde abajo (0.5s) al cargar página

---

### 7. Probar Persistencia

**Acción 1**: Cambiar a tema oscuro, luego recargar página
```
Click on toggle → Oscuro
F5 (reload)
```

**Verás:**
- [ ] Tema oscuro persiste después de recargar
- [ ] No cambia a claro al recargar

**Acción 2**: Cambiar a tema claro, cerrar navegador y abrir de nuevo
```
Click on toggle → Claro
Cerrar y abrir navegador
```

**Verás:**
- [ ] Tema claro se mantiene entre sesiones
- [ ] Se guarda correctamente en localStorage

---

### 8. Probar Respuesta a Preferencia del SO

Si tu SO tiene tema oscuro:

**Acción**: Cambiar preferencia del SO de claro a oscuro

**En Windows 11:**
Configuración → Personalización → Colores → Modo oscuro

**Verás:**
- [ ] Si no guardaste preferencia manual, la app cambia automáticamente
- [ ] Si elegiste tema manualmente, se mantiene tu elección

---

### 9. Probar en Móvil/Responsive

**Acción**: Resize del navegador a 768px o menos

```
F12 (abrir dev tools)
Ctrl+Shift+M (modo móvil)
```

**Verás:**
- [ ] Navbar se ajusta correctamente
- [ ] Avatar más pequeño (40px vs 45px)
- [ ] Botón toggle se ajusta
- [ ] Main content con padding reducido
- [ ] Todo legible en móvil

---

### 10. Probar en Modo Oscuro del SO

**En tema oscuro:**

**Visual Checks:**
- [ ] Avatar gradient es visible
- [ ] Texto es legible
- [ ] Bordes se ven correctamente
- [ ] Dropdowns son visibles
- [ ] Formularios son usables

---

## CHECKLIST DE COMPONENTES

### Navbar
- [ ] Visible en ambos temas
- [ ] Toggle funciona
- [ ] Logo visible
- [ ] Links navegables
- [ ] Dropdown abierto correctamente

### Cards
- [ ] Fondo adapta al tema
- [ ] Sombra visible en ambos temas
- [ ] Hover eleva la card
- [ ] Transición suave

### Tablas
- [ ] Encabezado visible
- [ ] Filas alternadas (hover)
- [ ] Bordes claros
- [ ] Texto legible

### Botones
- [ ] Color correcto en ambos temas
- [ ] Hover con elevación
- [ ] Click con efecto ripple
- [ ] Texto visible

### Formularios
- [ ] Input visible en ambos temas
- [ ] Labels legibles
- [ ] Focus con borde primario
- [ ] Placeholder visible

### Alertas
- [ ] Success: Verde visible
- [ ] Danger: Rojo visible
- [ ] Warning: Naranja visible
- [ ] Info: Azul visible
- [ ] Slide in animation

---

## PROBLEMAS COMUNES Y SOLUCIONES

### Problema: Tema no cambia
**Solución**:
1. Abre Console (F12)
2. Verifica si hay errores JavaScript
3. Limpia localStorage: `localStorage.clear()`
4. Recarga página

### Problema: Transiciones lentas
**Solución**:
- Transiciones están limitadas a 0.3s (normal)
- Si el navegador está lento, todo estará lento
- Prueba en navegador diferente

### Problema: Tema no persiste
**Solución**:
- Verifica que localStorage no esté deshabilitado
- En navegador privado/incógnito no persiste
- Comprueba permisos del navegador

### Problema: Avatar no se ve
**Solución**:
- Avatar está en navbar
- Si no hay usuario autenticado, no se muestra
- Login primero: ir a http://127.0.0.1:5000/auth/login

---

## RESUMEN DE PRUEBA RÁPIDA (5 min)

```
1. Iniciar app: flask run
2. Abrir: http://127.0.0.1:5000
3. Click toggle (luna/sol)
4. Verificar cambio de tema
5. Recargar F5
6. Verificar que tema persiste
7. Click botones/cards
8. Verificar hover effects
9. Redimensionar a móvil
10. Listo!
```

---

## COMANDOS ÚTILES

### Limpiar localStorage en Console (F12)
```javascript
localStorage.clear()
location.reload()
```

### Ver tema actual en Console
```javascript
document.documentElement.getAttribute('data-theme')
```

### Ver preferencia guardada
```javascript
localStorage.getItem('theme-preference')
```

### Forzar tema oscuro
```javascript
document.documentElement.setAttribute('data-theme', 'dark')
localStorage.setItem('theme-preference', 'dark')
```

### Forzar tema claro
```javascript
document.documentElement.removeAttribute('data-theme')
localStorage.setItem('theme-preference', 'light')
```

---

## ¿TODO OK?

Si todos los checklist están completos, entonces:

**✅ Las mejoras UX están funcionando correctamente**

Siguiente paso:
1. Opción A: Implementar UX Avanzadas (opcional, 2-3h)
2. Opción B: Hacer FASE 2 (importación/exportación, 2-3h)
3. Opción C: Ambas (4-5h)
4. Opción D: Deploy a producción (seguir DEPLOYMENT_UBUNTU)

---

**Archivo**: `CHECKLIST_PRUEBA_UX.md`
