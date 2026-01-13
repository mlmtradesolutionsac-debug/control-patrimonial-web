# ANÁLISIS DE MEJORAS DE FUNCIONALIDAD - v1.2

**Fecha**: 27 de Noviembre de 2025
**Estado**: ANÁLISIS EXHAUSTIVO
**Versión actual**: 1.2 (post-refactorización)

---

## 📋 EVALUACIÓN DE VIABILIDAD POR MEJORA

### 1. SISTEMA DE IMPORTACIÓN/EXPORTACIÓN

**Descripción**:
- Importar bienes desde Excel/CSV
- Exportar a PDF, Excel, CSV
- Plantillas estándar de importación

#### 1.1 Importación desde Excel/CSV
**Viabilidad**: ✅ ALTO
**Tiempo estimado**: 3-4 horas
**Complejidad**: Media
**Riesgo**: MEDIO (validación crítica, manejo de errores)

**Implementación propuesta:**
```python
# app/services/import_service.py (NUEVO)
from openpyxl import load_workbook
import csv
import pandas as pd

class ImportService:
    def importar_excel(archivo):
        """Importar bienes desde Excel con validación"""
        df = pd.read_excel(archivo)
        errores = []
        creados = 0

        for idx, row in df.iterrows():
            try:
                data = {
                    'codigo_patrimonial': row['Código'],
                    'denominacion': row['Denominación'],
                    'sede': row['Sede ID'],
                    'estado': row['Estado'],
                    # ... más campos ...
                }
                # Validar con validate_bien_data()
                errors = validate_bien_data(data)
                if errors:
                    errores.append({'fila': idx+1, 'errores': errors})
                else:
                    repo.crear_bien(data, usuario_actual)
                    creados += 1
            except Exception as e:
                errores.append({'fila': idx+1, 'error': str(e)})

        return {'creados': creados, 'errores': errores}
```

**Validaciones necesarias**:
- ✅ Archivo válido (Excel/CSV)
- ✅ Columnas requeridas presentes
- ✅ Datos válidos según validate_bien_data()
- ✅ Códigos patrimoniales únicos (no duplicados)
- ✅ Sedes válidas
- ✅ Manejo de errores por fila (no fallar todo)

**Beneficios**:
- Carga masiva en lugar de manual (100+ bienes en minutos)
- Actualizaciones rápidas de BD desde Excel
- Plantilla estándar facilita entrada de datos

**Riesgo mitigation**:
- Validar CADA fila antes de insertar
- Rollback en caso de error crítico
- Generar reporte de errores
- Dry-run (preview) antes de confirmar

**Dependencias**:
- `openpyxl` (5 MB)
- `pandas` (140 MB) - ya podría estar
- `xlrd` (para xls antiguo)

---

#### 1.2 Exportación a múltiples formatos
**Viabilidad**: ✅ ALTO
**Tiempo estimado**: 2-3 horas
**Complejidad**: Baja-Media
**Riesgo**: BAJO

**Formatos a implementar:**
1. **CSV** - Más simple, 30 minutos
   ```python
   import csv

   def exportar_csv(filtros=None):
       bienes = repo.listar_bienes(filtros)
       output = io.StringIO()
       writer = csv.DictWriter(output, fieldnames=[...])
       writer.writeheader()
       writer.writerows(bienes)
       return output.getvalue()
   ```

2. **Excel** - Más bonito, 1 hora
   ```python
   from openpyxl import Workbook

   def exportar_excel(filtros=None):
       bienes = repo.listar_bienes(filtros)
       wb = Workbook()
       ws = wb.active

       # Headers con formato
       ws.append([...])

       # Datos con estilos
       for bien in bienes:
           ws.append([...])

       # Guardar con autofit
       return wb
   ```

3. **PDF** - Más profesional, 1.5 horas
   ```python
   from reportlab.lib import colors
   from reportlab.platypus import SimpleDocTemplate, Table

   def exportar_pdf(filtros=None):
       bienes = repo.listar_bienes(filtros)

       elements = []
       elements.append(Paragraph("Reporte de Bienes", styles['Title']))

       # Tabla con datos
       data = [['Código', 'Denominación', 'Sede', 'Estado']]
       for bien in bienes:
           data.append([bien['codigo_patrimonial'], ...])

       t = Table(data)
       t.setStyle(TableStyle([...]))
       elements.append(t)

       pdf = SimpleDocTemplate("output.pdf")
       pdf.build(elements)
   ```

**Rutas propuestas:**
```python
# app/main/routes.py
@main.route('/exportar/<formato>', methods=['GET'])
def exportar(formato):
    filtros = request.args.to_dict()

    if formato == 'csv':
        content = export_service.exportar_csv(filtros)
        return Response(content, mimetype='text/csv')

    elif formato == 'excel':
        wb = export_service.exportar_excel(filtros)
        return send_file(wb, ...)

    elif formato == 'pdf':
        pdf = export_service.exportar_pdf(filtros)
        return send_file(pdf, ...)
```

**Beneficios**:
- ✅ Usuarios pueden sacar datos en formato que necesitan
- ✅ Integración con otros sistemas (Excel → tu software)
- ✅ Reportes profesionales en PDF
- ✅ Cumplimiento normativo (reportes auditables)

---

#### 1.3 Plantillas estándar para importación
**Viabilidad**: ✅ ALTO
**Tiempo estimado**: 1 hora
**Complejidad**: Baja
**Riesgo**: BAJO

**Implementación:**
```python
def descargar_plantilla_importacion():
    """Descargar plantilla Excel con estructura correcta"""
    wb = Workbook()
    ws = wb.active

    # Headers
    ws.append(['Código Patrimonial', 'Denominación', 'Sede ID', 'Estado', ...])

    # Ejemplo de datos (opcional)
    ws.append(['PATRI-2025-001', 'Equipo ejemplo', '1', 'Bueno', ...])

    # Validación en comentarios
    ws['A1'].comment = Comment("Formato: XX-XXXX-NNN", "System")

    return send_file(wb, ...)
```

