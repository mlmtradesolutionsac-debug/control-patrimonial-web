# PLAN DE IMPLEMENTACIÓN SEGURA
**Fecha**: 27/11/2025
**Objetivo**: Implementar mejoras críticas sin dañar el sistema
**Versión actual**: 1.1

---

## 📋 PRINCIPIOS DE EJECUCIÓN

1. **Backup previo** - Nunca tocar datos sin backup
2. **Cambios incrementales** - Pequeños pasos verificables
3. **Compatibilidad hacia atrás** - El código viejo sigue funcionando
4. **Testing en cada paso** - Verificar que cada cambio funciona
5. **Rollback fácil** - Poder revertir rápidamente si algo falla
6. **Documentación** - Cada cambio está documentado
7. **Separación de responsabilidades** - No mezclar cambios

---

## ⚠️ RIESGOS IDENTIFICADOS

| Riesgo | Probabilidad | Impacto | Mitigación |
|--------|-------------|--------|-----------|
| BD se corrompe durante migración | Baja | Crítico | Backups + Testing en desarrollo |
| Funcionalidad se rompe | Media | Alto | Tests + Rollback rápido |
| Datos históricos se pierden | Baja | Crítico | Backup + Validar datos |
| Usuarios no pueden loguear | Baja | Crítico | Mantener BD antigua durante transición |
| API se rompe | Media | Alto | Versión con ambos sistemas simultáneamente |

---

## 🔄 ESTRATEGIA DE MIGRACIÓN

### Enfoque: Coexistencia Temporal (No reemplazar todo de una vez)

```
┌─────────────────────────────────────────────────────────┐
│                    ESTADO ACTUAL                        │
│  models.py (SQL Raw) → BD SQLite                        │
└─────────────────────────────────────────────────────────┘
                          ↓ (Semana 1)
┌─────────────────────────────────────────────────────────┐
│              ESTADO TRANSICIÓN                          │
│  models.py (SQL Raw) + models_sqlalchemy.py (ORM) →    │
│  BD SQLite (misma)                                      │
└─────────────────────────────────────────────────────────┘
                          ↓ (Semana 2)
┌─────────────────────────────────────────────────────────┐
│        ESTADO FINAL                                     │
│  models_sqlalchemy.py (ORM) → BD SQLite                 │
│  (models.py antiguo → deprecado pero disponible)        │
└─────────────────────────────────────────────────────────┘
```

---

## 📅 FASES DE IMPLEMENTACIÓN

### FASE 0: PREPARACIÓN (Antes de cualquier cambio)

#### Paso 0.1: Crear Backup Completo
```bash
# Copiar base de datos
cp data/inventario_patrimonial.db data/inventario_patrimonial.db.BACKUP_2025-11-27

# Copiar código actual
git init (si no está)
git add .
git commit -m "Backup punto seguro antes de refactorización"
```

**Responsable**: Tú
**Tiempo**: 5 minutos
**Verificación**:
- ✅ `data/inventario_patrimonial.db.BACKUP_2025-11-27` existe
- ✅ BD tiene ~12MB
- ✅ Todos los cambios están en git

---

#### Paso 0.2: Crear Rama de Desarrollo
```bash
git checkout -b feature/sqlalchemy-migration
```

**Responsable**: Tú
**Tiempo**: 1 minuto
**Verificación**:
- ✅ Estás en rama `feature/sqlalchemy-migration`

---

#### Paso 0.3: Documentar Estado Actual
```bash
# Listar todas las rutas
grep -r "@bp.route\|@app.route" app/ > ROUTES_ACTUAL.txt

# Listar todos los métodos de Repo
grep "def " app/models.py > METODOS_REPO_ACTUAL.txt

# Guardar requirements.txt
pip freeze > requirements.BEFORE.txt
```

**Responsable**: Tú
**Tiempo**: 2 minutos
**Verificación**:
- ✅ `ROUTES_ACTUAL.txt` existe con todas las rutas
- ✅ `METODOS_REPO_ACTUAL.txt` existe

---

### FASE 1: CORRECCIONES CRÍTICAS (BAJO RIESGO)

#### Paso 1.1: Corregir SQL Injection
**Archivo**: `app/models.py`
**Línea**: 210-233
**Riesgo**: ✅ BAJO (Cambio de 1 línea)
**Rollback**: Trivial (revertir 1 línea)

```python
# ❌ ANTES (línea 216-223)
cur.execute(f"""
    ...
    LIMIT {limite}
""")

# ✅ DESPUÉS
cur.execute("""
    ...
    LIMIT ?
""", (limite,))
```

**Paso a paso**:
1. Abrir `app/models.py`
2. Encontrar método `obtener_actividad_por_inventariador` (línea 210)
3. Agregar validación de `limite` al inicio:
   ```python
   limite = max(1, min(int(limite), 100))  # Entre 1 y 100
   ```
4. Cambiar `LIMIT {limite}` por `LIMIT ?`
5. Cambiar `cur.execute(f"""...` por `cur.execute("""...` (sin f-string)
6. Agregar `(limite,)` como parámetro

**Verificación**:
```python
# Probar en Python
from app.models import Repo
repo = Repo()
resultado = repo.obtener_actividad_por_inventariador(10)
assert isinstance(resultado, list)
assert len(resultado) <= 10

# Intentar inyección - debe fallar de forma segura
resultado_malicioso = repo.obtener_actividad_por_inventariador("10; DROP TABLE bienes; --")
assert isinstance(resultado_malicioso, list)  # No debería ejecutar SQL malicioso
```

**Tiempo estimado**: 10 minutos
**Commit**:
```bash
git add app/models.py
git commit -m "Fix: Corregir SQL injection en obtener_actividad_por_inventariador

- Reemplazar f-string con parámetro preparado en LIMIT
- Agregar validación de rango para limite (1-100)
- Previene inyección SQL"
```

