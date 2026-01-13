# PLAN FASE 3 - REPORTES + GESTIÓN USUARIOS

**Continuación del Plan de Implementación Opción B (3 semanas)**

---

## 📊 FASE 3: REPORTES PERSONALIZADOS (7-10h) - DÍAS 5-7

### Paso 1: Instalar dependencias

```bash
pip install Chart.js apscheduler flask-mail
```

### Paso 2: Crear servicio de reportes

**Archivo**: `app/services/report_service.py` (NUEVO)

```python
"""
Servicio de generación de reportes personalizados
"""
from datetime import datetime, timedelta
from app.repository import RepoSQLAlchemy as Repo
from app.models_sqlalchemy import Bien, Historial
from sqlalchemy import func

class ReportService:
    """Genera reportes personalizados con estadísticas y gráficos"""

    @staticmethod
    def generar_reporte_bienes(filtros=None):
        """Generar reporte de bienes con estadísticas"""
        repo = Repo()
        bienes = repo.listar_bienes(filtros or {}, limit=10000)

        if not bienes:
            return {
                'bienes': [],
                'estadisticas': {},
                'fecha_generacion': datetime.now(),
                'filtros_aplicados': filtros or {}
            }

        # Calcular estadísticas
        stats = {
            'total': len(bienes),
            'por_estado': {},
            'por_sede': {},
            'por_dependencia': {},
        }

        for bien in bienes:
            # Por estado
            estado = bien.get('estado', 'Desconocido')
            stats['por_estado'][estado] = stats['por_estado'].get(estado, 0) + 1

            # Por sede
            sede = bien.get('sede_nombre', 'Sin sede')
            stats['por_sede'][sede] = stats['por_sede'].get(sede, 0) + 1

            # Por dependencia
            dep = bien.get('unidad_nombre', 'Sin dependencia')
            stats['por_dependencia'][dep] = stats['por_dependencia'].get(dep, 0) + 1

        return {
            'bienes': bienes,
            'estadisticas': stats,
            'fecha_generacion': datetime.now(),
            'filtros_aplicados': filtros or {}
        }

    @staticmethod
    def generar_reporte_cal_2025():
        """Reporte específico de CAL 2025"""
        repo = Repo()

        progreso = repo.obtener_progreso_cal_2025()
        progreso_sede = repo.obtener_progreso_por_sede()
        progreso_dep = repo.obtener_progreso_por_dependencia()

        return {
            'progreso_general': progreso,
            'progreso_por_sede': progreso_sede,
            'progreso_por_dependencia': progreso_dep,
            'fecha_generacion': datetime.now(),
            'porcentaje_completado': (progreso['inventariados'] / progreso['total_bienes'] * 100) if progreso['total_bienes'] > 0 else 0
        }

    @staticmethod
    def generar_reporte_cambios_recientes(dias=7):
        """Reporte de cambios realizados en últimos N días"""
        fecha_limite = datetime.now() - timedelta(days=dias)

        cambios = Historial.query.filter(
            Historial.fecha >= fecha_limite
        ).order_by(Historial.fecha.desc()).all()

        cambios_por_usuario = {}
        cambios_por_accion = {}

        for cambio in cambios:
            # Por usuario
            usuario = cambio.usuario or 'Sistema'
            cambios_por_usuario[usuario] = cambios_por_usuario.get(usuario, 0) + 1

            # Por acción
            accion = cambio.accion or 'desconocida'
            cambios_por_accion[accion] = cambios_por_accion.get(accion, 0) + 1

        return {
            'cambios': [c.to_dict() if hasattr(c, 'to_dict') else c.__dict__ for c in cambios],
            'total_cambios': len(cambios),
            'cambios_por_usuario': cambios_por_usuario,
            'cambios_por_accion': cambios_por_accion,
            'periodo': f'Últimos {dias} días',
            'fecha_generacion': datetime.now()
        }

    @staticmethod
    def generar_datos_para_graficos(reporte):
        """Convertir datos de reporte a formato para Chart.js"""
        stats = reporte['estadisticas']

        return {
            'bienes_por_estado': {
                'labels': list(stats.get('por_estado', {}).keys()),
                'data': list(stats.get('por_estado', {}).values()),
                'backgroundColor': ['#28a745', '#ffc107', '#dc3545'],
                'borderColor': ['#1e7e34', '#ff9800', '#c82333'],
                'borderWidth': 1
            },
            'bienes_por_sede': {
                'labels': list(stats.get('por_sede', {}).keys()),
                'data': list(stats.get('por_sede', {}).values()),
                'backgroundColor': '#4472C4',
                'borderColor': '#2F5233',
                'borderWidth': 1
            },
            'bienes_por_dependencia': {
                'labels': list(stats.get('por_dependencia', {}).keys())[:10],  # Top 10
                'data': list(stats.get('por_dependencia', {}).values())[:10],
                'backgroundColor': '#70AD47',
                'borderColor': '#4472C4',
                'borderWidth': 1
            }
        }
```

