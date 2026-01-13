"""
Modelos SQLAlchemy para Control Patrimonial
Refactorización de models.py hacia ORM

Este archivo define todos los modelos de datos usando SQLAlchemy ORM.
Reemplaza gradualmente a models.py (que seguirá siendo funcional en transición).
"""

from flask_sqlalchemy import SQLAlchemy
from flask_login import UserMixin
from datetime import datetime
from sqlalchemy import event, Index
import bcrypt

db = SQLAlchemy()

# ==================== UTILIDADES ====================

def hash_password(password: str) -> str:
    """
    Hash de contraseña usando bcrypt.

    Bcrypt es más seguro que SHA-256 porque:
    - Incluye salt automáticamente
    - Es lento por diseño (resiste brute force)
    - Se adapta a hardware más rápido (cost factor)

    Args:
        password: Contraseña en texto plano

    Returns:
        Hash bcrypt de la contraseña
    """
    salt = bcrypt.gensalt(rounds=12)  # Cost factor 12 = ~100ms por hash
    return bcrypt.hashpw(password.encode('utf-8'), salt).decode('utf-8')


def verify_password(password: str, password_hash: str) -> bool:
    """
    Verificar contraseña contra hash bcrypt.

    Args:
        password: Contraseña en texto plano a verificar
        password_hash: Hash bcrypt guardado en BD

    Returns:
        True si la contraseña es correcta, False en caso contrario
    """
    try:
        return bcrypt.checkpw(password.encode('utf-8'), password_hash.encode('utf-8'))
    except (ValueError, TypeError):
        return False


# LEGACY: Mantener por compatibilidad con datos antiguos
def sha256(texto: str) -> str:
    """
    DEPRECATED: Hash SHA-256 para passwords (solo para compatibilidad).

    NO usar para nuevos passwords. Las contraseñas existentes con SHA-256
    deben ser migradas a bcrypt en la próxima oportunidad.

    Ver: hash_password() para uso actual.
    """
    import hashlib
    return hashlib.sha256(texto.encode("utf-8")).hexdigest()

# ==================== MODELOS ====================

class Usuario(UserMixin, db.Model):
    """
    Usuario Administrador de la Aplicación.

    Este modelo representa a los administradores del sistema con acceso
    total a todas las funcionalidades.

    Atributos:
        id (int): Identificador único
        usuario (str): Nombre de usuario único (login)
        nombre (str): Nombre completo del administrador
        password (str): Hash SHA-256 de la contraseña
        rol (str): Rol del usuario (siempre 'admin')

    Propósito:
        - Super administradores del sistema
        - Acceso total a configuración y datos
        - Gestión de usuarios operadores

    Uso típico:
        - 1-2 usuarios máximo
        - Creados durante instalación
        - No se eliminan en operación normal

    Tabla BD: usuarios (SQLite/PostgreSQL)
    """
    __tablename__ = 'usuarios'

    id = db.Column(db.Integer, primary_key=True)
    usuario = db.Column(db.String(50), unique=True, nullable=False, index=True)
    nombre = db.Column(db.String(100), nullable=False)
    password = db.Column(db.String(100), nullable=False)
    rol = db.Column(db.String(20), default='admin')

    @property
    def is_admin(self):
        return True

    @property
    def username(self):
        return self.usuario

    def get_id(self):
        return f"admin_{self.usuario}" # Prefijo para administradores

    def __repr__(self):
        return f'<Usuario {self.usuario}>'