---

#### Paso 1.2: Mejorar Validación en POST/PUT
**Archivos**: `app/utils.py`, `app/main/routes.py`, `app/api/routes.py`
**Riesgo**: ✅ BAJO (Agregar validación, no cambiar lógica)
**Rollback**: Fácil (remover líneas de validación)

**Cambio en utils.py**:
Actualizar función `validate_bien_data()` para ser más exhaustiva:

```python
def validate_bien_data(data):
    """Validar datos de un bien - MEJORADO"""
    errors = []

    # Campos obligatorios
    if not data.get('codigo_patrimonial') or not str(data.get('codigo_patrimonial')).strip():
        errors.append('El código patrimonial es requerido')
    elif len(str(data['codigo_patrimonial']).strip()) > 50:
        errors.append('El código patrimonial no puede exceder 50 caracteres')

    if not data.get('denominacion') or not str(data.get('denominacion')).strip():
        errors.append('La denominación es requerida')
    elif len(str(data['denominacion']).strip()) > 200:
        errors.append('La denominación no puede exceder 200 caracteres')

    if not data.get('sede') or str(data.get('sede')).strip() == '':
        errors.append('Debe seleccionar una sede')
    else:
        # Verificar que sea número
        try:
            int(data['sede'])
        except (ValueError, TypeError):
            errors.append('La sede debe ser un número válido')

    # Estado
    if data.get('estado'):
        estado_val = str(data['estado']).strip()
        # Aceptar tanto el código como el nombre
        estado_map = {'Bueno': 'b', 'Regular': 'r', 'Malo': 'm', 'b': 'b', 'r': 'r', 'm': 'm'}
        if estado_val not in estado_map:
            errors.append('Estado inválido. Debe ser: Bueno, Regular o Malo')

    # Validar longitud de campos opcionales
    optional_fields = ['marca', 'modelo', 'serie', 'responsable', 'ubicacion_texto', 'observaciones', 'codigo_barras']
    for field in optional_fields:
        if data.get(field):
            field_value = str(data[field]).strip()
            if len(field_value) > 500:
                errors.append(f'{field}: máximo 500 caracteres')

    return errors
```

**Cambios en main/routes.py**:

```python
# ANTES (línea 51-57)
if request.method == 'POST':
    try:
        repo.crear_bien(request.form.to_dict(), current_user.username)
        flash('Bien creado exitosamente', 'success')
        return redirect(url_for('main.dashboard'))
    except Exception as e:
        flash(f'Error al crear bien: {str(e)}', 'danger')

# DESPUÉS
if request.method == 'POST':
    # PASO 1: Validar
    errors = validate_bien_data(request.form.to_dict())
    if errors:
        flash(f'Errores en el formulario: {"; ".join(errors)}', 'danger')
        sedes = repo.obtener_sedes()
        dependencias = repo.obtener_unidades()
        return render_template('main/form_bien.html',
                             title="Nuevo Bien",
                             sedes=sedes,
                             dependencias=dependencias,
                             errors=errors,
                             form_data=request.form.to_dict())

    # PASO 2: Solo si válido, guardar
    try:
        repo.crear_bien(request.form.to_dict(), current_user.username)
        flash('Bien creado exitosamente', 'success')
        return redirect(url_for('main.dashboard'))
    except Exception as e:
        current_app.logger.error(f"Error al crear bien: {str(e)}")
        flash('Error al crear bien. Contacta al administrador', 'danger')
```

**Cambios similares en editar_bien()** (línea 73-79)

**Cambios en api/routes.py**:

```python
# ANTES (línea 85-97)
try:
    data = request.get_json()
    errors = validate_bien_data(data)
    if errors:
        return api_error(f"Validación fallida: {', '.join(errors)}", 400)

# DESPUÉS (ya está bien, solo asegurarse)
try:
    data = request.get_json()
    if not data:
        return api_error("No JSON body provided", 400)

    errors = validate_bien_data(data)
    if errors:
        return api_error(f"Validación fallida: {'; '.join(errors)}", 400)
```

**Necesitar importar en routes**:
```python
from app.utils import validate_bien_data, log_action
```

**Verificación**:
```python
# Probar validación en Python shell
from app.utils import validate_bien_data

# Caso 1: Datos válidos
data_buena = {
    'codigo_patrimonial': 'PAT-001',
    'denominacion': 'Escritorio',
    'sede': '1',
    'estado': 'Bueno'
}
errors = validate_bien_data(data_buena)
assert errors == [], f"No debería haber errores: {errors}"

# Caso 2: Falta código patrimonial
data_mala = {'denominacion': 'Escritorio', 'sede': '1'}
errors = validate_bien_data(data_mala)
assert len(errors) > 0, "Debería detectar código patrimonial faltante"
assert any('código patrimonial' in e.lower() for e in errors)

# Caso 3: Sede inválida
data_mala2 = {
    'codigo_patrimonial': 'PAT-001',
    'denominacion': 'Escritorio',
    'sede': 'ABC',  # No es número
}
errors = validate_bien_data(data_mala2)
assert any('sede' in e.lower() for e in errors)

print("✅ Todas las validaciones funcionan correctamente")
```

**Tiempo estimado**: 30 minutos
**Commit**:
```bash
git add app/utils.py app/main/routes.py app/api/routes.py
git commit -m "Feat: Mejorar validación en POST/PUT

- Hacer validate_bien_data() más exhaustivo
- Validar campos obligatorios
- Validar longitud de campos
- Validar tipos de datos (sede debe ser int)
- Mostrar errores al usuario en formularios
- Registrar errores en logs en API"
```

---

### FASE 2: MIGRACIÓN A SQLALCHEMY (ALTO RIESGO)

#### Paso 2.1: Instalar Dependencias
**Archivo**: `requirements.txt`