### Paso 3: Configurar email (Postfix)

**En Ubuntu:**

```bash
# Instalar y configurar Postfix
sudo apt-get install -y postfix

# Durante instalación, elegir: "Internet Site"
# Nombre del servidor: tu-dominio.com (o localhost para desarrollo)

# Verificar que funciona
echo "Test email" | mail -s "Test" tu-email@example.com
```

**Archivo**: `config.py` (AGREGAR)

```python
# Email configuration
MAIL_SERVER = os.getenv('MAIL_SERVER', 'localhost')
MAIL_PORT = int(os.getenv('MAIL_PORT', 25))
MAIL_USE_TLS = os.getenv('MAIL_USE_TLS', False)
MAIL_USERNAME = os.getenv('MAIL_USERNAME', '')
MAIL_PASSWORD = os.getenv('MAIL_PASSWORD', '')
MAIL_DEFAULT_SENDER = os.getenv('MAIL_DEFAULT_SENDER', 'noreply@control-patrimonial.local')
```

### Paso 4: Crear servicio de email

**Archivo**: `app/services/email_service.py` (NUEVO)

```python
"""
Servicio de envío de emails
"""
from flask_mail import Mail, Message
from flask import render_template
from app import app

mail = Mail(app)

class EmailService:
    """Gestiona envío de emails"""

    @staticmethod
    def enviar_reporte_diario(destinatario, reporte):
        """Enviar reporte en email"""
        try:
            msg = Message(
                subject=f'Reporte de Bienes - {reporte["fecha_generacion"].strftime("%d/%m/%Y")}',
                recipients=[destinatario],
                html=render_template('emails/reporte.html', reporte=reporte)
            )
            mail.send(msg)
            return True
        except Exception as e:
            print(f'Error enviando email: {str(e)}')
            return False

    @staticmethod
    def enviar_reporte_cal_2025(destinatario, reporte):
        """Enviar reporte CAL 2025"""
        try:
            msg = Message(
                subject='Progreso CAL 2025 - Reporte',
                recipients=[destinatario],
                html=render_template('emails/reporte_cal.html', reporte=reporte)
            )
            mail.send(msg)
            return True
        except Exception as e:
            print(f'Error enviando email: {str(e)}')
            return False

    @staticmethod
    def enviar_reset_password(usuario_email, reset_url):
        """Enviar email de reset de contraseña"""
        try:
            msg = Message(
                subject='Reset de contraseña - Control Patrimonial',
                recipients=[usuario_email],
                html=render_template('emails/reset_password.html', reset_url=reset_url)
            )
            mail.send(msg)
            return True
        except Exception as e:
            print(f'Error enviando email: {str(e)}')
            return False
```

### Paso 5: Configurar scheduler

**Archivo**: `app/__init__.py` (MODIFICAR)