**Archivo estático:**
```
templates/
  └── plantilla_importacion_bienes.xlsx
```

---

### RESUMEN MEJORA 1: IMPORTACIÓN/EXPORTACIÓN

| Aspecto | Detalles |
|---------|----------|
| **Tiempo Total** | 6-8 horas (importar 3-4h + exportar 2-3h + plantilla 1h) |
| **Complejidad** | Media |
| **Riesgo** | MEDIO (validación y rollback son críticos) |
| **Prioridad** | ⭐⭐⭐ (MUY IMPORTANTE para usuarios) |
| **Impacto** | ALTO - Operación diaria (importar Excel, exportar reportes) |
| **Dependencias** | openpyxl, pandas, reportlab |
| **BD** | Sin cambios |
| **Código Legacy** | Compatible |

---

## 2. BÚSQUEDA AVANZADA

**Descripción**:
- Filtros por fechas
- Búsqueda por rangos (fechas, valores)
- Autocompletado

#### 2.1 Filtros por fechas
**Viabilidad**: ✅ ALTO
**Tiempo estimado**: 1.5 horas
**Complejidad**: Media
**Riesgo**: BAJO

**Implementación:**
```python
# app/repository.py - modificar listar_bienes()
def listar_bienes(self, filtros=None, limit=20, offset=0):
    query = Bien.query

    # ... filtros existentes ...

    # NUEVO: Filtros por fechas
    if filtros.get('fecha_desde'):
        fecha_desde = datetime.strptime(filtros['fecha_desde'], '%Y-%m-%d')
        query = query.filter(Bien.fecha_registro >= fecha_desde)

    if filtros.get('fecha_hasta'):
        fecha_hasta = datetime.strptime(filtros['fecha_hasta'], '%Y-%m-%d')
        query = query.filter(Bien.fecha_registro <= fecha_hasta)

    if filtros.get('fecha_modificacion_desde'):
        fecha_mod = datetime.strptime(filtros['fecha_modificacion_desde'], '%Y-%m-%d')
        query = query.filter(Bien.fecha_modificacion >= fecha_mod)

    return query.limit(limit).offset(offset).all()
```

**Template:**
```html
<form method="GET" class="search-form">
    <!-- Búsqueda general -->
    <input type="text" name="q" placeholder="Búsqueda rápida">

    <!-- Filtros por fechas -->
    <div class="date-filters">
        <label>Desde:</label>
        <input type="date" name="fecha_desde">

        <label>Hasta:</label>
        <input type="date" name="fecha_hasta">
    </div>

    <button type="submit">Buscar</button>
</form>
```

**Campos de fecha disponibles:**
- `fecha_registro` (cuándo se agregó el bien)
- `fecha_modificacion` (última actualización)
- `cal_2025_fecha` (si implementas campos CAL-específicos)

---

#### 2.2 Búsqueda por rangos
**Viabilidad**: ✅ ALTO
**Tiempo estimado**: 1 hora
**Complejidad**: Baja
**Riesgo**: BAJO

**Implementación:**
```python
# app/repository.py
if filtros.get('valor_desde'):
    valor_min = float(filtros['valor_desde'])
    query = query.filter(Bien.valor_estimado >= valor_min)

if filtros.get('valor_hasta'):
    valor_max = float(filtros['valor_hasta'])
    query = query.filter(Bien.valor_estimado <= valor_max)

# Para fechas: rango (ya cubierto arriba)
if filtros.get('anno_desde'):
    anno_desde = int(filtros['anno_desde'])
    query = query.filter(extract('year', Bien.fecha_registro) >= anno_desde)
```

**Template:**
```html
<div class="range-filters">
    <label>Rango de valores:</label>
    <input type="number" name="valor_desde" placeholder="Mínimo">
    <input type="number" name="valor_hasta" placeholder="Máximo">

    <label>Rango de años:</label>
    <input type="number" name="anno_desde" placeholder="Desde">
    <input type="number" name="anno_hasta" placeholder="Hasta">
</div>
```

---

#### 2.3 Autocompletado
**Viabilidad**: ✅ MEDIO-ALTO
**Tiempo estimado**: 2 horas
**Complejidad**: Media
**Riesgo**: BAJO (performance si no es eficiente)

**Implementación:**
```python
# app/api/routes.py (endpoint AJAX)
@api.route('/api/autocomplete', methods=['GET'])
def autocomplete():
    q = request.args.get('q', '').strip()
    tipo = request.args.get('tipo', 'denominacion')  # 'denominacion', 'marca', 'sede'

    if len(q) < 2:
        return jsonify([])

    if tipo == 'denominacion':
        resultados = Bien.query.filter(
            Bien.denominacion.ilike(f'%{q}%')
        ).distinct(Bien.denominacion).limit(10).all()

        return jsonify([{'label': b.denominacion, 'value': b.denominacion}
                        for b in resultados])

    # ... similar para otros tipos ...
```

**Frontend (jQuery UI o similar):**
```html
<script>
$(function() {
    $("#denominacion").autocomplete({
        source: function(request, response) {
            $.ajax({
                url: "/api/autocomplete",
                data: {
                    q: request.term,
                    tipo: 'denominacion'
                },
                success: response
            });
        },
        minLength: 2
    });
});
</script>
```

**Beneficios:**
- ✅ Búsqueda más rápida (sugerencias mientras escribes)
- ✅ Reduce errores de tipeo
- ✅ Mejor UX (usuarios no necesitan saber valores exactos)