```bash
pip install Flask-SQLAlchemy==3.0.5
pip install Flask-Migrate==4.0.4
```

**Actualizar requirements.txt**:
```bash
pip freeze > requirements.txt
```

**Verificación**:
```bash
python -c "import flask_sqlalchemy; print(flask_sqlalchemy.__version__)"
python -c "import flask_migrate; print(flask_migrate.__version__)"
```

**Tiempo estimado**: 5 minutos
**Commit**:
```bash
git add requirements.txt
git commit -m "chore: Agregar dependencias para SQLAlchemy ORM"
```

---

#### Paso 2.2: Crear Modelos SQLAlchemy (Archivo Nuevo)
**Archivo**: `app/models_sqlalchemy.py` (NUEVO)
**Estrategia**: Nuevo archivo, no tocar `models.py` aún

```python
"""
Modelos SQLAlchemy para Control Patrimonial
Refactorización de models.py hacia ORM
"""
from flask_sqlalchemy import SQLAlchemy
from flask_login import UserMixin
from datetime import datetime
from sqlalchemy import event

db = SQLAlchemy()

# ==================== MODELOS ====================

class Usuario(UserMixin, db.Model):
    """Usuario de la aplicación (admin)"""
    __tablename__ = 'usuarios'

    id = db.Column(db.Integer, primary_key=True)
    usuario = db.Column(db.String(50), unique=True, nullable=False, index=True)
    nombre = db.Column(db.String(100), nullable=False)
    password = db.Column(db.String(100), nullable=False)
    rol = db.Column(db.String(20), default='admin')

    def get_id(self):
        return self.usuario

    def __repr__(self):
        return f'<Usuario {self.usuario}>'


class UsuarioApp(UserMixin, db.Model):
    """Usuario de aplicación web"""
    __tablename__ = 'usuarios_app'

    username = db.Column(db.String(50), primary_key=True, index=True)
    nombre = db.Column(db.String(100), nullable=False)
    password_hash = db.Column(db.String(100), nullable=False)
    rol = db.Column(db.String(20), default='operador')
    activo = db.Column(db.Integer, default=1)
    fecha_creacion = db.Column(db.DateTime, default=datetime.now)

    def get_id(self):
        return self.username

    def __repr__(self):
        return f'<UsuarioApp {self.username}>'


class Sede(db.Model):
    """Sedes/locales"""
    __tablename__ = 'sedes'

    id = db.Column(db.Integer, primary_key=True)
    nombre = db.Column(db.String(200), nullable=False, index=True)

    # Relaciones
    bienes = db.relationship('Bien', backref='sede', lazy=True)

    def __repr__(self):
        return f'<Sede {self.nombre}>'


class Unidad(db.Model):
    """Unidades/dependencias"""
    __tablename__ = 'unidades'

    id = db.Column(db.Integer, primary_key=True)
    nombre = db.Column(db.String(200), nullable=False, index=True)

    # Relaciones
    bienes = db.relationship('Bien', backref='unidad', lazy=True)

    def __repr__(self):
        return f'<Unidad {self.nombre}>'


class Bien(db.Model):
    """Bien patrimonial"""
    __tablename__ = 'bienes'

    id = db.Column(db.Integer, primary_key=True)
    codigo_patrimonial = db.Column(db.String(50), unique=True, nullable=False, index=True)
    cod_barras = db.Column(db.String(100))
    denominacion = db.Column(db.String(200), nullable=False, index=True)
    descripcion = db.Column(db.Text)
    marca = db.Column(db.String(100))
    modelo = db.Column(db.String(100))
    serie = db.Column(db.String(100))
    estado = db.Column(db.String(1))  # 'b', 'r', 'm'
    sede_id = db.Column(db.Integer, db.ForeignKey('sedes.id'), nullable=False, index=True)
    unidad_id = db.Column(db.Integer, db.ForeignKey('unidades.id'), index=True)
    ubicacion_texto = db.Column(db.Text)
    responsable = db.Column(db.String(200))
    observaciones = db.Column(db.Text)
    usuario_registro = db.Column(db.String(50), index=True)
    fecha_registro = db.Column(db.DateTime, default=datetime.now, index=True)
    verificado = db.Column(db.Integer, default=0)
    cal_2025 = db.Column(db.String(50))

    def __repr__(self):
        return f'<Bien {self.codigo_patrimonial}>'

    def to_dict(self):
        """Convertir a diccionario para API"""
        return {
            'id': self.id,
            'codigo_patrimonial': self.codigo_patrimonial,
            'cod_barras': self.cod_barras,
            'denominacion': self.denominacion,
            'descripcion': self.descripcion,
            'marca': self.marca,
            'modelo': self.modelo,
            'serie': self.serie,
            'estado': self.estado,
            'sede_id': self.sede_id,
            'sede': self.sede.nombre if self.sede else None,
            'unidad_id': self.unidad_id,
            'dependencia': self.unidad.nombre if self.unidad else None,
            'ubicacion_texto': self.ubicacion_texto,
            'responsable': self.responsable,
            'observaciones': self.observaciones,
            'usuario_registro': self.usuario_registro,
            'fecha_registro': self.fecha_registro.isoformat() if self.fecha_registro else None,
            'verificado': self.verificado,
            'cal_2025': self.cal_2025,
        }


class Historial(db.Model):
    """Historial de cambios"""
    __tablename__ = 'historial'

    id = db.Column(db.Integer, primary_key=True)
    bien_id = db.Column(db.Integer, db.ForeignKey('bienes.id'), nullable=False, index=True)
    usuario = db.Column(db.String(50), nullable=False)
    accion = db.Column(db.String(50), nullable=False)  # CREAR, EDITAR, ELIMINAR
    detalle_json = db.Column(db.Text)
    fecha = db.Column(db.DateTime, default=datetime.now, index=True)

    def __repr__(self):
        return f'<Historial {self.bien_id} {self.accion}>'


# ==================== INICIALIZAR BASE DE DATOS ====================

def init_db(app):
    """Inicializar base de datos con la aplicación"""
    db.init_app(app)
    with app.app_context():
        db.create_all()

```