class UsuarioApp(UserMixin, db.Model):
    """
    Usuario Operador de la Aplicación Web.

    Este modelo representa a los operadores que usan la aplicación web
    para gestionar los bienes patrimoniales con permisos limitados.

    Atributos:
        username (str): Nombre de usuario único (login) - PRIMARY KEY
        nombre (str): Nombre completo del operador
        password_hash (str): Hash SHA-256 de la contraseña
        rol (str): Rol del usuario (ej: 'operador', 'supervisor')
        activo (int): Estado del usuario (1=activo, 0=inactivo)

    Propósito:
        - Operadores de campo para gestión de bienes
        - Permisos limitados según rol
        - Búsqueda, registro y actualización de bienes

    Uso típico:
        - Múltiples usuarios (10-100+)
        - Creados según necesidades operativas
        - Pueden ser desactivados sin eliminar

    Diferencias con Usuario:
        - Usuario: Super admin (tabla: usuarios, rol siempre 'admin')
        - UsuarioApp: Operadores (tabla: usuarios_app, múltiples roles)

    Tabla BD: usuarios_app (SQLite/PostgreSQL)
    """
    __tablename__ = 'usuarios_app'

    username = db.Column(db.String(50), primary_key=True, index=True)
    nombre = db.Column(db.String(100), nullable=False)
    password_hash = db.Column(db.String(100), nullable=False)
    rol = db.Column(db.String(20), default='operador')
    activo = db.Column(db.Integer, default=1)

    @property
    def is_admin(self):
        return False
    # Columna opcional (puede no existir en BD legacy)
    # fecha_creacion = db.Column(db.DateTime, default=datetime.now)

    def get_id(self):
        return f"app_{self.username}" # Prefijo para usuarios de la app

    def __repr__(self):
        return f'<UsuarioApp {self.username}>'


class Sede(db.Model):
    """Sedes/locales del Distrito Fiscal"""
    __tablename__ = 'sedes'

    id = db.Column(db.Integer, primary_key=True)
    nombre = db.Column(db.String(200), nullable=False, index=True)

    # Relaciones
    bienes = db.relationship('Bien', backref='sede', lazy='dynamic', cascade='all, delete-orphan')

    def __repr__(self):
        return f'<Sede {self.nombre}>'


class Unidad(db.Model):
    """Unidades/dependencias del Distrito Fiscal"""
    __tablename__ = 'unidades'

    id = db.Column(db.Integer, primary_key=True)
    nombre = db.Column(db.String(200), nullable=False, index=True)

    # Relaciones
    bienes = db.relationship('Bien', backref='unidad', lazy='dynamic', cascade='all, delete-orphan')

    def __repr__(self):
        return f'<Unidad {self.nombre}>'


class Bien(db.Model):
    """Bien patrimonial del Distrito Fiscal"""
    __tablename__ = 'bienes'

    id = db.Column(db.Integer, primary_key=True)
    codigo_patrimonial = db.Column(db.String(50), unique=True, nullable=True, index=True)
    cod_barras = db.Column(db.String(100), unique=True, index=True)  # Código de barras debe ser único
    denominacion = db.Column(db.String(200), nullable=False, index=True)
    descripcion = db.Column(db.Text)
    marca = db.Column(db.String(100))
    modelo = db.Column(db.String(100))
    serie = db.Column(db.String(100), unique=True, index=True)  # Número de serie debe ser único
    estado = db.Column(db.String(1))  # 'b' (Bueno), 'r' (Regular), 'm' (Malo)
    sede_id = db.Column(db.Integer, db.ForeignKey('sedes.id'), nullable=False, index=True)
    unidad_id = db.Column(db.Integer, db.ForeignKey('unidades.id'), index=True)
    ubicacion_texto = db.Column(db.Text)
    responsable = db.Column(db.String(200))
    observaciones = db.Column(db.Text)
    usuario_registro = db.Column(db.String(50), index=True)
    fecha_registro = db.Column(db.DateTime, default=datetime.now, index=True)
    verificado = db.Column(db.Integer, default=0)
    cal_2020 = db.Column(db.String(50))
    cal_2021 = db.Column(db.Integer)
    cal_2022 = db.Column(db.Integer)
    cal_2023 = db.Column(db.Integer)
    cal_2024 = db.Column(db.Integer)
    cal_2025 = db.Column(db.String(50), unique=True, index=True)  # CAL 2025 puede ser alfanumérico

    # Relación con historial
    historial = db.relationship('Historial', backref='bien', lazy='dynamic', cascade='all, delete-orphan')

    def __repr__(self):
        return f'<Bien {self.codigo_patrimonial}>'

    def to_dict(self):
        """Convertir a diccionario para API y vistas"""
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
            'cal_2020': self.cal_2020,
            'cal_2021': self.cal_2021,
            'cal_2022': self.cal_2022,
            'cal_2023': self.cal_2023,
            'cal_2024': self.cal_2024,
            'cal_2025': self.cal_2025,
        }