**Riesgo:** Si hay 12,808 bienes con muchas denominaciones diferentes, autocompletado podría ser lento. **Mitigation**: Caché, índices en BD, o limitar a top 10 resultados.

---

### RESUMEN MEJORA 2: BÚSQUEDA AVANZADA

| Aspecto | Detalles |
|---------|----------|
| **Tiempo Total** | 4-5 horas (fechas 1.5h + rangos 1h + autocompletado 2h) |
| **Complejidad** | Media |
| **Riesgo** | BAJO |
| **Prioridad** | ⭐⭐⭐ (MUY IMPORTANTE para usuarios) |
| **Impacto** | ALTO - Búsqueda es operación diaria |
| **Dependencias** | jQuery UI u otra librería de autocompletado |
| **BD** | Sin cambios (usar campos existentes) |
| **Código Legacy** | Compatible |

---

## 3. REPORTES PERSONALIZADOS

**Descripción**:
- Sistema de reportes con filtros
- Gráficos interactivos
- Generación programada (schedulada)

#### 3.1 Sistema de reportes con filtros
**Viabilidad**: ✅ MEDIO-ALTO
**Tiempo estimado**: 3-4 horas
**Complejidad**: Media-Alta
**Riesgo**: BAJO

**Implementación:**
```python
# app/services/report_service.py (NUEVO)
class ReportService:
    def generar_reporte_bienes(filtros):
        """Generar reporte con filtros personalizados"""
        bienes = repo.listar_bienes(filtros)

        stats = {
            'total': len(bienes),
            'por_estado': {},
            'por_sede': {},
            'por_dependencia': {}
        }

        for bien in bienes:
            # Contar por estado
            estado = bien['estado']
            stats['por_estado'][estado] = stats['por_estado'].get(estado, 0) + 1

            # Contar por sede
            sede = bien['sede_nombre']
            stats['por_sede'][sede] = stats['por_sede'].get(sede, 0) + 1

            # Contar por dependencia
            dep = bien['unidad_nombre']
            stats['por_dependencia'][dep] = stats['por_dependencia'].get(dep, 0) + 1

        return {
            'bienes': bienes,
            'estadisticas': stats,
            'fecha_generacion': datetime.now(),
            'filtros_aplicados': filtros
        }
```

**Tipos de reportes predefinidos:**
1. **Reporte de Inventario General**
   - Todos los bienes
   - Agrupado por Sede/Dependencia
   - Total de bienes por estado

2. **Reporte de Bienes por Estado**
   - Filtrar por estado (Bueno, Regular, Malo)
   - Fecha de última revisión

3. **Reporte CAL 2025**
   - Bienes inventariados vs pendientes
   - Por Dependencia
   - Progreso en %

4. **Reporte de Cambios Recientes**
   - Bienes modificados en últimas N días
   - Quién hizo los cambios
   - Qué se cambió (historial)

---

#### 3.2 Gráficos interactivos
**Viabilidad**: ✅ ALTO
**Tiempo estimado**: 2-3 horas
**Complejidad**: Media
**Riesgo**: BAJO (dependencia en librería externa)

**Opciones de librerías:**
- **Chart.js** - Ligero, bonito, fácil (RECOMENDADO)
- **Plotly** - Más interactivo pero más pesado
- **D3.js** - Más control pero curva aprendizaje

**Implementación con Chart.js:**
```python
# app/main/routes.py
@main.route('/reportes/dashboard')
def dashboard_reportes():
    stats = repo.obtener_resumen_completo()

    # Preparar datos para gráficos
    chart_data = {
        'bienes_por_estado': {
            'labels': ['Bueno', 'Regular', 'Malo'],
            'data': [
                stats['bienes_bueno'],
                stats['bienes_regular'],
                stats['bienes_malo']
            ]
        },
        'bienes_por_sede': {
            'labels': list(stats['por_sede'].keys()),
            'data': list(stats['por_sede'].values())
        }
    }

    return render_template('reportes/dashboard.html', charts=chart_data)
```

**Template:**
```html
<div class="chart-container">
    <canvas id="estadoChart"></canvas>
</div>

<script>
const ctx = document.getElementById('estadoChart').getContext('2d');
const chart = new Chart(ctx, {
    type: 'doughnut',
    data: {
        labels: {{ charts.bienes_por_estado.labels|tojson }},
        datasets: [{
            data: {{ charts.bienes_por_estado.data|tojson }},
            backgroundColor: ['#28a745', '#ffc107', '#dc3545']
        }]
    },
    options: {
        responsive: true,
        plugins: {
            legend: { position: 'bottom' }
        }
    }
});
</script>
```

**Gráficos a implementar:**
1. **Pie/Doughnut** - Estado de bienes (Bueno/Regular/Malo)
2. **Bar** - Bienes por Sede (comparativa)
3. **Bar** - Bienes por Dependencia (top 10)
4. **Line** - Progreso CAL 2025 (inventariados vs total)
5. **Horizontal Bar** - Top 10 dependencias con más bienes

---

#### 3.3 Generación programada de reportes
**Viabilidad**: ✅ MEDIO
**Tiempo estimado**: 2-3 horas
**Complejidad**: Media
**Riesgo**: MEDIO (tareas background, scheduling)

**Implementación con APScheduler:**
```python
# app/__init__.py
from apscheduler.schedulers.background import BackgroundScheduler

scheduler = BackgroundScheduler()

def generar_reportes_diarios():
    """Generado automáticamente a las 6 AM cada día"""
    with app.app_context():
        # Generar reporte general
        reporte = ReportService.generar_reporte_bienes({})

        # Guardar como PDF
        pdf = pdf_service.generar_pdf(reporte)
        pdf.save(f'reportes/reporte_diario_{date.today()}.pdf')

        # Enviar por email (si está configurado)
        enviar_email_reporte(pdf)

scheduler.add_job(generar_reportes_diarios, 'cron', hour=6)
scheduler.start()
```