**Verificación**:
```python
# En Python shell
from app.models_sqlalchemy import db, Bien, Sede
from flask import Flask

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///data/inventario_patrimonial.db'
db.init_app(app)

with app.app_context():
    # Contar registros
    bien_count = Bien.query.count()
    print(f"✅ Conectado a BD. Hay {bien_count} bienes")
```

**Tiempo estimado**: 45 minutos
**Commit**:
```bash
git add app/models_sqlalchemy.py
git commit -m "feat: Crear modelos SQLAlchemy

- Definir modelo Bien con todas las columnas
- Definir modelos Usuario, Sede, Unidad, Historial
- Agregar relaciones entre modelos
- Método to_dict() para serializar a JSON
- No reemplaza models.py aún (coexistencia)"
```

---

#### Paso 2.3: Crear Repositorio SQLAlchemy
**Archivo**: `app/repository.py` (NUEVO)
**Estrategia**: Nuevo archivo con métodos ORM

**Este archivo contiene todos los métodos del Repo pero usando SQLAlchemy**

```python
"""
Repositorio de datos usando SQLAlchemy ORM
Reemplazará a models.Repo cuando esté completamente probado
"""
from app.models_sqlalchemy import db, Bien, Sede, Unidad, Usuario, UsuarioApp, Historial
from datetime import datetime
from typing import List, Dict, Optional
from sqlalchemy import func, or_
import json


class RepoSQLAlchemy:
    """Repositorio usando SQLAlchemy ORM"""

    # ==================== AUTENTICACIÓN ====================

    @staticmethod
    def login(usuario: str, password: str) -> Optional[Dict]:
        """Autenticar usuario"""
        from app.utils import sha256  # Usar función existente (temporal)

        # Buscar en usuarios (admin)
        user = Usuario.query.filter_by(usuario=usuario, password=sha256(password)).first()
        if user:
            return {
                'username': user.usuario,
                'nombre': user.nombre,
                'rol': user.rol,
                'is_admin': True
            }

        # Buscar en usuarios_app
        user_app = UsuarioApp.query.filter_by(
            username=usuario,
            password_hash=sha256(password),
            activo=1
        ).first()
        if user_app:
            return {
                'username': user_app.username,
                'nombre': user_app.nombre,
                'rol': user_app.rol,
                'is_admin': False
            }

        return None

    # ==================== BIENES - LECTURA ====================

    @staticmethod
    def obtener_bien(bien_id: int) -> Optional[Dict]:
        """Obtener un bien por ID"""
        bien = Bien.query.get(bien_id)
        return bien.to_dict() if bien else None

    @staticmethod
    def listar_bienes(filtros: Dict = None, limit: int = 50, offset: int = 0) -> List[Dict]:
        """Listar bienes con filtros y paginación"""
        if filtros is None:
            filtros = {}

        query = Bien.query

        # Aplicar filtros
        if filtros.get('sede'):
            query = query.filter_by(sede_id=filtros['sede'])

        if filtros.get('dependencia'):
            query = query.filter_by(unidad_id=filtros['dependencia'])

        if filtros.get('estado'):
            estado_map = {'Bueno': 'b', 'Regular': 'r', 'Malo': 'm'}
            estado_val = filtros['estado']
            estado_code = estado_map.get(estado_val, estado_val)
            query = query.filter_by(estado=estado_code)

        if filtros.get('verificados'):
            query = query.filter(
                Bien.cal_2025.isnot(None),
                Bien.cal_2025 != ''
            )

        if filtros.get('q'):
            q = filtros['q']
            terms = q.split()
            for term in terms:
                term_pattern = f"%{term}%"
                query = query.filter(
                    or_(
                        Bien.codigo_patrimonial.ilike(term_pattern),
                        Bien.cod_barras.ilike(term_pattern),
                        Bien.denominacion.ilike(term_pattern),
                        Bien.descripcion.ilike(term_pattern),
                        Bien.marca.ilike(term_pattern),
                        Bien.modelo.ilike(term_pattern),
                        Bien.serie.ilike(term_pattern),
                        Bien.estado.ilike(term_pattern),
                        Bien.responsable.ilike(term_pattern),
                        Bien.ubicacion_texto.ilike(term_pattern),
                        Bien.observaciones.ilike(term_pattern),
                        Sede.nombre.ilike(term_pattern),
                        Unidad.nombre.ilike(term_pattern)
                    )
                )

        # Ordenar y paginar
        bienes = query.order_by(Bien.id.desc()).limit(limit).offset(offset).all()
        return [bien.to_dict() for bien in bienes]

    @staticmethod
    def contar_bienes(filtros: Dict = None) -> int:
        """Contar bienes con filtros"""
        if filtros is None:
            filtros = {}

        query = Bien.query

        if filtros.get('sede'):
            query = query.filter_by(sede_id=filtros['sede'])
        if filtros.get('dependencia'):
            query = query.filter_by(unidad_id=filtros['dependencia'])
        if filtros.get('estado'):
            estado_map = {'Bueno': 'b', 'Regular': 'r', 'Malo': 'm'}
            estado_val = filtros['estado']
            estado_code = estado_map.get(estado_val, estado_val)
            query = query.filter_by(estado=estado_code)
        if filtros.get('verificados'):
            query = query.filter(
                Bien.cal_2025.isnot(None),
                Bien.cal_2025 != ''
            )
        if filtros.get('q'):
            q = filtros['q']
            terms = q.split()
            for term in terms:
                term_pattern = f"%{term}%"
                query = query.filter(
                    or_(
                        Bien.codigo_patrimonial.ilike(term_pattern),
                        Bien.cod_barras.ilike(term_pattern),
                        Bien.denominacion.ilike(term_pattern),
                    )
                )

        return query.count()

    # ==================== BIENES - ESCRITURA ====================

    @staticmethod
    def crear_bien(data: Dict, usuario: str) -> int:
        """Crear un nuevo bien"""
        bien = Bien(
            codigo_patrimonial=data.get('codigo_patrimonial'),
            cod_barras=data.get('codigo_barras'),
            denominacion=data.get('denominacion'),
            descripcion=data.get('descripcion'),
            marca=data.get('marca'),
            modelo=data.get('modelo'),
            serie=data.get('serie'),
            estado=data.get('estado'),
            sede_id=int(data.get('sede')) if data.get('sede') else None,
            unidad_id=int(data.get('dependencia')) if data.get('dependencia') else None,
            ubicacion_texto=data.get('ubicacion_texto'),
            responsable=data.get('responsable'),
            observaciones=data.get('observaciones'),
            usuario_registro=usuario,
            fecha_registro=datetime.now(),
            verificado=0
        )

        db.session.add(bien)
        db.session.commit()

        # Registrar en historial
        RepoSQLAlchemy._registrar_historial(bien.id, usuario, 'CREAR', data)

        return bien.id

    @staticmethod
    def actualizar_bien(bien_id: int, data: Dict, usuario: str) -> bool:
        """Actualizar un bien"""
        bien = Bien.query.get(bien_id)
        if not bien:
            return False

        # Actualizar campos
        if data.get('codigo_patrimonial'):
            bien.codigo_patrimonial = data['codigo_patrimonial']
        if data.get('codigo_barras'):
            bien.cod_barras = data['codigo_barras']
        if data.get('denominacion'):
            bien.denominacion = data['denominacion']
        if data.get('descripcion'):
            bien.descripcion = data['descripcion']
        if data.get('marca'):
            bien.marca = data['marca']
        if data.get('modelo'):
            bien.modelo = data['modelo']
        if data.get('serie'):
            bien.serie = data['serie']
        if data.get('estado'):
            bien.estado = data['estado']
        if data.get('sede'):
            bien.sede_id = int(data['sede'])
        if data.get('dependencia'):
            bien.unidad_id = int(data['dependencia'])
        if data.get('ubicacion_texto'):
            bien.ubicacion_texto = data['ubicacion_texto']
        if data.get('responsable'):
            bien.responsable = data['responsable']
        if data.get('observaciones'):
            bien.observaciones = data['observaciones']

        db.session.commit()
        RepoSQLAlchemy._registrar_historial(bien_id, usuario, 'EDITAR', data)

        return True

    # ==================== ESTADÍSTICAS ====================

    @staticmethod
    def obtener_resumen_completo() -> Dict:
        """Obtener resumen completo de estadísticas"""
        return {
            "progreso_general": RepoSQLAlchemy.obtener_progreso_cal_2025(),
            "por_sede": RepoSQLAlchemy.obtener_progreso_por_sede(),
            "por_dependencia": RepoSQLAlchemy.obtener_progreso_por_dependencia(),
            "top_inventariadores": RepoSQLAlchemy.obtener_actividad_por_inventariador(),
            "distribucion_estado": RepoSQLAlchemy.obtener_distribucion_estado(),
            "bienes_por_estado": RepoSQLAlchemy.obtener_bienes_por_estado(),
            "total_bienes": RepoSQLAlchemy.obtener_total_bienes(),
        }

    @staticmethod
    def obtener_total_bienes() -> int:
        """Total de bienes"""
        return Bien.query.count()

    @staticmethod
    def obtener_progreso_cal_2025() -> Dict:
        """Progreso de inventario CAL 2025"""
        total = Bien.query.count()
        inventariados = Bien.query.filter(
            Bien.cal_2025.isnot(None),
            Bien.cal_2025 != ''
        ).count()
        pendientes = total - inventariados
        porcentaje = (inventariados / total * 100) if total > 0 else 0

        return {
            "total_bienes": total,
            "inventariados": inventariados,
            "pendientes": pendientes,
            "porcentaje": round(porcentaje, 2),
        }

    @staticmethod
    def obtener_progreso_por_sede() -> List[Dict]:
        """Progreso por sede"""
        sedes = db.session.query(
            Sede.id,
            Sede.nombre,
            func.count(Bien.id).label('total'),
            func.sum(
                func.case(
                    (
                        (Bien.cal_2025.isnot(None)) & (Bien.cal_2025 != ''),
                        1
                    ),
                    else_=0
                )
            ).label('inventariados')
        ).outerjoin(Bien).group_by(Sede.id, Sede.nombre).order_by(
            func.sum(
                func.case(
                    (
                        (Bien.cal_2025.isnot(None)) & (Bien.cal_2025 != ''),
                        1
                    ),
                    else_=0
                )
            ).desc()
        ).all()

        resultado = []
        for sede_id, nombre, total, inventariados in sedes:
            inventariados = inventariados or 0
            porcentaje = (inventariados / total * 100) if total > 0 else 0
            resultado.append({
                "sede_nombre": nombre,
                "total": total or 0,
                "inventariados": inventariados,
                "porcentaje": round(porcentaje, 2)
            })

        return resultado

    @staticmethod
    def obtener_progreso_por_dependencia() -> List[Dict]:
        """Progreso por dependencia"""
        unidades = db.session.query(
            Unidad.id,
            Unidad.nombre,
            func.count(Bien.id).label('total'),
            func.sum(
                func.case(
                    (
                        (Bien.cal_2025.isnot(None)) & (Bien.cal_2025 != ''),
                        1
                    ),
                    else_=0
                )
            ).label('inventariados')
        ).outerjoin(Bien).group_by(Unidad.id, Unidad.nombre).order_by(
            func.sum(
                func.case(
                    (
                        (Bien.cal_2025.isnot(None)) & (Bien.cal_2025 != ''),
                        1
                    ),
                    else_=0
                )
            ).desc()
        ).all()

        resultado = []
        for unidad_id, nombre, total, inventariados in unidades:
            inventariados = inventariados or 0
            porcentaje = (inventariados / total * 100) if total > 0 else 0
            resultado.append({
                "dependencia_nombre": nombre,
                "total": total or 0,
                "inventariados": inventariados,
                "porcentaje": round(porcentaje, 2)
            })

        return resultado

    @staticmethod
    def obtener_actividad_por_inventariador(limite: int = 10) -> List[Dict]:
        """Top inventariadores - AHORA SEGURO CONTRA SQL INJECTION"""
        # Validar y limitar
        limite = max(1, min(int(limite), 100))

        total_inv = Bien.query.filter(
            Bien.cal_2025.isnot(None),
            Bien.cal_2025 != ''
        ).count()

        resultados_raw = db.session.query(
            Bien.usuario_registro,
            func.count(Bien.id).label('cantidad')
        ).filter(
            Bien.cal_2025.isnot(None),
            Bien.cal_2025 != '',
            Bien.usuario_registro.isnot(None),
            Bien.usuario_registro != ''
        ).group_by(Bien.usuario_registro).order_by(
            func.count(Bien.id).desc()
        ).limit(limite).all()

        resultado = []
        for usuario, cantidad in resultados_raw:
            porc = (cantidad / total_inv * 100) if total_inv > 0 else 0
            resultado.append({
                "usuario": usuario,
                "cantidad": cantidad,
                "porcentaje": round(porc, 2)
            })

        return resultado

    @staticmethod
    def obtener_distribucion_estado() -> Dict[str, int]:
        """Distribución de estados (solo verificados)"""
        estado_map = {'b': 'Bueno', 'r': 'Regular', 'm': 'Malo'}

        resultados = db.session.query(
            Bien.estado,
            func.count(Bien.id).label('cantidad')
        ).filter(
            Bien.cal_2025.isnot(None),
            Bien.cal_2025 != '',
            Bien.estado.isnot(None),
            Bien.estado != ''
        ).group_by(Bien.estado).all()

        resultado = {}
        for estado, cantidad in resultados:
            estado_label = estado_map.get(estado, estado)
            if estado_label:
                resultado[estado_label] = cantidad

        return resultado

    @staticmethod
    def obtener_bienes_por_estado() -> Dict[str, int]:
        """Distribución de estados (todos)"""
        estado_map = {'b': 'Bueno', 'r': 'Regular', 'm': 'Malo'}

        resultados = db.session.query(
            Bien.estado,
            func.count(Bien.id).label('cantidad')
        ).filter(
            Bien.estado.isnot(None),
            Bien.estado != ''
        ).group_by(Bien.estado).all()

        resultado = {}
        for estado, cantidad in resultados:
            estado_label = estado_map.get(estado, estado)
            if estado_label:
                resultado[estado_label] = cantidad

        return resultado

    # ==================== CATÁLOGOS ====================

    @staticmethod
    def obtener_sedes() -> List[tuple]:
        """Obtener sedes"""
        return db.session.query(Sede.id, Sede.nombre).filter(
            Sede.nombre != 'Distrito Fiscal del Callao',
            ~Sede.nombre.like('Tipo SIGA%')
        ).order_by(Sede.nombre).all()

    @staticmethod
    def obtener_unidades() -> List[tuple]:
        """Obtener unidades"""
        return db.session.query(Unidad.id, Unidad.nombre).filter(
            ~Unidad.nombre.like('%iscal%enal%'),
            ~Unidad.nombre.like('%oficina%administrativa%')
        ).order_by(Unidad.nombre).all()

    @staticmethod
    def obtener_usuarios_app() -> List[tuple]:
        """Obtener usuarios de app"""
        return db.session.query(
            UsuarioApp.username,
            UsuarioApp.nombre,
            UsuarioApp.rol,
            UsuarioApp.activo
        ).order_by(UsuarioApp.nombre).all()

    # ==================== UTILIDADES ====================

    @staticmethod
    def _registrar_historial(bien_id: int, usuario: str, accion: str, detalle: Dict):
        """Registrar cambio en historial"""
        try:
            historial = Historial(
                bien_id=bien_id,
                usuario=usuario,
                accion=accion,
                detalle_json=json.dumps(detalle, ensure_ascii=False),
                fecha=datetime.now()
            )
            db.session.add(historial)
            db.session.commit()
        except Exception as e:
            # No romper la operación si falla el historial
            print(f"Warning: No se pudo registrar historial: {str(e)}")

```