```python
from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_login import LoginManager
from flask_mail import Mail
from apscheduler.schedulers.background import BackgroundScheduler
import atexit

db = SQLAlchemy()
login_manager = LoginManager()
mail = Mail()
scheduler = BackgroundScheduler()

def create_app(config_name='development'):
    app = Flask(__name__)

    # ... configuración existente ...

    db.init_app(app)
    login_manager.init_app(app)
    mail.init_app(app)

    # Registrar blueprints
    from app.main import main
    from app.auth import auth
    from app.api import api

    app.register_blueprint(main)
    app.register_blueprint(auth)
    app.register_blueprint(api)

    # Iniciar scheduler
    if not scheduler.running:
        # Tareas programadas
        from app.services.scheduled_tasks import generar_reportes_diarios

        scheduler.add_job(
            func=generar_reportes_diarios,
            trigger="cron",
            hour=6,  # 6 AM
            minute=0,
            id='reporte_diario',
            name='Generar reporte diario'
        )

        scheduler.start()

        # Shutdown scheduler cuando se cierre la app
        atexit.register(lambda: scheduler.shutdown())

    return app
```

### Paso 6: Crear tareas programadas

**Archivo**: `app/services/scheduled_tasks.py` (NUEVO)

```python
"""
Tareas programadas (Scheduler)
"""
from app import app
from app.services.report_service import ReportService
from app.services.email_service import EmailService
from app.models_sqlalchemy import Usuario
import logging

logger = logging.getLogger(__name__)

def generar_reportes_diarios():
    """Generar y enviar reportes diarios"""
    with app.app_context():
        try:
            # Obtener todos los usuarios administradores
            admins = Usuario.query.filter(
                Usuario.rol == 'administrador'
            ).all()

            if not admins:
                logger.warning('No hay administradores para enviar reportes')
                return

            # Generar reporte general
            reporte = ReportService.generar_reporte_bienes()

            # Enviar a cada admin
            for admin in admins:
                if admin.email:
                    EmailService.enviar_reporte_diario(admin.email, reporte)
                    logger.info(f'Reporte enviado a {admin.email}')

            logger.info('Reportes diarios generados exitosamente')

        except Exception as e:
            logger.error(f'Error generando reportes: {str(e)}')
```

### Paso 7: Crear rutas de reportes

**Archivo**: `app/main/routes.py` (AGREGAR)

```python
from app.services.report_service import ReportService

@main.route('/reportes')
@login_required
def ver_reportes():
    """Vista de reportes disponibles"""
    return render_template('reportes/index.html')

@main.route('/reportes/bienes')
@login_required
@requiere_permiso('leer')
def reporte_bienes():
    """Reporte de bienes con gráficos"""
    filtros = request.args.to_dict()
    reporte = ReportService.generar_reporte_bienes(filtros or None)

    # Preparar datos para gráficos
    datos_graficos = ReportService.generar_datos_para_graficos(reporte)

    return render_template('reportes/bienes.html',
                         reporte=reporte,
                         datos_graficos=datos_graficos)

@main.route('/reportes/cal-2025')
@login_required
@requiere_permiso('leer')
def reporte_cal_2025():
    """Reporte CAL 2025"""
    reporte = ReportService.generar_reporte_cal_2025()

    datos_graficos = {
        'progreso': {
            'labels': ['Inventariados', 'Pendientes'],
            'data': [
                reporte['progreso_general']['inventariados'],
                reporte['progreso_general']['pendientes']
            ],
            'backgroundColor': ['#28a745', '#dc3545']
        }
    }

    return render_template('reportes/cal_2025.html',
                         reporte=reporte,
                         datos_graficos=datos_graficos)

@main.route('/reportes/cambios-recientes')
@login_required
@requiere_permiso('leer')
def reporte_cambios_recientes():
    """Reporte de cambios recientes"""
    dias = request.args.get('dias', 7, type=int)
    reporte = ReportService.generar_reporte_cambios_recientes(dias)

    return render_template('reportes/cambios.html', reporte=reporte)

@main.route('/reportes/<tipo>/descargar-pdf')
@login_required
@requiere_permiso('leer')
def descargar_reporte_pdf(tipo):
    """Descargar reporte en PDF"""
    if tipo == 'bienes':
        reporte = ReportService.generar_reporte_bienes()
    elif tipo == 'cal-2025':
        reporte = ReportService.generar_reporte_cal_2025()
    else:
        flash('Tipo de reporte no válido', 'danger')
        return redirect(url_for('main.ver_reportes'))

    # Generar PDF (usar ExportService.exportar_pdf)
    from app.services.export_service import ExportService
    pdf = ExportService.exportar_pdf()

    return send_file(
        pdf,
        mimetype='application/pdf',
        as_attachment=True,
        download_name=f'reporte_{tipo}.pdf'
    )
```