**Configuración de reportes programados:**
```python
# Reportes automáticos disponibles:
REPORTES_PROGRAMADOS = {
    'diario': {'hora': 6, 'destinatarios': ['admin@example.com']},
    'semanal': {'dia': 'lunes', 'hora': 8, 'destinatarios': ['supervisor@example.com']},
    'mensual': {'dia': 1, 'hora': 9, 'destinatarios': ['director@example.com']}
}
```

**Beneficios:**
- ✅ Reportes automáticos sin intervención manual
- ✅ Email con PDF adjunto
- ✅ Archivo guardado en servidor para auditoría

**Riesgo:** Tareas background pueden fallar. **Mitigation**: Log de ejecución, reintentos, alertas si fallan.

---

### RESUMEN MEJORA 3: REPORTES PERSONALIZADOS

| Aspecto | Detalles |
|---------|----------|
| **Tiempo Total** | 7-10 horas (filtros 3-4h + gráficos 2-3h + programado 2-3h) |
| **Complejidad** | Media-Alta |
| **Riesgo** | BAJO (gráficos) a MEDIO (programado) |
| **Prioridad** | ⭐⭐⭐ (MUY IMPORTANTE para directivos) |
| **Impacto** | ALTO - Análisis de datos, toma de decisiones |
| **Dependencias** | Chart.js, APScheduler, reportlab |
| **BD** | Sin cambios (usar datos existentes) |
| **Código Legacy** | Compatible |

---

## 4. GESTIÓN DE USUARIOS MEJORADA

**Descripción**:
- Roles específicos (admin, supervisor, operador, consulta)
- Reset de contraseña
- Deshabilitar usuarios temporalmente

#### 4.1 Sistema de roles específicos
**Viabilidad**: ✅ ALTO
**Tiempo estimado**: 2-3 horas
**Complejidad**: Media
**Riesgo**: BAJO-MEDIO (seguridad, permisos críticos)

**Estado actual:**
```python
# Hay 2 tipos de usuarios:
# 1. Usuario (admin) - usuarios tabla
# 2. UsuarioApp (operador/consulta) - usuarios_app tabla
```

**Propuesta:**
```python
# app/models_sqlalchemy.py
class Usuario(db.Model):
    # ... campos existentes ...

    # NUEVO: Sistema de roles
    rol = db.Column(db.String(20), default='administrador')
    # Valores: 'administrador', 'supervisor', 'operador', 'consulta'

    activo = db.Column(db.Boolean, default=True)

# Permisos por rol:
PERMISOS = {
    'administrador': ['crear', 'leer', 'actualizar', 'eliminar', 'gestionar_usuarios', 'reportes'],
    'supervisor': ['crear', 'leer', 'actualizar', 'reportes'],
    'operador': ['crear', 'leer', 'actualizar'],
    'consulta': ['leer']
}
```

**Decorador de permisos:**
```python
from functools import wraps

def requiere_permiso(permiso):
    def decorator(f):
        @wraps(f)
        def decorated_function(*args, **kwargs):
            usuario = current_user
            if permiso not in PERMISOS.get(usuario.rol, []):
                flash('No tienes permiso para esta acción', 'danger')
                return redirect(url_for('main.index'))
            return f(*args, **kwargs)
        return decorated_function
    return decorator

# Uso en rutas:
@main.route('/bienes/crear', methods=['POST'])
@login_required
@requiere_permiso('crear')
def crear_bien():
    ...
```

---

#### 4.2 Reset de contraseña
**Viabilidad**: ✅ ALTO
**Tiempo estimado**: 1.5 horas
**Complejidad**: Baja
**Riesgo**: BAJO-MEDIO (seguridad, reset links seguros)

**Implementación con tokens seguros:**
```python
# app/auth/routes.py (NUEVO)
from itsdangerous import URLSafeTimedSerializer

def generar_reset_token(usuario_id):
    """Generar token de reset válido por 24 horas"""
    serializer = URLSafeTimedSerializer(app.config['SECRET_KEY'])
    return serializer.dumps({'usuario_id': usuario_id}, salt='reset-password')

def verificar_reset_token(token, expiracion=86400):  # 24 horas
    serializer = URLSafeTimedSerializer(app.config['SECRET_KEY'])
    try:
        data = serializer.loads(token, salt='reset-password', max_age=expiracion)
        return data['usuario_id']
    except:
        return None

@auth.route('/reset-password-request', methods=['GET', 'POST'])
def reset_password_request():
    if current_user.is_authenticated:
        return redirect(url_for('main.index'))

    if request.method == 'POST':
        usuario = Usuario.query.filter_by(usuario=request.form.get('usuario')).first()
        if usuario:
            token = generar_reset_token(usuario.id)
            reset_url = url_for('auth.reset_password', token=token, _external=True)

            # Enviar email (usar Flask-Mail)
            enviar_email_reset(usuario.email, reset_url)
            flash('Email de reset enviado (válido por 24 horas)', 'info')
        else:
            flash('Usuario no encontrado', 'warning')

    return render_template('auth/reset_request.html')

@auth.route('/reset-password/<token>', methods=['GET', 'POST'])
def reset_password(token):
    usuario_id = verificar_reset_token(token)
    if not usuario_id:
        flash('Token inválido o expirado', 'danger')
        return redirect(url_for('auth.login'))

    if request.method == 'POST':
        usuario = Usuario.query.get(usuario_id)
        nueva_password = request.form.get('password')

        # Validar contraseña
        if len(nueva_password) < 8:
            flash('Contraseña debe tener al menos 8 caracteres', 'danger')
        else:
            usuario.password = sha256(nueva_password.encode()).hexdigest()
            db.session.commit()
            flash('Contraseña actualizada correctamente', 'success')
            return redirect(url_for('auth.login'))

    return render_template('auth/reset_password.html', token=token)
```