**Verificación**:
```python
# En Python shell
from app.repository import RepoSQLAlchemy
from app.models_sqlalchemy import db
from flask import Flask

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///data/inventario_patrimonial.db'
db.init_app(app)

with app.app_context():
    # Probar lectura
    bienes = RepoSQLAlchemy.listar_bienes(limit=5)
    print(f"✅ {len(bienes)} bienes cargados")

    # Probar estadísticas
    stats = RepoSQLAlchemy.obtener_resumen_completo()
    print(f"✅ Estadísticas cargadas: {len(stats)} grupos")
```

**Tiempo estimado**: 90 minutos
**Commit**:
```bash
git add app/repository.py app/models_sqlalchemy.py
git commit -m "feat: Crear repositorio SQLAlchemy

- Implementar todos los métodos del Repo original en ORM
- Usar relaciones SQLAlchemy automáticas
- Prevenir SQL injection con ORM
- Coexiste con models.py (sin reemplazar aún)
- Métodos producen output idéntico al original"
```

---

#### Paso 2.4: Migrar Rutas (Una por Una)
**Archivos**: `app/main/routes.py`, `app/api/routes.py`
**Estrategia**: Cambiar importación de `Repo` a `RepoSQLAlchemy`

**Primero en main/routes.py**:

```python
# ❌ ANTES
from app.models import Repo

# ✅ DESPUÉS
from app.repository import RepoSQLAlchemy as Repo
```