### Paso 8: Crear templates de reportes

**Archivo**: `app/templates/reportes/bienes.html` (NUEVO)

```html
{% extends 'base.html' %}

{% block content %}
<div class="container mt-5">
    <h1 class="mb-4">Reporte de Bienes</h1>

    <!-- Filtros -->
    <div class="card mb-4">
        <div class="card-body">
            <form method="GET" class="row g-3">
                <div class="col-md-6">
                    <label for="q" class="form-label">Búsqueda</label>
                    <input type="text" class="form-control" id="q" name="q"
                           value="{{ request.args.get('q', '') }}" placeholder="Código o denominación">
                </div>
                <div class="col-md-6">
                    <label for="estado" class="form-label">Estado</label>
                    <select class="form-select" id="estado" name="estado">
                        <option value="">Todos</option>
                        <option value="Bueno" {% if request.args.get('estado') == 'Bueno' %}selected{% endif %}>Bueno</option>
                        <option value="Regular" {% if request.args.get('estado') == 'Regular' %}selected{% endif %}>Regular</option>
                        <option value="Malo" {% if request.args.get('estado') == 'Malo' %}selected{% endif %}>Malo</option>
                    </select>
                </div>
                <div class="col-12">
                    <button type="submit" class="btn btn-primary">Filtrar</button>
                    <a href="{{ url_for('main.reporte_bienes') }}" class="btn btn-secondary">Limpiar</a>
                    <a href="{{ url_for('main.descargar_reporte_pdf', tipo='bienes') }}" class="btn btn-success">
                        Descargar PDF
                    </a>
                </div>
            </form>
        </div>
    </div>

    <!-- Estadísticas -->
    <div class="row mb-4">
        <div class="col-md-3">
            <div class="card text-center">
                <div class="card-body">
                    <h5 class="card-title">Total de Bienes</h5>
                    <h2 class="text-primary">{{ reporte.estadisticas.total }}</h2>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card text-center">
                <div class="card-body">
                    <h5 class="card-title">Estado Bueno</h5>
                    <h2 class="text-success">{{ reporte.estadisticas.por_estado.get('Bueno', 0) }}</h2>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card text-center">
                <div class="card-body">
                    <h5 class="card-title">Estado Regular</h5>
                    <h2 class="text-warning">{{ reporte.estadisticas.por_estado.get('Regular', 0) }}</h2>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card text-center">
                <div class="card-body">
                    <h5 class="card-title">Estado Malo</h5>
                    <h2 class="text-danger">{{ reporte.estadisticas.por_estado.get('Malo', 0) }}</h2>
                </div>
            </div>
        </div>
    </div>

    <!-- Gráficos -->
    <div class="row">
        <div class="col-md-6 mb-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Bienes por Estado</h5>
                    <canvas id="estadoChart"></canvas>
                </div>
            </div>
        </div>
        <div class="col-md-6 mb-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Top 10 Dependencias</h5>
                    <canvas id="dependenciaChart"></canvas>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-12 mb-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Bienes por Sede</h5>
                    <canvas id="sedeChart"></canvas>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Chart.js -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<script>
// Gráfico de estados (Pie)
const ctxEstado = document.getElementById('estadoChart').getContext('2d');
new Chart(ctxEstado, {
    type: 'doughnut',
    data: {
        labels: {{ datos_graficos.bienes_por_estado.labels|tojson }},
        datasets: [{
            data: {{ datos_graficos.bienes_por_estado.data|tojson }},
            backgroundColor: {{ datos_graficos.bienes_por_estado.backgroundColor|tojson }},
            borderColor: {{ datos_graficos.bienes_por_estado.borderColor|tojson }},
            borderWidth: 1
        }]
    },
    options: {
        responsive: true,
        plugins: {
            legend: { position: 'bottom' },
            title: { display: true, text: 'Distribución de estados' }
        }
    }
});

// Gráfico de dependencias (Bar)
const ctxDependencia = document.getElementById('dependenciaChart').getContext('2d');
new Chart(ctxDependencia, {
    type: 'bar',
    data: {
        labels: {{ datos_graficos.bienes_por_dependencia.labels|tojson }},
        datasets: [{
            label: 'Cantidad de bienes',
            data: {{ datos_graficos.bienes_por_dependencia.data|tojson }},
            backgroundColor: '#70AD47',
            borderColor: '#4472C4',
            borderWidth: 1
        }]
    },
    options: {
        responsive: true,
        indexAxis: 'y',
        plugins: {
            legend: { display: false }
        }
    }
});

// Gráfico de sedes (Bar)
const ctxSede = document.getElementById('sedeChart').getContext('2d');
new Chart(ctxSede, {
    type: 'bar',
    data: {
        labels: {{ datos_graficos.bienes_por_sede.labels|tojson }},
        datasets: [{
            label: 'Cantidad de bienes',
            data: {{ datos_graficos.bienes_por_sede.data|tojson }},
            backgroundColor: '#4472C4',
            borderColor: '#2F5233',
            borderWidth: 1
        }]
    },
    options: {
        responsive: true,
        plugins: {
            legend: { display: false }
        }
    }
});
</script>
{% endblock %}
```