---

#### 4.3 Deshabilitar usuarios temporalmente
**Viabilidad**: ✅ ALTO
**Tiempo estimado**: 30 minutos
**Complejidad**: Baja
**Riesgo**: BAJO

**Implementación:**
```python
# Ya está en el modelo:
class Usuario(db.Model):
    activo = db.Column(db.Boolean, default=True)

# En login():
def login(self, usuario, password):
    usuario_obj = Usuario.query.filter_by(usuario=usuario).first()
    if usuario_obj and not usuario_obj.activo:  # NUEVO
        return None  # Usuario deshabilitado

    if usuario_obj and usuario_obj.password == sha256(password.encode()).hexdigest():
        return usuario_obj.to_dict()
    return None

# Gestión de usuarios (admin):
@main.route('/admin/usuarios/<int:user_id>/toggle', methods=['POST'])
@login_required
@requiere_permiso('gestionar_usuarios')
def toggle_usuario_activo(user_id):
    usuario = Usuario.query.get_or_404(user_id)
    usuario.activo = not usuario.activo
    db.session.commit()

    estado = "habilitado" if usuario.activo else "deshabilitado"
    flash(f'Usuario {estado}', 'success')
    return redirect(url_for('admin.usuarios'))
```

---

### RESUMEN MEJORA 4: GESTIÓN DE USUARIOS

| Aspecto | Detalles |
|---------|----------|
| **Tiempo Total** | 4-5 horas (roles 2-3h + reset 1.5h + toggle 0.5h) |
| **Complejidad** | Media |
| **Riesgo** | BAJO-MEDIO (seguridad crítica) |
| **Prioridad** | ⭐⭐⭐ (CRÍTICO para control de acceso) |
| **Impacto** | ALTO - Seguridad y gobernanza |
| **Dependencias** | itsdangerous (para tokens), Flask-Mail (opcional) |
| **BD** | Agregar campos: rol, activo |
| **Código Legacy** | Parcialmente compatible (agregar compatibilidad) |

---

## 5. NOTIFICACIONES

**Descripción**:
- Alertas para recordatorios (mantenimientos, revisiones)
- Notificaciones por email
- Panel de notificaciones en app

#### 5.1 Sistema de alertas/recordatorios
**Viabilidad**: ✅ MEDIO
**Tiempo estimado**: 2-3 horas
**Complejidad**: Media
**Riesgo**: BAJO-MEDIO (scheduling, triggers)

**Implementación:**
```python
# app/models_sqlalchemy.py (NUEVO MODELO)
class Alerta(db.Model):
    __tablename__ = 'alertas'

    id = db.Column(db.Integer, primary_key=True)
    bien_id = db.Column(db.Integer, db.ForeignKey('bienes.id'))
    tipo = db.Column(db.String(50))  # 'mantenimiento', 'revision', 'recordatorio'
    descripcion = db.Column(db.String(500))
    fecha_vencimiento = db.Column(db.DateTime)
    completada = db.Column(db.Boolean, default=False)
    usuario_asignado = db.Column(db.String(50))  # FK a Usuario
    fecha_creacion = db.Column(db.DateTime, default=datetime.now)

class Notificacion(db.Model):
    __tablename__ = 'notificaciones'

    id = db.Column(db.Integer, primary_key=True)
    usuario_id = db.Column(db.Integer, db.ForeignKey('usuarios.id'))
    tipo = db.Column(db.String(50))  # 'alerta', 'cambio', 'reporte'
    titulo = db.Column(db.String(200))
    mensaje = db.Column(db.String(1000))
    enlace = db.Column(db.String(500))  # Enlace a recurso relacionado
    leida = db.Column(db.Boolean, default=False)
    fecha_creacion = db.Column(db.DateTime, default=datetime.now)
```

**Servicio de alertas:**
```python
# app/services/alert_service.py (NUEVO)
class AlertService:
    @staticmethod
    def crear_alerta(bien_id, tipo, descripcion, fecha_vencimiento, usuario_asignado):
        """Crear nueva alerta"""
        alerta = Alerta(
            bien_id=bien_id,
            tipo=tipo,
            descripcion=descripcion,
            fecha_vencimiento=fecha_vencimiento,
            usuario_asignado=usuario_asignado
        )
        db.session.add(alerta)
        db.session.commit()

        # Generar notificación inmediata
        notif = Notificacion(
            usuario_id=Usuario.query.filter_by(usuario=usuario_asignado).first().id,
            tipo='alerta',
            titulo=f'Nueva alerta: {tipo}',
            mensaje=descripcion,
            enlace=f'/bienes/{bien_id}'
        )
        db.session.add(notif)
        db.session.commit()

    @staticmethod
    def obtener_alertas_vencidas():
        """Obtener alertas próximas a vencer o vencidas"""
        ahora = datetime.now()
        una_semana = ahora + timedelta(days=7)

        return Alerta.query.filter(
            Alerta.completada == False,
            Alerta.fecha_vencimiento <= una_semana
        ).all()

# Ejecutar cada hora (con APScheduler)
def procesar_alertas_vencidas():
    alertas = AlertService.obtener_alertas_vencidas()
    for alerta in alertas:
        # Crear notificación de recordatorio
        ...
```

---

#### 5.2 Notificaciones por email
**Viabilidad**: ✅ MEDIO-ALTO
**Tiempo estimado**: 1.5 horas
**Complejidad**: Baja-Media
**Riesgo**: BAJO (depende de servidor SMTP configurado)