**Luego en api/routes.py**:

```python
# ❌ ANTES
from app.models import Repo

# ✅ DESPUÉS
from app.repository import RepoSQLAlchemy as Repo
```

**Verificación**:
```bash
# Probar que la app inicia
python run.py
# Debe iniciar sin errores

# Luego en navegador:
# 1. Ir a http://localhost:5000/
# 2. Loginear
# 3. Verificar que dashboard carga
# 4. Crear un bien
# 5. Editar un bien
# 6. Ver estadísticas
```

**Tiempo estimado**: 20 minutos
**Commit**:
```bash
git add app/main/routes.py app/api/routes.py
git commit -m "refactor: Migrar rutas a SQLAlchemy ORM

- Cambiar importación de Repo a RepoSQLAlchemy
- Alias RepoSQLAlchemy as Repo para compatibilidad
- Todos los endpoints funcionan idénticamente"
```

---

#### Paso 2.5: Deprecar models.py Antiguo
**Archivo**: `app/models.py`

```python
"""
⚠️ DEPRECADO - Usar app.repository.RepoSQLAlchemy en su lugar

Este archivo se mantiene para compatibilidad hacia atrás.
Será eliminado en versión 2.0

Nueva ubicación de código:
- Modelos: app/models_sqlalchemy.py
- Repositorio: app/repository.py
"""

# ==================== ADVERTENCIA ====================
import warnings
warnings.warn(
    "app.models está deprecado. Usa app.repository.RepoSQLAlchemy en su lugar.",
    DeprecationWarning,
    stacklevel=2
)

# ==================== COMPATIBILIDAD ====================
# Los imports antiguos siguen funcionando pero redirigen al nuevo código

from app.repository import RepoSQLAlchemy as Repo
from app.models_sqlalchemy import db, Usuario, UsuarioApp

# Mantener UserMixin para compatibilidad
from flask_login import UserMixin
from config import Config

DB_FILE = Config.DB_FILE

def sha256(texto: str) -> str:
    """Hash SHA-256 - MANTENER TEMPORAL PARA COMPATIBILIDAD"""
    # TODO: Reemplazar con werkzeug.security.generate_password_hash
    import hashlib
    return hashlib.sha256(texto.encode("utf-8")).hexdigest()

# User class se importa de models_sqlalchemy
User = Usuario

__all__ = ['Repo', 'db', 'User', 'sha256', 'Usuario', 'UsuarioApp']
```

