"""
⚠️ DEPRECADO - Usar app.repository.RepoSQLAlchemy en su lugar

Este archivo se mantiene para compatibilidad hacia atrás.
Será eliminado en versión 2.0

Nueva ubicación de código:
- Modelos: app/models_sqlalchemy.py
- Repositorio: app/repository.py
- Autenticación: app/auth/routes.py

Adaptado de database_schema.py del proyecto de escritorio.
"""

import warnings
warnings.warn(
    "app.models está deprecado. Usa app.repository.RepoSQLAlchemy en su lugar.",
    DeprecationWarning,
    stacklevel=2
)
import sqlite3
import hashlib
import json
from datetime import datetime
from contextlib import contextmanager
from typing import Any, Dict, List, Optional, Tuple
from flask_login import UserMixin
from config import Config
from app import login_manager

DB_FILE = Config.DB_FILE

@login_manager.user_loader
def load_user(user_id):
    repo = Repo()
    # user_id es el username en nuestro caso para usuarios_app
    # O el ID para usuarios admin.
    # Vamos a unificar la lógica en una clase User wrapper.
    
    # Intentar buscar en usuarios_app primero (más común para web)
    cuenta = repo.obtener_cuenta_app_por_username(user_id)
    if cuenta:
        return User(username=cuenta[0], nombre=cuenta[1], rol=cuenta[2], is_admin=False)
    
    # Si no, buscar en admin (tabla usuarios) - aunque el ID ahí es int, el login usa username
    # Para simplificar, asumiremos que el ID de sesión es el username.
    # Pero el load_user recibe lo que devuelve get_id().
    
    # Revisemos login(): devuelve (id, usuario, nombre, rol)
    # Si es admin: (1, 'admin', 'Administrador', 'admin')
    # Si es app: ('juan', 'juan', 'Juan Perez', 'operador')
    
    # Si el ID es numérico, es admin? No necesariamente, pero en este esquema sí.
    # Mejor buscamos por username si user_id es string.
    
    # Hack: Si user_id es 'admin', es el admin.
    if user_id == 'admin':
         return User(username='admin', nombre='Administrador', rol='admin', is_admin=True)
         
    return None

class User(UserMixin):
    def __init__(self, username, nombre, rol, is_admin=False):
        self.id = username
        self.username = username
        self.nombre = nombre
        self.rol = rol
        self.is_admin = is_admin
        
    def get_id(self):
        return self.username

# Context manager para conexión con Foreign Keys activas
@contextmanager
def db():
    """Context manager para conexiones SQLite con FK habilitadas."""
    con = sqlite3.connect(DB_FILE)
    con.row_factory = sqlite3.Row  # Usar Row factory para acceder por nombre
    con.execute("PRAGMA foreign_keys = ON")
    try:
        yield con
        con.commit()
    finally:
        con.close()

def sha256(texto: str) -> str:
    """Hash SHA-256 para passwords."""
    return hashlib.sha256(texto.encode("utf-8")).hexdigest()