**Implementación:**
```python
# app/__init__.py
from flask_mail import Mail, Message

mail = Mail(app)

# config.py
MAIL_SERVER = os.getenv('MAIL_SERVER', 'smtp.gmail.com')
MAIL_PORT = int(os.getenv('MAIL_PORT', 587))
MAIL_USE_TLS = os.getenv('MAIL_USE_TLS', True)
MAIL_USERNAME = os.getenv('MAIL_USERNAME')
MAIL_PASSWORD = os.getenv('MAIL_PASSWORD')
MAIL_DEFAULT_SENDER = os.getenv('MAIL_DEFAULT_SENDER', 'noreply@control-patrimonial.com')

# app/services/email_service.py (NUEVO)
def enviar_notificacion_alerta(usuario_email, alerta):
    """Enviar email con notificación de alerta"""
    msg = Message(
        subject=f'Alerta: {alerta.tipo}',
        recipients=[usuario_email],
        html=render_template('emails/alerta.html', alerta=alerta)
    )
    mail.send(msg)

def enviar_resumen_diario(usuario_email, alertas_pendientes):
    """Enviar resumen de alertas del día"""
    msg = Message(
        subject='Resumen de alertas - Control Patrimonial',
        recipients=[usuario_email],
        html=render_template('emails/resumen_diario.html', alertas=alertas_pendientes)
    )
    mail.send(msg)

# Uso:
# En AlertService.crear_alerta():
enviar_notificacion_alerta(usuario.email, alerta)
```

**Template de email:**
```html
<!-- templates/emails/alerta.html -->
<h2>Tienes una nueva alerta</h2>
<p><strong>Tipo:</strong> {{ alerta.tipo }}</p>
<p><strong>Descripción:</strong> {{ alerta.descripcion }}</p>
<p><strong>Fecha de vencimiento:</strong> {{ alerta.fecha_vencimiento.strftime('%d/%m/%Y') }}</p>
<a href="{{ url_for('main.ver_bien', bien_id=alerta.bien_id, _external=True) }}">Ver detalle del bien</a>
```

---

#### 5.3 Panel de notificaciones en app
**Viabilidad**: ✅ ALTO
**Tiempo estimado**: 1.5 horas
**Complejidad**: Baja
**Riesgo**: BAJO

**Implementación:**
```python
# app/main/routes.py
@main.route('/notificaciones')
@login_required
def ver_notificaciones():
    notificaciones = Notificacion.query.filter_by(
        usuario_id=current_user.id
    ).order_by(Notificacion.fecha_creacion.desc()).all()

    return render_template('notificaciones/lista.html', notificaciones=notificaciones)

@main.route('/notificaciones/<int:id>/marcar-leida', methods=['POST'])
@login_required
def marcar_notificacion_leida(id):
    notif = Notificacion.query.get_or_404(id)
    if notif.usuario_id != current_user.id:
        abort(403)

    notif.leida = True
    db.session.commit()
    return jsonify({'success': True})

@main.route('/api/notificaciones/sin-leer')
@login_required
def api_notificaciones_sin_leer():
    """Para actualizar contador en tiempo real"""
    count = Notificacion.query.filter_by(
        usuario_id=current_user.id,
        leida=False
    ).count()

    return jsonify({'sin_leer': count})
```

**Template:**
```html
<!-- Icono en navbar -->
<div class="notificaciones">
    <a href="#" class="notification-icon">
        🔔 <span class="badge badge-danger" id="count-sin-leer">0</span>
    </a>
    <div class="notification-dropdown" id="notificaciones-list"></div>
</div>

<script>
// Actualizar contador cada 10 segundos
setInterval(function() {
    $.get('/api/notificaciones/sin-leer', function(data) {
        $('#count-sin-leer').text(data.sin_leer);
    });
}, 10000);
</script>
```

---

### RESUMEN MEJORA 5: NOTIFICACIONES

| Aspecto | Detalles |
|---------|----------|
| **Tiempo Total** | 5-6 horas (alertas 2-3h + email 1.5h + panel 1.5h) |
| **Complejidad** | Media |
| **Riesgo** | BAJO (email), BAJO-MEDIO (scheduling) |
| **Prioridad** | ⭐⭐⭐ (IMPORTANTE para operaciones) |
| **Impacto** | ALTO - Reduce errores, recordatorios automáticos |
| **Dependencias** | Flask-Mail, APScheduler |
| **BD** | Nuevas tablas: Alerta, Notificacion |
| **Código Legacy** | Compatible |

---

## 6. CONTROL DE VERSIONES DE BIENES

**Descripción**:
- Mejorar historial con registro completo de cambios
- Ver diferencias entre versiones
- Restaurar versiones anteriores

#### 6.1 Mejorar sistema de historial
**Estado actual:**
```python
class Historial(db.Model):
    # Ya existe en modelos_sqlalchemy.py
    bien_id
    usuario
    accion
    fecha
    detalles
```

**Mejoras propuestas:**
```python
# app/models_sqlalchemy.py - EXPANDIR Historial
class Historial(db.Model):
    __tablename__ = 'historial'

    id = db.Column(db.Integer, primary_key=True)
    bien_id = db.Column(db.Integer, db.ForeignKey('bienes.id'), nullable=False)
    usuario = db.Column(db.String(50))
    accion = db.Column(db.String(50))  # 'crear', 'actualizar', 'eliminar'
    fecha = db.Column(db.DateTime, default=datetime.now)
    detalles = db.Column(db.Text)

    # NUEVOS campos para mejor rastreo:
    valores_anteriores = db.Column(db.JSON)  # {campo: valor_anterior}
    valores_nuevos = db.Column(db.JSON)      # {campo: valor_nuevo}
    campos_modificados = db.Column(db.String(500))  # 'estado,marca,ubicacion'
    ip_cliente = db.Column(db.String(50))    # Para auditoría
    version = db.Column(db.Integer)          # Número de versión

# Función para registrar cambios:
def registrar_cambio(bien_id, usuario, valores_anteriores, valores_nuevos):
    """Registrar cambio con diffs"""
    campos_modificados = []

    for campo in valores_nuevos:
        if valores_anteriores.get(campo) != valores_nuevos[campo]:
            campos_modificados.append(campo)

    # Obtener última versión
    ultima_version = Historial.query.filter_by(bien_id=bien_id).count()

    historial = Historial(
        bien_id=bien_id,
        usuario=usuario,
        accion='actualizar',
        valores_anteriores=valores_anteriores,
        valores_nuevos=valores_nuevos,
        campos_modificados=','.join(campos_modificados),
        ip_cliente=request.remote_addr,
        version=ultima_version + 1
    )

    db.session.add(historial)
    db.session.commit()
```