---

## 👥 FASE 4: GESTIÓN DE USUARIOS MEJORADA (4-5h) - DÍAS 8-9

### Paso 1: Expandir modelo de Usuario

**Archivo**: `app/models_sqlalchemy.py` (MODIFICAR)

```python
from werkzeug.security import generate_password_hash, check_password_hash

class Usuario(UserMixin, db.Model):
    __tablename__ = 'usuarios'

    id = db.Column(db.Integer, primary_key=True)
    usuario = db.Column(db.String(50), unique=True, nullable=False)
    password = db.Column(db.String(255), nullable=False)
    email = db.Column(db.String(120), unique=True)

    # NUEVOS campos
    rol = db.Column(db.String(20), default='administrador')
    # Valores: 'administrador', 'supervisor', 'operador', 'consulta'

    activo = db.Column(db.Boolean, default=True)
    fecha_creacion = db.Column(db.DateTime, default=datetime.now)
    ultimo_acceso = db.Column(db.DateTime)

    def set_password(self, password):
        """Encriptar contraseña"""
        self.password = generate_password_hash(password, method='pbkdf2:sha256')

    def check_password(self, password):
        """Verificar contraseña"""
        return check_password_hash(self.password, password)

    def to_dict(self):
        return {
            'id': self.id,
            'usuario': self.usuario,
            'email': self.email,
            'rol': self.rol,
            'activo': self.activo,
            'is_admin': True
        }

# Definir permisos por rol
PERMISOS_POR_ROL = {
    'administrador': ['crear', 'leer', 'actualizar', 'eliminar', 'reportes', 'gestionar_usuarios'],
    'supervisor': ['crear', 'leer', 'actualizar', 'reportes'],
    'operador': ['crear', 'leer', 'actualizar'],
    'consulta': ['leer']
}
```

### Paso 2: Crear decorador de permisos