class Repo:
    """
    Repositorio de acceso a datos.
    """

    def __init__(self, db_file: str = DB_FILE):
        self.db_file = db_file
        # No inicializamos esquema aquí para no bloquear cada request, 
        # asumimos que la DB ya existe o se inicializa aparte.

    # ========== UTILIDADES ==========
    @staticmethod
    def _clean_text(s: Optional[str]) -> Optional[str]:
        if s is None:
            return None
        return " ".join(str(s).split())

    # ========== USUARIOS ==========
    def login(self, usuario: str, password: str) -> Optional[User]:
        """
        Valida credenciales y devuelve objeto User.
        """
        with db() as con:
            cur = con.cursor()

            # 1. Verificar admin (tabla usuarios)
            cur.execute(
                "SELECT id, usuario, nombre, rol FROM usuarios WHERE usuario=? AND password=?",
                (usuario, sha256(password))
            )
            result = cur.fetchone()

            if result:
                return User(username=result['usuario'], nombre=result['nombre'], rol=result['rol'], is_admin=True)

            # 2. Verificar usuarios_app
            cur.execute(
                "SELECT username, nombre, rol FROM usuarios_app WHERE username=? AND password_hash=? AND activo=1",
                (usuario, sha256(password))
            )
            result = cur.fetchone()

            if result:
                return User(username=result['username'], nombre=result['nombre'], rol=result['rol'], is_admin=False)

            return None

    def obtener_cuenta_app_por_username(self, username: str):
        with db() as con:
            cur = con.cursor()
            cur.execute("SELECT username, nombre, rol, activo FROM usuarios_app WHERE username=?", (username,))
            return cur.fetchone()

    # ========== ESTADÍSTICAS AVANZADAS (CAL 2025) ==========
    def obtener_resumen_completo(self) -> Dict:
        return {
            "progreso_general": self.obtener_progreso_cal_2025(),
            "por_sede": self.obtener_progreso_por_sede(),
            "por_dependencia": self.obtener_progreso_por_dependencia(),
            "top_inventariadores": self.obtener_actividad_por_inventariador(),
            "distribucion_estado": self.obtener_distribucion_estado(),
            "bienes_por_estado": self.obtener_bienes_por_estado(),
            "total_bienes": self.obtener_total_bienes(),
        }

    def obtener_total_bienes(self) -> int:
        with db() as con:
            cur = con.cursor()
            cur.execute("SELECT COUNT(*) FROM bienes")
            res = cur.fetchone()
            return res[0] if res else 0

    def obtener_progreso_cal_2025(self) -> Dict:
        with db() as con:
            cur = con.cursor()
            cur.execute("SELECT COUNT(*) FROM bienes")
            total = cur.fetchone()[0]
            cur.execute("SELECT COUNT(*) FROM bienes WHERE cal_2025 IS NOT NULL AND cal_2025 != ''")
            inventariados = cur.fetchone()[0]
            pendientes = total - inventariados
            porcentaje = (inventariados / total * 100) if total > 0 else 0
            return {
                "total_bienes": total,
                "inventariados": inventariados,
                "pendientes": pendientes,
                "porcentaje": round(porcentaje, 2),
            }

    def obtener_progreso_por_sede(self) -> List[Dict]:
        with db() as con:
            cur = con.cursor()
            cur.execute("""
                SELECT s.id, s.nombre, COUNT(b.id) as total,
                       COALESCE(SUM(CASE WHEN b.cal_2025 IS NOT NULL AND b.cal_2025 != '' THEN 1 ELSE 0 END), 0) as inventariados
                FROM sedes s
                LEFT JOIN bienes b ON s.id = b.sede_id
                GROUP BY s.id, s.nombre
                ORDER BY inventariados DESC
            """)
            resultado = []
            for row in cur.fetchall():
                total = row[2]
                inventariados = row[3]
                porcentaje = (inventariados / total * 100) if total > 0 else 0
                resultado.append({
                    "sede_nombre": row[1],
                    "total": total,
                    "inventariados": inventariados,
                    "porcentaje": round(porcentaje, 2)
                })
            return resultado

    def obtener_progreso_por_dependencia(self) -> List[Dict]:
        with db() as con:
            cur = con.cursor()
            cur.execute("""
                SELECT u.id, u.nombre, COUNT(b.id) as total,
                       COALESCE(SUM(CASE WHEN b.cal_2025 IS NOT NULL AND b.cal_2025 != '' THEN 1 ELSE 0 END), 0) as inventariados
                FROM unidades u
                LEFT JOIN bienes b ON u.id = b.unidad_id
                GROUP BY u.id, u.nombre
                ORDER BY inventariados DESC
            """)
            resultado = []
            for row in cur.fetchall():
                total = row[2]
                inventariados = row[3]
                porcentaje = (inventariados / total * 100) if total > 0 else 0
                resultado.append({
                    "dependencia_nombre": row[1],
                    "total": total,
                    "inventariados": inventariados,
                    "porcentaje": round(porcentaje, 2)
                })
            return resultado

    def obtener_actividad_por_inventariador(self, limite: int = 10) -> List[Dict]:
        # ✅ SEGURO: Validar y limitar el parámetro limite
        limite = max(1, min(int(limite), 100))  # Entre 1 y 100

        with db() as con:
            cur = con.cursor()
            cur.execute("SELECT COUNT(*) FROM bienes WHERE cal_2025 IS NOT NULL AND cal_2025 != ''")
            total_inv = cur.fetchone()[0]

            # ✅ SEGURO: Usar parámetro preparado en lugar de f-string
            cur.execute("""
                SELECT usuario_registro, COUNT(*) as cantidad
                FROM bienes
                WHERE cal_2025 IS NOT NULL AND cal_2025 != '' AND usuario_registro IS NOT NULL AND usuario_registro != ''
                GROUP BY usuario_registro
                ORDER BY cantidad DESC
                LIMIT ?
            """, (limite,))
            resultado = []
            for row in cur.fetchall():
                cant = row[1]
                porc = (cant / total_inv * 100) if total_inv > 0 else 0
                resultado.append({
                    "usuario": row[0],
                    "cantidad": cant,
                    "porcentaje": round(porc, 2)
                })
            return resultado

    def obtener_distribucion_estado(self) -> Dict[str, int]:
        with db() as con:
            cur = con.cursor()
            cur.execute("""
                SELECT
                    CASE WHEN estado = 'b' THEN 'Bueno'
                         WHEN estado = 'r' THEN 'Regular'
                         WHEN estado = 'm' THEN 'Malo'
                         ELSE estado END as estado_desc,
                    COUNT(*) as cantidad
                FROM bienes
                WHERE cal_2025 IS NOT NULL AND cal_2025 != '' AND estado IS NOT NULL AND estado != ''
                GROUP BY estado_desc
            """)
            resultado = {}
            for row in cur.fetchall():
                if row[0] and str(row[0]).strip():
                    resultado[row[0]] = row[1]
            return resultado

    def obtener_bienes_por_estado(self) -> Dict[str, int]:
        with db() as con:
            cur = con.cursor()
            cur.execute("""
                SELECT
                    CASE WHEN estado = 'b' THEN 'Bueno'
                         WHEN estado = 'r' THEN 'Regular'
                         WHEN estado = 'm' THEN 'Malo'
                         ELSE estado END as estado_desc,
                    COUNT(*) as cantidad
                FROM bienes
                WHERE estado IS NOT NULL AND estado != ''
                GROUP BY estado_desc
            """)
            resultado = {}
            for row in cur.fetchall():
                if row[0] and str(row[0]).strip():
                    resultado[row[0]] = row[1]
            return resultado

    def listar_bienes(self, filtros: dict = None, limit: int = 50, offset: int = 0):
        if filtros is None:
            filtros = {}

        filtros_list, params = [], []

        # Mapeo de filtros
        if filtros.get('sede'):
            # Ahora filtramos por sede_id
            filtros_list.append("b.sede_id=?")
            params.append(filtros['sede'])
        
        if filtros.get('dependencia'):
            filtros_list.append("b.unidad_id=?")
            params.append(filtros['dependencia'])
        
        if filtros.get('estado'):
            estado_map = {'Bueno': 'b', 'Regular': 'r', 'Malo': 'm'}
            val = filtros['estado']
            # Buscar coincidencia exacta o el código corto
            filtros_list.append("(b.estado=? OR b.estado=?)")
            params.extend([val, estado_map.get(val, val)])
        
        if filtros.get('q'):
            q = filtros['q']
            terms = q.split()
            for term in terms:
                term_like = f"%{term}%"
                filtros_list.append("""(
                    b.codigo_patrimonial LIKE ? OR 
                    b.cod_barras LIKE ? OR 
                    b.denominacion LIKE ? OR 
                    b.descripcion LIKE ? OR
                    b.marca LIKE ? OR 
                    b.modelo LIKE ? OR
                    b.serie LIKE ? OR
                    b.estado LIKE ? OR
                    b.responsable LIKE ? OR
                    b.ubicacion_texto LIKE ? OR
                    b.observaciones LIKE ? OR
                    s.nombre LIKE ? OR
                    u.nombre LIKE ?
                )""")
                params += [term_like] * 13  # 13 campos

        where = f"WHERE {' AND '.join(filtros_list)}" if filtros_list else ""

        # Join con sedes para obtener el nombre
        sql = f"""
            SELECT b.*, s.nombre as sede_nombre, u.nombre as unidad_nombre
            FROM bienes b
            LEFT JOIN sedes s ON b.sede_id = s.id
            LEFT JOIN unidades u ON b.unidad_id = u.id
            {where}
            ORDER BY b.id DESC
            LIMIT ? OFFSET ?
        """
        params.extend([limit, offset])

        with db() as con:
            rows = con.cursor().execute(sql, params).fetchall()
            # Convertir a dict y mapear campos para la vista
            result = []
            for row in rows:
                r = dict(row)
                r['sede'] = r.get('sede_nombre') or ''
                r['dependencia'] = r.get('unidad_nombre') or ''
                result.append(r)
            return result

    def contar_bienes(self, filtros: dict = None):
        if filtros is None: filtros = {}
        filtros_list, params = [], []
        
        if filtros.get('sede'):
            filtros_list.append("b.sede_id=?")
            params.append(filtros['sede'])
        if filtros.get('dependencia'):
            filtros_list.append("b.unidad_id=?")
            params.append(filtros['dependencia'])
        if filtros.get('estado'):
            estado_map = {'Bueno': 'b', 'Regular': 'r', 'Malo': 'm'}
            val = filtros['estado']
            filtros_list.append("(b.estado=? OR b.estado=?)")
            params.extend([val, estado_map.get(val, val)])
        if filtros.get('verificados'):
            filtros_list.append("b.cal_2025 IS NOT NULL AND b.cal_2025 != ''")
        if filtros.get('q'):
            q = filtros['q']
            terms = q.split()
            for term in terms:
                term_like = f"%{term}%"
                filtros_list.append("(b.codigo_patrimonial LIKE ? OR b.cod_barras LIKE ? OR b.denominacion LIKE ? OR b.marca LIKE ? OR b.responsable LIKE ?)")
                params += [term_like, term_like, term_like, term_like, term_like]

        where = f"WHERE {' AND '.join(filtros_list)}" if filtros_list else ""
        
        with db() as con:
            return con.cursor().execute(f"SELECT COUNT(*) FROM bienes b {where}", params).fetchone()[0]

    def obtener_bien(self, bien_id):
        with db() as con:
            row = con.cursor().execute("""
                SELECT b.*, s.nombre as sede_nombre, u.nombre as unidad_nombre 
                FROM bienes b 
                LEFT JOIN sedes s ON b.sede_id = s.id
                LEFT JOIN unidades u ON b.unidad_id = u.id
                WHERE b.id=?
            """, (bien_id,)).fetchone()
            
            if row:
                r = dict(row)
                r['sede'] = r.get('sede_nombre')
                r['dependencia'] = r.get('unidad_nombre')
                return r
            return None

    # ========== BIENES: ESCRITURA ==========
    def crear_bien(self, data: Dict[str, Any], usuario: str) -> int:
        data = {k: self._clean_text(v) if isinstance(v, str) else v for k, v in data.items()}
        
        with db() as con:
            cur = con.cursor()
            
            # Mapeo de campos del formulario a columnas de la BD
            # Formulario: sede (ID), estado, etc.
            # BD: sede_id, estado, etc.
            
            campos_db = {
                'codigo_patrimonial': data.get('codigo_patrimonial'),
                'cod_barras': data.get('codigo_barras'),
                'denominacion': data.get('denominacion'),
                'marca': data.get('marca'),
                'modelo': data.get('modelo'),
                'serie': data.get('serie'),
                'estado': data.get('estado'),
                'sede_id': data.get('sede'), # El select envía el ID
                'ubicacion_texto': data.get('ubicacion_texto'),
                'responsable': data.get('responsable'),
                'observaciones': data.get('observaciones'),
                'fecha_registro': datetime.now().isoformat(timespec="seconds"),
                'verificado': 0
            }
            
            # Filtrar None
            campos_validos = {k: v for k, v in campos_db.items() if v is not None}
            
            placeholders = ','.join(['?'] * len(campos_validos))
            columns = ','.join(campos_validos.keys())
            values = list(campos_validos.values())

            cur.execute(f"INSERT INTO bienes ({columns}) VALUES ({placeholders})", values)
            bien_id = cur.lastrowid
            
            self._historial(cur, bien_id, usuario, "CREAR", data)
            return bien_id

    def actualizar_bien(self, bien_id: int, data: Dict[str, Any], usuario: str):
        data = {k: self._clean_text(v) if isinstance(v, str) else v for k, v in data.items()}
        with db() as con:
            cur = con.cursor()
            
            campos_db = {
                'codigo_patrimonial': data.get('codigo_patrimonial'),
                'cod_barras': data.get('codigo_barras'),
                'denominacion': data.get('denominacion'),
                'marca': data.get('marca'),
                'modelo': data.get('modelo'),
                'serie': data.get('serie'),
                'estado': data.get('estado'),
                'sede_id': data.get('sede'),
                'ubicacion_texto': data.get('ubicacion_texto'),
                'responsable': data.get('responsable'),
                'observaciones': data.get('observaciones')
            }
            
            sets = []
            values = []
            for k, v in campos_db.items():
                if v is not None:
                    sets.append(f"{k}=?")
                    values.append(v)
            
            values.append(bien_id)
            
            if sets:
                cur.execute(f"UPDATE bienes SET {', '.join(sets)} WHERE id=?", values)
                self._historial(cur, bien_id, usuario, "EDITAR", data)

    def _historial(self, cur, bien_id, usuario, accion, detalle):
        # Verificar si la tabla historial existe y tiene las columnas esperadas
        # Por ahora asumimos que sí, basado en el esquema anterior
        try:
            cur.execute("""
                INSERT INTO historial(bien_id, usuario, accion, detalle_json, fecha)
                VALUES(?,?,?,?,?)
            """, (bien_id, usuario, accion, json.dumps(detalle, ensure_ascii=False), datetime.now().isoformat(timespec="seconds")))
        except:
            pass # Ignorar error de historial si la tabla no está lista

    def obtener_sedes(self):
        """Devuelve lista de tuplas (id, nombre) excluyendo las no deseadas"""
        with db() as con:
            query = """
                SELECT id, nombre FROM sedes 
                WHERE nombre != 'Distrito Fiscal del Callao' 
                AND nombre NOT LIKE 'Tipo SIGA%' 
                ORDER BY nombre
            """
            return con.cursor().execute(query).fetchall()

    def obtener_unidades(self):
        """Devuelve lista de tuplas (id, nombre) para dependencias"""
        with db() as con:
            query = """
                SELECT id, nombre FROM unidades 
                WHERE nombre NOT LIKE '%iscal%enal%' 
                AND nombre NOT LIKE '%oficina%administrativa%'
                ORDER BY nombre
            """
            return con.cursor().execute(query).fetchall()

    def obtener_usuarios_app(self):
        """Devuelve lista de usuarios de la app"""
        with db() as con:
            return con.cursor().execute("SELECT username, nombre, rol, activo FROM usuarios_app ORDER BY nombre").fetchall()