---

#### 6.2 Ver diferencias entre versiones
**Viabilidad**: ✅ ALTO
**Tiempo estimado**: 1.5 horas
**Complejidad**: Baja
**Riesgo**: BAJO

**Implementación:**
```python
# app/main/routes.py
@main.route('/bienes/<int:bien_id>/historial')
@login_required
def ver_historial_bien(bien_id):
    """Ver historial completo del bien"""
    bien = Bien.query.get_or_404(bien_id)
    historial = Historial.query.filter_by(bien_id=bien_id).order_by(
        Historial.version.desc()
    ).all()

    return render_template('bienes/historial.html', bien=bien, historial=historial)

@main.route('/bienes/<int:bien_id>/historial/comparar')
@login_required
def comparar_versiones(bien_id):
    """Comparar dos versiones del bien"""
    version1 = request.args.get('v1', type=int)
    version2 = request.args.get('v2', type=int)

    hist1 = Historial.query.filter_by(bien_id=bien_id, version=version1).first()
    hist2 = Historial.query.filter_by(bien_id=bien_id, version=version2).first()

    # Calcular diferencias
    diffs = {}
    for campo in hist2.valores_nuevos:
        if hist1 and hist1.valores_nuevos.get(campo) != hist2.valores_nuevos.get(campo):
            diffs[campo] = {
                'antes': hist1.valores_nuevos.get(campo),
                'despues': hist2.valores_nuevos.get(campo)
            }

    return render_template('bienes/comparar_versiones.html',
                         bien_id=bien_id,
                         version1=version1,
                         version2=version2,
                         diffs=diffs)
```

**Template:**
```html
<!-- Historial con timeline -->
<div class="timeline">
    {% for h in historial %}
    <div class="timeline-item">
        <div class="timeline-date">{{ h.fecha.strftime('%d/%m/%Y %H:%M') }}</div>
        <div class="timeline-content">
            <strong>{{ h.usuario }}</strong> - {{ h.accion }}
            <div class="changed-fields">
                {% for campo in h.campos_modificados.split(',') %}
                    <span class="badge">{{ campo }}</span>
                {% endfor %}
            </div>
            <a href="{{ url_for('main.comparar_versiones', bien_id=bien_id, v1=h.version, v2=h.version-1) }}">
                Ver cambios
            </a>
        </div>
    </div>
    {% endfor %}
</div>
```

---

#### 6.3 Restaurar versiones anteriores
**Viabilidad**: ✅ MEDIO
**Tiempo estimado**: 1 hora
**Complejidad**: Baja
**Riesgo**: MEDIO-ALTO (reversión de datos es crítica)

**Implementación segura:**
```python
# app/main/routes.py
@main.route('/bienes/<int:bien_id>/restaurar/<int:version>', methods=['POST'])
@login_required
@requiere_permiso('actualizar')
def restaurar_version(bien_id, version):
    """Restaurar bien a versión anterior"""
    # Validaciones
    if not puede_restaurar(current_user):
        flash('No tienes permiso para restaurar versiones', 'danger')
        return redirect(url_for('main.ver_bien', bien_id=bien_id))

    # Obtener snapshot anterior
    historial = Historial.query.filter_by(bien_id=bien_id, version=version).first()
    if not historial or not historial.valores_nuevos:
        flash('No se puede restaurar esta versión', 'danger')
        return redirect(url_for('main.ver_bien', bien_id=bien_id))

    # Guardar valores actuales ANTES de restaurar
    bien = Bien.query.get(bien_id)
    valores_actuales = bien.to_dict()

    # Restaurar
    for campo, valor in historial.valores_nuevos.items():
        if hasattr(bien, campo):
            setattr(bien, campo, valor)

    # Registrar restauración en historial
    registrar_cambio(bien_id, current_user.username, valores_actuales, historial.valores_nuevos)
    registrar_log_auditoria('RESTAURAR_VERSION', bien_id, current_user.username,
                           f'Restaurado a versión {version}')

    db.session.commit()
    flash(f'Bien restaurado a versión {version}', 'success')
    return redirect(url_for('main.ver_bien', bien_id=bien_id))
```

**Medidas de seguridad:**
- ✅ Solo usuarios con permiso 'actualizar' pueden restaurar
- ✅ Se registra la restauración en historial
- ✅ Se mantienen valores anteriores (sin pérdida de datos)
- ✅ Se crea log de auditoría

---

### RESUMEN MEJORA 6: CONTROL DE VERSIONES

| Aspecto | Detalles |
|---------|----------|
| **Tiempo Total** | 3-4 horas (historial extendido 1.5h + diffs 1.5h + restaurar 1h) |
| **Complejidad** | Media |
| **Riesgo** | BAJO (historial), MEDIO-ALTO (restauración) |
| **Prioridad** | ⭐⭐ (IMPORTANTE para auditoría) |
| **Impacto** | ALTO - Auditoría, compliance, recuperación de errores |
| **Dependencias** | Ninguna nueva |
| **BD** | Agregar campos a Historial |
| **Código Legacy** | Compatible |

---