**Archivo**: `app/utils.py` (AGREGAR)

```python
from functools import wraps
from flask import redirect, url_for, flash
from flask_login import current_user
from app.models_sqlalchemy import PERMISOS_POR_ROL

def requiere_permiso(permiso):
    """Decorador que verifica si el usuario tiene el permiso"""
    def decorator(f):
        @wraps(f)
        def decorated_function(*args, **kwargs):
            if not current_user.is_authenticated:
                flash('Debes iniciar sesión', 'danger')
                return redirect(url_for('auth.login'))

            permisos_usuario = PERMISOS_POR_ROL.get(current_user.rol, [])

            if permiso not in permisos_usuario:
                flash('No tienes permiso para realizar esta acción', 'danger')
                return redirect(url_for('main.index'))

            return f(*args, **kwargs)

        return decorated_function
    return decorator

def requiere_rol(rol):
    """Decorador que verifica si el usuario tiene el rol específico"""
    def decorator(f):
        @wraps(f)
        def decorated_function(*args, **kwargs):
            if not current_user.is_authenticated:
                flash('Debes iniciar sesión', 'danger')
                return redirect(url_for('auth.login'))

            if current_user.rol != rol:
                flash(f'Esta acción requiere rol de {rol}', 'danger')
                return redirect(url_for('main.index'))

            return f(*args, **kwargs)

        return decorated_function
    return decorator
```

### Paso 3: Crear rutas de gestión de usuarios

**Archivo**: `app/main/routes.py` (AGREGAR)

```python
from app.models_sqlalchemy import Usuario, PERMISOS_POR_ROL
from app.utils import requiere_permiso, requiere_rol

@main.route('/admin/usuarios')
@login_required
@requiere_permiso('gestionar_usuarios')
def listar_usuarios():
    """Listar todos los usuarios"""
    page = request.args.get('page', 1, type=int)
    usuarios = Usuario.query.paginate(page=page, per_page=10)

    return render_template('admin/usuarios/lista.html', usuarios=usuarios)

@main.route('/admin/usuarios/crear', methods=['GET', 'POST'])
@login_required
@requiere_permiso('gestionar_usuarios')
def crear_usuario():
    """Crear nuevo usuario"""
    if request.method == 'POST':
        usuario = request.form.get('usuario')
        email = request.form.get('email')
        password = request.form.get('password')
        rol = request.form.get('rol', 'operador')

        # Validar
        if not usuario or not password:
            flash('Usuario y contraseña son requeridos', 'danger')
            return redirect(request.url)

        if len(password) < 8:
            flash('Contraseña debe tener al menos 8 caracteres', 'danger')
            return redirect(request.url)

        if Usuario.query.filter_by(usuario=usuario).first():
            flash('Usuario ya existe', 'danger')
            return redirect(request.url)

        # Crear usuario
        nuevo_usuario = Usuario(
            usuario=usuario,
            email=email,
            rol=rol,
            activo=True
        )
        nuevo_usuario.set_password(password)

        db.session.add(nuevo_usuario)
        db.session.commit()

        flash(f'Usuario {usuario} creado exitosamente', 'success')
        return redirect(url_for('main.listar_usuarios'))

    return render_template('admin/usuarios/crear.html',
                         roles=PERMISOS_POR_ROL.keys())

@main.route('/admin/usuarios/<int:user_id>/editar', methods=['GET', 'POST'])
@login_required
@requiere_permiso('gestionar_usuarios')
def editar_usuario(user_id):
    """Editar usuario"""
    usuario = Usuario.query.get_or_404(user_id)

    if request.method == 'POST':
        usuario.email = request.form.get('email')
        usuario.rol = request.form.get('rol', usuario.rol)

        # Cambiar contraseña si se proporciona
        password = request.form.get('password')
        if password:
            if len(password) < 8:
                flash('Contraseña debe tener al menos 8 caracteres', 'danger')
                return redirect(request.url)
            usuario.set_password(password)

        db.session.commit()
        flash('Usuario actualizado', 'success')
        return redirect(url_for('main.listar_usuarios'))

    return render_template('admin/usuarios/editar.html',
                         usuario=usuario,
                         roles=PERMISOS_POR_ROL.keys())

@main.route('/admin/usuarios/<int:user_id>/toggle', methods=['POST'])
@login_required
@requiere_permiso('gestionar_usuarios')
def toggle_usuario_activo(user_id):
    """Habilitar/Deshabilitar usuario"""
    usuario = Usuario.query.get_or_404(user_id)

    if usuario.id == current_user.id:
        flash('No puedes deshabilitar tu propio usuario', 'danger')
        return redirect(url_for('main.listar_usuarios'))

    usuario.activo = not usuario.activo
    db.session.commit()

    estado = "habilitado" if usuario.activo else "deshabilitado"
    flash(f'Usuario {estado}', 'success')
    return redirect(url_for('main.listar_usuarios'))

@main.route('/admin/usuarios/<int:user_id>/eliminar', methods=['POST'])
@login_required
@requiere_permiso('gestionar_usuarios')
def eliminar_usuario(user_id):
    """Eliminar usuario"""
    usuario = Usuario.query.get_or_404(user_id)

    if usuario.id == current_user.id:
        flash('No puedes eliminar tu propio usuario', 'danger')
        return redirect(url_for('main.listar_usuarios'))

    db.session.delete(usuario)
    db.session.commit()

    flash('Usuario eliminado', 'success')
    return redirect(url_for('main.listar_usuarios'))
```