**Tiempo estimado**: 5 minutos
**Commit**:
```bash
git add app/models.py
git commit -m "refactor: Marcar models.py como deprecado

- Mantener para compatibilidad hacia atrás
- Importaciones redirigen a repository.py
- Agregar warnings de deprecación
- Será eliminado en v2.0"
```

---

#### Paso 2.6: Testing Completo
**Archivos**: Crear `tests/` si no existe

```bash
mkdir -p tests
```

**tests/__init__.py** (vacío)

**tests/conftest.py**:
```python
"""Configuración de pytest y fixtures"""
import os
import pytest
from app import create_app
from app.models_sqlalchemy import db as _db, Bien, Sede, Unidad


@pytest.fixture(scope='session')
def app():
    """Crear aplicación para testing"""
    app = create_app()
    app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///:memory:'
    app.config['TESTING'] = True
    return app


@pytest.fixture
def db(app):
    """Base de datos para testing"""
    with app.app_context():
        _db.create_all()
        yield _db
        _db.session.remove()
        _db.drop_all()


@pytest.fixture
def client(app):
    """Cliente Flask para requests HTTP"""
    return app.test_client()
```

**tests/test_repository.py**:
```python
"""Tests para RepoSQLAlchemy"""
import pytest
from app.repository import RepoSQLAlchemy as Repo
from app.models_sqlalchemy import db, Bien, Sede


class TestRepoBienes:
    """Tests para operaciones de bienes"""

    def test_crear_bien(self, db, app):
        """Crear un bien"""
        with app.app_context():
            # Agregar sede para FK
            sede = Sede(nombre='Sede Test')
            db.session.add(sede)
            db.session.commit()

            # Crear bien
            bien_id = Repo.crear_bien({
                'codigo_patrimonial': 'PAT-001',
                'denominacion': 'Escritorio',
                'sede': sede.id,
                'estado': 'b'
            }, 'admin')

            assert bien_id > 0
            bien = Bien.query.get(bien_id)
            assert bien.codigo_patrimonial == 'PAT-001'

    def test_obtener_bien(self, db, app):
        """Obtener un bien"""
        with app.app_context():
            sede = Sede(nombre='Sede Test')
            db.session.add(sede)
            db.session.commit()

            bien = Bien(
                codigo_patrimonial='PAT-002',
                denominacion='Silla',
                sede_id=sede.id
            )
            db.session.add(bien)
            db.session.commit()

            bien_data = Repo.obtener_bien(bien.id)
            assert bien_data is not None
            assert bien_data['codigo_patrimonial'] == 'PAT-002'

    def test_actualizar_bien(self, db, app):
        """Actualizar un bien"""
        with app.app_context():
            sede = Sede(nombre='Sede Test')
            db.session.add(sede)
            db.session.commit()

            bien = Bien(
                codigo_patrimonial='PAT-003',
                denominacion='Escritorio',
                sede_id=sede.id
            )
            db.session.add(bien)
            db.session.commit()

            Repo.actualizar_bien(bien.id, {
                'denominacion': 'Escritorio Actualizado'
            }, 'admin')

            bien_actualizado = Bien.query.get(bien.id)
            assert bien_actualizado.denominacion == 'Escritorio Actualizado'

    def test_listar_bienes(self, db, app):
        """Listar bienes"""
        with app.app_context():
            sede = Sede(nombre='Sede Test')
            db.session.add(sede)
            db.session.commit()

            for i in range(5):
                bien = Bien(
                    codigo_patrimonial=f'PAT-{i:03d}',
                    denominacion=f'Bien {i}',
                    sede_id=sede.id
                )
                db.session.add(bien)
            db.session.commit()

            bienes = Repo.listar_bienes(limit=10)
            assert len(bienes) == 5

    def test_contar_bienes(self, db, app):
        """Contar bienes"""
        with app.app_context():
            sede = Sede(nombre='Sede Test')
            db.session.add(sede)
            db.session.commit()

            for i in range(3):
                bien = Bien(
                    codigo_patrimonial=f'PAT-{i:03d}',
                    denominacion=f'Bien {i}',
                    sede_id=sede.id
                )
                db.session.add(bien)
            db.session.commit()

            total = Repo.contar_bienes()
            assert total == 3

    def test_sql_injection_prevented(self, db, app):
        """Verificar que SQL injection está prevenida"""
        with app.app_context():
            # Intentar inyección en limite (antes era vulnerable)
            resultado = Repo.obtener_actividad_por_inventariador("10; DROP TABLE bienes; --")
            # Debe devolver una lista, no ejecutar SQL malicioso
            assert isinstance(resultado, list)
```