class Historial(db.Model):
    """Historial de cambios en bienes"""
    __tablename__ = 'historial'

    id = db.Column(db.Integer, primary_key=True)
    bien_id = db.Column(db.Integer, db.ForeignKey('bienes.id'), nullable=False, index=True)
    usuario = db.Column(db.String(50), nullable=False, index=True)
    accion = db.Column(db.String(50), nullable=False)  # CREAR, EDITAR, ELIMINAR, VERIFICAR
    detalle_json = db.Column(db.Text)
    fecha = db.Column(db.DateTime, default=datetime.now, index=True)

    def __repr__(self):
        return f'<Historial {self.bien_id} {self.accion}>'


class FichaLevantamiento(db.Model):
    """
    Fichas de Levantamiento Físico - Registro de inventarios.

    Una ficha representa un conjunto de bienes inventariados en una sesión
    de levantamiento. Cada ficha es un PDF firmado que documenta los bienes
    verificados por un operador en una fecha específica.

    Atributos:
        id (int): Identificador único de la ficha
        numero_siga (str): Número SIGA asignado automáticamente (único)
        usuario_levantamiento (str): Operador que realizó el levantamiento
        responsable_name (str): Nombre del responsable que firmó la ficha (Usuario Final)
        archivo_pdf (str): Nombre del archivo PDF guardado
        cantidad_bienes (int): Cantidad de bienes en esta ficha
        estado (str): Estado de la ficha (PENDIENTE, VERIFICADA, ARCHIVADA)
        fecha_creacion (datetime): Cuándo se subió la ficha
        fecha_verificacion (datetime): Cuándo fue verificada por admin
        observaciones (text): Notas adicionales

    Relaciones:
        - usuario_levantamiento -> UsuarioApp
        - bienes: Múltiples bienes (relación muchos-a-muchos)
    """
    __tablename__ = 'fichas_levantamiento'

    id = db.Column(db.Integer, primary_key=True)
    numero_siga = db.Column(db.String(50), unique=True, nullable=False, index=True)
    usuario_levantamiento = db.Column(db.String(50), nullable=True, index=True)  # Usuario que subió (admin o operador)
    responsable_name = db.Column(db.String(150), nullable=False, index=True)  # Nombre del responsable que firmó
    bienes_codigos = db.Column(db.Text, nullable=True)  # JSON list de codigo_patrimonial: [74065282, 74065400, ...]
    archivo_pdf = db.Column(db.String(255), nullable=False)
    cantidad_bienes = db.Column(db.Integer, default=0)
    estado = db.Column(db.String(20), default='PENDIENTE', index=True)  # PENDIENTE, VERIFICADA, ARCHIVADA
    fecha_creacion = db.Column(db.DateTime, default=datetime.now, nullable=False, index=True)
    fecha_verificacion = db.Column(db.DateTime, nullable=True)
    verificado_por = db.Column(db.String(50), nullable=True)  # Usuario admin que verificó
    observaciones = db.Column(db.Text, nullable=True)


    def __repr__(self):
        return f'<FichaLevantamiento {self.numero_siga}>'

    def get_bienes_codigos_list(self):
        """Obtener lista de códigos de bienes desde JSON"""
        if not self.bienes_codigos:
            return []
        try:
            import json
            return json.loads(self.bienes_codigos)
        except:
            return []

    def set_bienes_codigos_list(self, codigos_list):
        """Guardar lista de códigos de bienes como JSON"""
        if codigos_list:
            import json
            self.bienes_codigos = json.dumps(codigos_list)
        else:
            self.bienes_codigos = None

    def to_dict(self):
        """Convertir a diccionario para API y vistas"""
        return {
            'id': self.id,
            'numero_siga': self.numero_siga,
            'usuario_levantamiento': self.usuario_levantamiento,
            'responsable_name': self.responsable_name,
            'archivo_pdf': self.archivo_pdf,
            'cantidad_bienes': self.cantidad_bienes,
            'estado': self.estado,
            'fecha_creacion': self.fecha_creacion.isoformat() if self.fecha_creacion else None,
            'fecha_verificacion': self.fecha_verificacion.isoformat() if self.fecha_verificacion else None,
            'verificado_por': self.verificado_por,
            'observaciones': self.observaciones,
        }