### Paso 4: Reset de contraseña

**Archivo**: `app/auth/routes.py` (AGREGAR)

```python
from itsdangerous import URLSafeTimedSerializer, BadSignature
from app import app
from app.services.email_service import EmailService

def generar_reset_token(usuario_id):
    """Generar token de reset válido por 24 horas"""
    serializer = URLSafeTimedSerializer(app.config['SECRET_KEY'])
    return serializer.dumps({'usuario_id': usuario_id}, salt='reset-password')

def verificar_reset_token(token, expiracion=86400):  # 24 horas
    """Verificar token de reset"""
    serializer = URLSafeTimedSerializer(app.config['SECRET_KEY'])
    try:
        data = serializer.loads(token, salt='reset-password', max_age=expiracion)
        return data['usuario_id']
    except BadSignature:
        return None

@auth.route('/reset-password-request', methods=['GET', 'POST'])
def reset_password_request():
    """Solicitar reset de contraseña"""
    if current_user.is_authenticated:
        return redirect(url_for('main.index'))

    if request.method == 'POST':
        usuario_nombre = request.form.get('usuario')
        usuario = Usuario.query.filter_by(usuario=usuario_nombre).first()

        if usuario and usuario.email:
            token = generar_reset_token(usuario.id)
            reset_url = url_for('auth.reset_password', token=token, _external=True)

            # Enviar email
            EmailService.enviar_reset_password(usuario.email, reset_url)
            flash('Email de reset enviado (válido por 24 horas)', 'info')
        else:
            flash('Usuario o email no encontrado', 'warning')

        return redirect(url_for('auth.login'))

    return render_template('auth/reset_request.html')

@auth.route('/reset-password/<token>', methods=['GET', 'POST'])
def reset_password(token):
    """Resetear contraseña con token"""
    usuario_id = verificar_reset_token(token)

    if not usuario_id:
        flash('Token inválido o expirado', 'danger')
        return redirect(url_for('auth.login'))

    usuario = Usuario.query.get_or_404(usuario_id)

    if request.method == 'POST':
        nueva_password = request.form.get('password')
        confirmar_password = request.form.get('confirmar_password')

        if nueva_password != confirmar_password:
            flash('Las contraseñas no coinciden', 'danger')
            return redirect(url_for('auth.reset_password', token=token))

        if len(nueva_password) < 8:
            flash('Contraseña debe tener al menos 8 caracteres', 'danger')
            return redirect(url_for('auth.reset_password', token=token))

        usuario.set_password(nueva_password)
        db.session.commit()

        flash('Contraseña actualizada correctamente', 'success')
        return redirect(url_for('auth.login'))

    return render_template('auth/reset_password.html', token=token)
```