## 📊 MATRIZ DE PRIORIDAD CONSOLIDADA

### TODAS LAS MEJORAS (Incluye mejoras secundarias previas + nuevas funcionalidades)

| # | Mejora | Tiempo | Impacto | Complejidad | Riesgo | Prioridad | Fase |
|---|--------|--------|---------|-------------|--------|-----------|------|
| **1.1** | Índices BD | 30 min | Alto | Baja | BAJO | ⭐⭐⭐ | INMEDIATO |
| **1.2** | Connection Pooling | 20 min | Medio | Baja | BAJO | ⭐⭐⭐ | INMEDIATO |
| **4.1** | Paginación mejorada | 2h | Medio | Baja | BAJO | ⭐⭐ | v1.3 PRONTO |
| **2.1** | Caching | 45 min | Alto | Media | BAJO | ⭐⭐⭐ | v1.3 PRONTO |
| **2.1-FUNC** | Búsqueda avanzada | 4-5h | Alto | Media | BAJO | ⭐⭐⭐ | v1.3 |
| **2.2-FUNC** | Importación/Exportación | 6-8h | Alto | Media | MEDIO | ⭐⭐⭐ | v1.3 |
| **3.1-FUNC** | Gestión usuarios mejorada | 4-5h | Alto | Media | BAJO-MEDIO | ⭐⭐⭐ | v1.3 |
| **3.2-FUNC** | Reportes personalizados | 7-10h | Alto | Media-Alta | BAJO-MEDIO | ⭐⭐⭐ | v1.3-v1.4 |
| **4.1-FUNC** | Control de versiones | 3-4h | Alto | Media | BAJO-MEDIO | ⭐⭐ | v1.4 |
| **5.1-FUNC** | Notificaciones | 5-6h | Alto | Media | BAJO-MEDIO | ⭐⭐ | v1.4 |

---

## 🗓️ ROADMAP RECOMENDADO

### **FASE 0 - INMEDIATO (1 hora)**
**Performance fixes - Sin nuevas funcionalidades**
- ✅ Índices BD (30 min)
- ✅ Connection Pooling (20 min)
- ✅ Testing (10 min)

**Beneficio**: +30-50% performance inmediato

---

### **FASE 1 - v1.3 (1-2 semanas)**
**Mejoras de UX y búsqueda**
- ✅ Caching de estadísticas (45 min)
- ✅ Paginación mejorada (2h)
- ✅ Búsqueda avanzada (4-5h)

**Beneficio**: 70% dashboard más rápido, búsqueda mucho mejor, UX mejorada

**Tiempo total**: 7-8 horas (~1-2 días de trabajo)

---

### **FASE 2 - v1.3-v1.4 (2-4 semanas)**
**Importación, Reportes y Gestión**
- ✅ Importación/Exportación (6-8h)
- ✅ Reportes personalizados (7-10h)
- ✅ Gestión de usuarios mejorada (4-5h)

**Beneficio**: Capacidades profesionales completas (importar/exportar, reportes, usuarios con roles)

**Tiempo total**: 17-23 horas (~3-4 días de trabajo)

---

### **FASE 3 - v1.4-v2.0 (4-6 semanas)**
**Auditoría y notificaciones**
- ✅ Control de versiones mejorado (3-4h)
- ✅ Notificaciones (5-6h)

**Beneficio**: Auditoría completa, alertas automáticas, recuperación de errores

**Tiempo total**: 8-10 horas (~1-2 días de trabajo)

---

## 🎯 RECOMENDACIÓN ESTRATÉGICA

### **Opción A: RÁPIDA (Producción en 1 semana)**
1. **HOY**: Fase 0 (Índices + Connection Pooling) - 1h
2. **Próximo día**: Caching + Paginación - 3h
3. **1 semana**: Ir a PRODUCCIÓN v1.2+ (mejorada pero sin nuevas funciones)
4. **Después**: Agregar funcionalidades en v1.3

**Ventajas**: Producción rápida, menos riesgo
**Desventajas**: Usuarios esperan importación/exportación, reportes

---

### **Opción B: BALANCEADA (Producción en 3 semanas) [RECOMENDADO]**
1. **HOY**: Fase 0 (1h)
2. **Próximo día**: Caching + Paginación (3h)
3. **Próximos 3 días**: Búsqueda avanzada (5h) + Importación/Exportación (8h)
4. **1 semana más**: Reportes (10h) + Gestión de usuarios (5h)
5. **Semana 3**: Testing, ajustes, PRODUCCIÓN v1.3

**Beneficio**: Todas las funciones críticas antes de producción

**Tiempo total**: ~35 horas (~5-6 días de trabajo)

---

### **Opción C: MÁXIMA (Producción en 6 semanas)**
Todas las fases + Control de versiones + Notificaciones

**Beneficio**: Sistema 100% completo
**Tiempo total**: ~45-50 horas (~7-8 días)

---

## 📋 PRÓXIMOS PASOS

**Antes de implementar cualquier mejora:**

- [ ] ¿Cuál es tu **timeline ideal** para producción?
  - Opción A: Rápida (1 semana)
  - Opción B: Balanceada (3 semanas) - RECOMENDADO
  - Opción C: Máxima (6 semanas)

- [ ] ¿Cuál es la **prioridad de funcionalidades** para tus usuarios?
  - Importación/Exportación (operativo urgente)
  - Búsqueda avanzada (uso diario)
  - Reportes (necesario para directivos)
  - Gestión de usuarios (control y seguridad)
  - Notificaciones (recordatorios)
  - Control de versiones (auditoría)

- [ ] ¿Necesitas **todo antes de producción** o puedes hacerlo **en versiones posteriores**?

---

**RESPONDE ESTAS 3 PREGUNTAS y diseño un plan exacto personalizado para tu proyecto.**