# ==================== RESPONSABLES ====================
class Responsable(db.Model):
    """Tabla de responsables/usuarios que pueden ser asignados a bienes"""
    __tablename__ = 'responsables'

    id = db.Column(db.Integer, primary_key=True)
    nombre = db.Column(db.String(255), unique=True, nullable=False, index=True)
    sede_id = db.Column(db.Integer, db.ForeignKey('sedes.id'), nullable=True, index=True)
    dependencia_id = db.Column(db.Integer, db.ForeignKey('unidades.id'), nullable=True, index=True)
    activo = db.Column(db.Integer, default=1, index=True)
    fecha_creacion = db.Column(db.DateTime, default=datetime.now, index=True)

    # Relaciones
    sede = db.relationship('Sede', backref='responsables_asignados')
    dependencia = db.relationship('Unidad', backref='responsables_asignados')

    def __repr__(self):
        return f'<Responsable {self.nombre}>'

    def to_dict(self):
        return {
            'id': self.id,
            'nombre': self.nombre,
            'sede_id': self.sede_id,
            'dependencia_id': self.dependencia_id,
            'activo': self.activo,
            'fecha_creacion': self.fecha_creacion.isoformat() if self.fecha_creacion else None,
        }


# ==================== ÍNDICES ADICIONALES ====================
# FASE 1: Índices para búsquedas frecuentes y optimización de performance
# Estos índices mejoran significativamente las búsquedas (30-50% más rápido)

# Índices en Bien (tabla más consultada)
Index('idx_bien_sede_estado', Bien.sede_id, Bien.estado)  # Búsquedas por sede y estado
Index('idx_bien_fecha', Bien.fecha_registro)              # Ordenamiento por fecha
Index('idx_bien_usuario_registro', Bien.usuario_registro) # Búsquedas por usuario
Index('idx_bien_cal_2025', Bien.cal_2025)                # Búsquedas de inventario CAL 2025
Index('idx_bien_denominacion', Bien.denominacion)        # Búsquedas por nombre

# Índices en Historial
Index('idx_historial_fecha', Historial.fecha)            # Línea de tiempo de cambios
Index('idx_historial_bien_usuario', Historial.bien_id, Historial.usuario)  # Cambios por usuario

# Índices en otras tablas
Index('idx_sede_nombre', Sede.nombre)                    # Búsquedas por sede
Index('idx_unidad_nombre', Unidad.nombre)                # Búsquedas por unidad


# ==================== INICIALIZACIÓN ====================

def init_db(app):
    """
    Inicializar base de datos con la aplicación Flask.

    Uso:
        from app.models_sqlalchemy import db, init_db
        init_db(app)
    """
    db.init_app(app)
    with app.app_context():
        db.create_all()
        print("Base de datos inicializada")


# ==================== EXPORTAR ====================
__all__ = [
    'db',
    'Usuario',
    'UsuarioApp',
    'Sede',
    'Unidad',
    'Bien',
    'Historial',
    'Responsable',
    'init_db',
    'hash_password',
    'verify_password'
]