### Paso 5: Templates de usuarios

**Archivo**: `app/templates/admin/usuarios/lista.html` (NUEVO)

```html
{% extends 'base.html' %}

{% block content %}
<div class="container mt-5">
    <div class="row mb-4">
        <div class="col">
            <h1>Gestión de Usuarios</h1>
        </div>
        <div class="col-auto">
            <a href="{{ url_for('main.crear_usuario') }}" class="btn btn-primary">
                + Crear usuario
            </a>
        </div>
    </div>

    <table class="table table-striped">
        <thead>
            <tr>
                <th>Usuario</th>
                <th>Email</th>
                <th>Rol</th>
                <th>Estado</th>
                <th>Creado</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
            {% for usuario in usuarios.items %}
            <tr>
                <td>{{ usuario.usuario }}</td>
                <td>{{ usuario.email or '-' }}</td>
                <td>
                    <span class="badge bg-info">{{ usuario.rol }}</span>
                </td>
                <td>
                    {% if usuario.activo %}
                        <span class="badge bg-success">Activo</span>
                    {% else %}
                        <span class="badge bg-danger">Inactivo</span>
                    {% endif %}
                </td>
                <td>{{ usuario.fecha_creacion.strftime('%d/%m/%Y') }}</td>
                <td>
                    <a href="{{ url_for('main.editar_usuario', user_id=usuario.id) }}"
                       class="btn btn-sm btn-warning">Editar</a>

                    <form method="POST"
                          action="{{ url_for('main.toggle_usuario_activo', user_id=usuario.id) }}"
                          style="display:inline;">
                        {% if usuario.activo %}
                            <button type="submit" class="btn btn-sm btn-danger"
                                    onclick="return confirm('¿Deshabilitar usuario?')">
                                Deshabilitar
                            </button>
                        {% else %}
                            <button type="submit" class="btn btn-sm btn-success">
                                Habilitar
                            </button>
                        {% endif %}
                    </form>

                    {% if usuario.id != current_user.id %}
                    <form method="POST"
                          action="{{ url_for('main.eliminar_usuario', user_id=usuario.id) }}"
                          style="display:inline;">
                        <button type="submit" class="btn btn-sm btn-danger"
                                onclick="return confirm('¿Eliminar usuario?')">
                            Eliminar
                        </button>
                    </form>
                    {% endif %}
                </td>
            </tr>
            {% endfor %}
        </tbody>
    </table>

    <!-- Paginación -->
    <nav>
        {% if usuarios.has_prev %}
            <a href="{{ url_for('main.listar_usuarios', page=usuarios.prev_num) }}"
               class="btn btn-sm btn-outline-secondary">Anterior</a>
        {% endif %}

        {% for page_num in usuarios.iter_pages() %}
            {% if page_num %}
                {% if page_num == usuarios.page %}
                    <span class="btn btn-sm btn-primary disabled">{{ page_num }}</span>
                {% else %}
                    <a href="{{ url_for('main.listar_usuarios', page=page_num) }}"
                       class="btn btn-sm btn-outline-secondary">{{ page_num }}</a>
                {% endif %}
            {% endif %}
        {% endfor %}

        {% if usuarios.has_next %}
            <a href="{{ url_for('main.listar_usuarios', page=usuarios.next_num) }}"
               class="btn btn-sm btn-outline-secondary">Siguiente</a>
        {% endif %}
    </nav>
</div>
{% endblock %}
```

---

**CONTINUARÁ en siguiente mensaje con:**
- Fase 5: Scripts de deployment Ubuntu
- Testing checklist exhaustivo
- Guía final de deployment a producción