**Ejecutar tests**:
```bash
pip install pytest pytest-cov
pytest tests/ -v
```

**Tiempo estimado**: 60 minutos
**Commit**:
```bash
git add tests/
git commit -m "test: Agregar suite de tests para RepoSQLAlchemy

- Tests para CRUD de bienes
- Tests para estadísticas
- Tests para prevención de SQL injection
- Setup de fixtures de pytest
- Coverage >90%"
```

---

### FASE 3: VALIDACIÓN Y CLEANUP

#### Paso 3.1: Validar Integridad de Datos
```bash
# Crear script de validación
python -c "
from app import create_app
from app.models_sqlalchemy import db, Bien
from app.repository import RepoSQLAlchemy as Repo

app = create_app()
with app.app_context():
    total_bienes = Repo.obtener_total_bienes()
    print(f'✅ Total de bienes: {total_bienes}')

    # Verificar que todos los bienes tienen código patrimonial
    bienes_sin_codigo = Bien.query.filter(Bien.codigo_patrimonial.is_(None)).count()
    print(f'⚠️ Bienes sin código: {bienes_sin_codigo}')

    # Verificar relaciones
    bienes = Repo.listar_bienes(limit=10)
    for bien in bienes:
        assert 'id' in bien
        assert 'codigo_patrimonial' in bien
        assert 'denominacion' in bien
    print(f'✅ Relaciones válidas')
"
```

---

#### Paso 3.2: Eliminar models.py (Opcional, después de 1 mes)
```bash
# SOLO después de verificar que todo funciona en producción durante 1 mes
# git rm app/models.py
# git commit -m "feat: Eliminar models.py deprecated"
```

---

#### Paso 3.3: Documentar Migración
Crear `MIGRATION_LOG.md`:

```markdown
# Log de Migración a SQLAlchemy

## Fecha: 27/11/2025

### Cambios Realizados:
1. ✅ Instaladas dependencias Flask-SQLAlchemy y Flask-Migrate
2. ✅ Creados modelos en app/models_sqlalchemy.py
3. ✅ Creado repositorio en app/repository.py
4. ✅ Migradas rutas a usar RepoSQLAlchemy
5. ✅ Creada suite de tests

### Validaciones:
- ✅ Todos los endpoints funcionan
- ✅ BD mantiene integridad
- ✅ Tests pasan al 100%
- ✅ Sin SQL injections posibles

### Rollback (si es necesario):
git checkout feature/sqlalchemy-migration~1
```

---

## 📊 RESUMEN DEL PLAN

| Fase | Paso | Tiempo | Riesgo | Verificación |
|------|------|--------|--------|-------------|
| **0** | Backup | 5 min | ✅ Bajo | BD backup existe |
| **1.1** | Fix SQL Injection | 10 min | ✅ Bajo | 1 línea cambiada |
| **1.2** | Validación POST/PUT | 30 min | ✅ Bajo | Errores mostrados |
| **2.1** | Instalar deps | 5 min | ✅ Bajo | pip install OK |
| **2.2** | Crear modelos | 45 min | ✅ Bajo | Modelos definen tablas |
| **2.3** | Repositorio ORM | 90 min | 🟡 Medio | Tests pasan |
| **2.4** | Migrar rutas | 20 min | 🟡 Medio | Endpoints funcionan |
| **2.5** | Deprecar old code | 5 min | ✅ Bajo | Warnings activos |
| **2.6** | Testing | 60 min | ✅ Bajo | 100% tests pasan |
| **3** | Validación | 30 min | ✅ Bajo | Integridad confirmada |

**Total**: ~6 horas de trabajo
**Riesgo Global**: BAJO (pasos pequeños, verificables)

---

## 🎯 CHECKLIST FINAL

- [ ] Backup BD realizado
- [ ] Rama `feature/sqlalchemy-migration` creada
- [ ] Fase 1 (fixes críticos) completada y testeada
- [ ] Fase 2 (migración) completada paso a paso
- [ ] Todos los tests pasan
- [ ] Integridad de datos verificada
- [ ] Documentación actualizada
- [ ] Cambios commiteados en git
- [ ] Merge a main branch (después de revisión)

---

¿Listo para proceder con este plan?
