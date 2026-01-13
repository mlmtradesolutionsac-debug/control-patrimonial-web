"""
Repositorio de datos usando SQLAlchemy ORM

Este módulo proporciona todas las operaciones de BD usando SQLAlchemy ORM.
Reemplaza gradualmente a app.models.Repo (que sigue siendo funcional en transición).

Características:
- Prevención automática de SQL injection
- Relaciones automáticas entre modelos
- Transacciones seguras
- Validaciones en BD
"""

from app.models_sqlalchemy import db, Bien, Sede, Unidad, Usuario, UsuarioApp, Historial, sha256, hash_password, verify_password
from app.utils import log_action
from datetime import datetime
from typing import List, Dict, Optional, Tuple
from sqlalchemy import func, or_, and_
import json
from pytz import timezone


class RepoSQLAlchemy:
    """
    Repositorio de datos usando SQLAlchemy ORM.

    Este repositorio proporciona los mismos métodos que el Repo original
    pero usando ORM en lugar de SQL raw, lo que lo hace más seguro y mantenible.
    """

    # ==================== AUTENTICACIÓN ====================

    @staticmethod
    def login(usuario: str, password: str) -> Optional[Dict]:
        """
        Autenticar usuario con soporte para bcrypt y SHA-256 (legacy).

        Busca en:
        1. Tabla usuarios (admin)
        2. Tabla usuarios_app (operadores)

        Soporta:
        - Bcrypt (nuevo estándar)
        - SHA-256 (compatibilidad con datos antiguos)

        Retorna diccionario con datos del usuario o None.
        """
        # Buscar en usuarios (admin)
        user = Usuario.query.filter_by(usuario=usuario).first()

        if user:
            # Verificar contraseña: primero bcrypt, luego SHA-256 (legacy)
            if verify_password(password, user.password) or user.password == sha256(password):
                # Si es SHA-256, migrar a bcrypt en próximo login
                if user.password == sha256(password) and not user.password.startswith('$2'):
                    # Rehashear con bcrypt (será migrado en próximo login)
                    user.password = hash_password(password)
                    db.session.commit()

                return {
                    'username': user.usuario,
                    'nombre': user.nombre,
                    'rol': user.rol,
                    'is_admin': True
                }

        # Buscar en usuarios_app
        user_app = UsuarioApp.query.filter_by(username=usuario, activo=1).first()

        if user_app:
            # Verificar contraseña: primero bcrypt, luego SHA-256 (legacy)
            if verify_password(password, user_app.password_hash) or user_app.password_hash == sha256(password):
                # Si es SHA-256, migrar a bcrypt
                if user_app.password_hash == sha256(password) and not user_app.password_hash.startswith('$2'):
                    # Rehashear con bcrypt
                    user_app.password_hash = hash_password(password)
                    db.session.commit()

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
    def obtener_bien_por_codigo(codigo: str) -> Optional[Dict]:
        """Obtener un bien por Código Patrimonial"""
        if not codigo:
            return None
        bien = Bien.query.filter_by(codigo_patrimonial=codigo).first()
        return bien.to_dict() if bien else None

    @staticmethod
    def listar_bienes(filtros: Dict = None, limit: int = 50, offset: int = 0) -> List[Dict]:
        """
        Listar bienes con filtros y paginación.

        Filtros disponibles:
        - sede: ID de sede
        - dependencia: ID de unidad
        - estado: Código ('b','r','m') o nombre ('Bueno','Regular','Malo')
        - verificacion: Estado de verificación ('', 'verified', 'not_verified')
          * '': Mostrar todos (sin filtro)
          * 'verified': Solo bienes verificados (con CAL 2025)
          * 'not_verified': Solo bienes no verificados (sin CAL 2025)
        - q: Búsqueda por texto en múltiples campos
        """
        if filtros is None:
            filtros = {}

        query = Bien.query

        # Agregar JOINs si hay búsqueda por texto en sedes/unidades
        # Esto previene cartesian product warning
        has_search = filtros.get('q')
        if has_search:
            query = query.outerjoin(Sede).outerjoin(Unidad)

        # Aplicar filtros
        if filtros.get('sede'):
            try:
                sede_id = int(filtros['sede'])
                query = query.filter_by(sede_id=sede_id)
            except (ValueError, TypeError):
                pass

        if filtros.get('dependencia'):
            try:
                unit_id = int(filtros['dependencia'])
                query = query.filter_by(unidad_id=unit_id)
            except (ValueError, TypeError):
                pass

        if filtros.get('estado'):
            estado_map = {'Bueno': 'b', 'Regular': 'r', 'Malo': 'm'}
            estado_val = filtros['estado']
            estado_code = estado_map.get(estado_val, estado_val)
            query = query.filter_by(estado=estado_code)

        if filtros.get('inventariador'):
            # Filtrar por usuario del historial (quien editó el bien)
            query = query.join(Historial).filter(Historial.usuario == filtros['inventariador']).distinct()

        # Filtro de verificación (tres opciones: '', 'verified', 'not_verified')
        verificacion = filtros.get('verificacion', '')
        if verificacion == 'verified':
            # Mostrar solo bienes verificados (con CAL 2025)
            try:
                query = query.filter(
                    and_(
                        Bien.cal_2025.isnot(None),
                        Bien.cal_2025 != '',
                        Bien.cal_2025 != ' ',
                        Bien.cal_2025 != '0'
                    )
                )
            except Exception as e:
                # Si hay error en el filtro, ignorar y continuar
                pass
        elif verificacion == 'not_verified':
            # Mostrar solo bienes NO verificados (sin CAL 2025)
            try:
                query = query.filter(
                    or_(
                        Bien.cal_2025.is_(None),
                        Bien.cal_2025 == '',
                        Bien.cal_2025 == ' ',
                        Bien.cal_2025 == '0'
                    )
                )
            except Exception as e:
                # Si hay error en el filtro, ignorar y continuar
                pass
        # Si verificacion == '', no aplicar ningún filtro (mostrar todos)

        if has_search:
            q = filtros['q'].strip()
            if q:
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

        # Ordenar y paginar - usar distinct para evitar duplicados por JOINs
        if has_search:
            query = query.distinct()
        # Ordenar por fecha más reciente primero (bienes recién creados/editados aparecen primero)
        bienes = query.order_by(Bien.fecha_registro.desc()).limit(limit).offset(offset).all()
        return [bien.to_dict() for bien in bienes]

    @staticmethod
    def contar_bienes(filtros: Dict = None) -> int:
        """Contar bienes con filtros"""
        if filtros is None:
            filtros = {}

        query = Bien.query

        # Agregar JOINs si hay búsqueda por texto
        # Esto previene cartesian product warning
        has_search = filtros.get('q')
        if has_search:
            query = query.outerjoin(Sede).outerjoin(Unidad)

        if filtros.get('sede'):
            try:
                sede_id = int(filtros['sede'])
                query = query.filter_by(sede_id=sede_id)
            except (ValueError, TypeError):
                pass

        if filtros.get('dependencia'):
            try:
                unit_id = int(filtros['dependencia'])
                query = query.filter_by(unidad_id=unit_id)
            except (ValueError, TypeError):
                pass

        if filtros.get('estado'):
            estado_map = {'Bueno': 'b', 'Regular': 'r', 'Malo': 'm'}
            estado_val = filtros['estado']
            estado_code = estado_map.get(estado_val, estado_val)
            query = query.filter_by(estado=estado_code)

        if filtros.get('inventariador'):
            # Filtrar por usuario del historial (quien editó el bien)
            query = query.join(Historial).filter(Historial.usuario == filtros['inventariador']).distinct()

        # Filtro de verificación (tres opciones: '', 'verified', 'not_verified')
        verificacion = filtros.get('verificacion', '')
        if verificacion == 'verified':
            # Mostrar solo bienes verificados (con CAL 2025)
            try:
                query = query.filter(
                    and_(
                        Bien.cal_2025.isnot(None),
                        Bien.cal_2025 != '',
                        Bien.cal_2025 != ' ',
                        Bien.cal_2025 != '0'
                    )
                )
            except Exception as e:
                # Si hay error en el filtro, ignorar y continuar
                pass
        elif verificacion == 'not_verified':
            # Mostrar solo bienes NO verificados (sin CAL 2025)
            try:
                query = query.filter(
                    or_(
                        Bien.cal_2025.is_(None),
                        Bien.cal_2025 == '',
                        Bien.cal_2025 == ' ',
                        Bien.cal_2025 == '0'
                    )
                )
            except Exception as e:
                # Si hay error en el filtro, ignorar y continuar
                pass
        # Si verificacion == '', no aplicar ningún filtro (mostrar todos)

        if has_search:
            q = filtros['q'].strip()
            if q:
                terms = q.split()
                for term in terms:
                    term_pattern = f"%{term}%"
                    query = query.filter(
                        or_(
                            Bien.codigo_patrimonial.ilike(term_pattern),
                            Bien.cod_barras.ilike(term_pattern),
                            Bien.denominacion.ilike(term_pattern),
                            Sede.nombre.ilike(term_pattern),
                            Unidad.nombre.ilike(term_pattern)
                        )
                    )

        # Usar distinct para contar sin duplicados por JOINs
        if has_search:
            return query.distinct().count()
        return query.count()

    @staticmethod
    def contar_bienes_con_cal_2025(filtros: Dict = None) -> int:
        """Contar bienes con CAL 2025 aplicando los mismos filtros"""
        try:
            if filtros is None:
                filtros = {}

            # Usar la misma lógica que contar_bienes pero agregando el filtro de CAL 2025
            query = Bien.query

            # Agregar JOINs si hay búsqueda por texto
            has_search = filtros.get('q')
            if has_search:
                query = query.outerjoin(Sede).outerjoin(Unidad)

            if filtros.get('sede'):
                try:
                    sede_id = int(filtros['sede'])
                    query = query.filter_by(sede_id=sede_id)
                except (ValueError, TypeError):
                    pass

            if filtros.get('dependencia'):
                try:
                    unit_id = int(filtros['dependencia'])
                    query = query.filter_by(unidad_id=unit_id)
                except (ValueError, TypeError):
                    pass

            if filtros.get('estado'):
                estado_map = {'Bueno': 'b', 'Regular': 'r', 'Malo': 'm'}
                estado_val = filtros['estado']
                estado_code = estado_map.get(estado_val, estado_val)
                query = query.filter_by(estado=estado_code)

            if filtros.get('inventariador'):
                # Filtrar por usuario del historial (quien editó el bien)
                try:
                    query = query.join(Historial).filter(Historial.usuario == filtros['inventariador']).distinct()
                except Exception:
                    # Si hay error en el JOIN, ignorar este filtro
                    pass

            if has_search:
                q = filtros['q'].strip()
                if q:
                    terms = q.split()
                    for term in terms:
                        term_pattern = f"%{term}%"
                        query = query.filter(
                            or_(
                                Bien.codigo_patrimonial.ilike(term_pattern),
                                Bien.cod_barras.ilike(term_pattern),
                                Bien.denominacion.ilike(term_pattern),
                                Sede.nombre.ilike(term_pattern),
                                Unidad.nombre.ilike(term_pattern)
                            )
                        )

            # FILTRO CLAVE: Solo bienes con CAL 2025
            query = query.filter(
                and_(
                    Bien.cal_2025.isnot(None),
                    Bien.cal_2025 != '',
                    Bien.cal_2025 != ' ',
                    Bien.cal_2025 != '0'
                )
            )

            # Usar distinct para contar sin duplicados por JOINs
            if has_search or filtros.get('inventariador'):
                return query.distinct().count()
            return query.count()
        except Exception as e:
            # Si hay cualquier error, retornar 0 en lugar de fallar
            import logging
            logging.error(f"Error en contar_bienes_con_cal_2025: {str(e)}")
            return 0

    # ==================== BIENES - ESCRITURA ====================

    @staticmethod
    def crear_bien(data: Dict, usuario: str) -> int:
        """
        Crear un nuevo bien.

        Argumentos:
        - data: Diccionario con datos del bien
        - usuario: Username del usuario que crea

        Retorna: ID del bien creado

        Raises: ValueError si hay error de validación (ej: código duplicado)
        """
        # Helper para limpiar valores vacíos y extraer números para CAL
        def clean(val):
            if not val:
                return None
            val_str = str(val).strip()
            if not val_str or val_str == '0':
                return None
            # Remover prefijo "CAL-" o "CAL'" si existe (para código de barras CAL)
            if val_str.startswith("CAL-"):
                val_str = val_str.replace("CAL-", "", 1).strip()
            elif val_str.startswith("CAL'"):
                val_str = val_str.replace("CAL'", "", 1).strip()

            # Extraer solo dígitos para campos numéricos
            import re
            digits_only = re.sub(r'[^\d]', '', val_str)
            if digits_only and digits_only != '0':
                return digits_only  # Retornar como STRING (para evitar problemas de visualización)
            return None

        # Helper para convertir strings vacíos a None (para evitar unique constraint violations)
        def to_null(val):
            if val is None or val == '' or val == '0':
                return None
            val_str = str(val).strip()
            if not val_str or val_str == '0':
                return None
            return val_str

        # Helper para convertir a mayúsculas (para campos como responsable)
        def to_upper(val):
            result = to_null(val)
            if result:
                return result.upper()
            return result

        # Generar código patrimonial si no se proporciona
        codigo_patrimonial = to_null(data.get('codigo_patrimonial'))
        if not codigo_patrimonial:
            # Generar código único basado en timestamp y aleatorio
            from datetime import datetime
            import random
            timestamp = datetime.now().strftime("%Y%m%d%H%M%S")
            random_code = random.randint(100000, 999999)
            codigo_patrimonial = f"S/C-{timestamp}-{random_code}"

        # Generar denominación si no se proporciona
        denominacion = to_null(data.get('denominacion'))
        if not denominacion:
            # Usar sede y dependencia como denominación temporal
            try:
                sede_id = int(data.get('sede')) if data.get('sede') else None
                unidad_id = int(data.get('dependencia')) if data.get('dependencia') else None

                sede_nombre = ""
                unidad_nombre = ""

                if sede_id:
                    sede = Sede.query.get(sede_id)
                    if sede:
                        sede_nombre = sede.nombre

                if unidad_id:
                    unidad = Unidad.query.get(unidad_id)
                    if unidad:
                        unidad_nombre = unidad.nombre

                if sede_nombre and unidad_nombre:
                    denominacion = f"{sede_nombre} - {unidad_nombre}"
                elif sede_nombre:
                    denominacion = sede_nombre
                elif unidad_nombre:
                    denominacion = unidad_nombre
                else:
                    denominacion = "SIN DEFINIR"
            except:
                denominacion = "SIN DEFINIR"

        bien = Bien(
            codigo_patrimonial=codigo_patrimonial,
            cod_barras=to_null(data.get('cod_barras')),
            denominacion=denominacion,
            descripcion=to_null(data.get('descripcion')),
            marca=to_null(data.get('marca')),
            modelo=to_null(data.get('modelo')),
            serie=to_null(data.get('serie')),
            estado=to_null(data.get('estado')) or 'b',  # Bueno por defecto
            sede_id=int(data.get('sede')) if data.get('sede') else None,
            unidad_id=int(data.get('dependencia')) if data.get('dependencia') else None,
            ubicacion_texto=to_null(data.get('ubicacion_texto')),
            responsable=to_upper(data.get('responsable')),
            observaciones=to_null(data.get('observaciones')),
            usuario_registro=usuario,
            fecha_registro=datetime.now(),
            verificado=0,
            cal_2020=clean(data.get('cal_2020')),
            cal_2021=clean(data.get('cal_2021')),
            cal_2022=clean(data.get('cal_2022')),
            cal_2023=clean(data.get('cal_2023')),
            cal_2024=clean(data.get('cal_2024')),
            cal_2025=clean(data.get('cal_2025'))
        )

        try:
            db.session.add(bien)
            db.session.flush()  # Obtener ID antes de commit
            bien_id = bien.id

            # Registrar en historial (solo campos relevantes)
            datos_historial = {
                'codigo_patrimonial': data.get('codigo_patrimonial'),
                'denominacion': data.get('denominacion'),
                'sede': data.get('sede'),
                'dependencia': data.get('dependencia'),
                'estado': data.get('estado'),
                'marca': data.get('marca'),
                'modelo': data.get('modelo'),
                'serie': data.get('serie'),
                'responsable': data.get('responsable'),
                'cal_2025': data.get('cal_2025')
            }
            RepoSQLAlchemy._registrar_historial(bien_id, usuario, 'CREAR', datos_historial)

            db.session.commit()
            return bien_id
        except Exception as e:
            db.session.rollback()
            error_msg = str(e).lower()

            # Capturar errores de clave duplicada - pero solo para códigos reales (no placeholders)
            if 'duplicate' in error_msg or 'unique' in error_msg:
                cod_patrimonial = data.get('codigo_patrimonial', '').strip() if data.get('codigo_patrimonial') else ''
                # Si el código es vacío, "0", o una variante de "sin código", no es un error real
                # ya que se debe haber convertido a NULL en la BD
                if cod_patrimonial and cod_patrimonial != '0' and cod_patrimonial.upper() not in ['S/C', 'N/A', 'DESCONOCIDO']:
                    raise ValueError(f"El código patrimonial '{cod_patrimonial}' ya existe en la base de datos. Usa un código diferente.")
                # Si es un placeholder, re-lanzar el error original para debug
                raise

            # Re-lanzar otros errores
            raise

    @staticmethod
    def actualizar_bien(bien_id: int, data: Dict, usuario: str) -> bool:
        """
        Actualizar un bien existente.

        Argumentos:
        - bien_id: ID del bien a actualizar
        - data: Diccionario con campos a actualizar
        - usuario: Username del usuario que actualiza

        Retorna: True si se actualizó, False si no existe

        Raises: Exception si hay error en la BD (constraint violations, etc.)
        """
        try:
            print(f"DEBUG REPO - Intentando actualizar bien ID: {bien_id}") # DEBUG
            bien = Bien.query.get(bien_id)
            if not bien:
                print(f"DEBUG REPO - Bien ID {bien_id} no encontrado en query") # DEBUG
                return False

            # CAPTURAR VALORES ANTIGUOS ANTES DE CUALQUIER CAMBIO (para bitácora)
            valores_antiguos = {
                'codigo_patrimonial': bien.codigo_patrimonial,
                'denominacion': bien.denominacion,
                'estado': bien.estado,
                'sede': str(bien.sede_id) if bien.sede_id else None,
                'dependencia': str(bien.unidad_id) if bien.unidad_id else None,
                'marca': bien.marca,
                'modelo': bien.modelo,
                'serie': bien.serie,
                'responsable': bien.responsable,
                'cal_2020': bien.cal_2020,
                'cal_2021': bien.cal_2021,
                'cal_2022': bien.cal_2022,
                'cal_2023': bien.cal_2023,
                'cal_2024': bien.cal_2024,
                'cal_2025': bien.cal_2025
            }

            # Helper para limpiar valores vacíos y extraer números para CAL
            def clean(val):
                if not val:
                    return None
                val_str = str(val).strip()
                if not val_str:
                    return None
                # Remover prefijo "CAL-" o "CAL'" si existe (para código de barras CAL)
                if val_str.startswith("CAL-"):
                    val_str = val_str.replace("CAL-", "", 1).strip()
                elif val_str.startswith("CAL'"):
                    val_str = val_str.replace("CAL'", "", 1).strip()

                # Extraer solo dígitos para campos numéricos
                import re
                digits_only = re.sub(r'[^\d]', '', val_str)
                if digits_only:
                    return digits_only  # Retornar como STRING (para evitar problemas de visualización)
                return None

            # Actualizar solo campos presentes en data (ignorar vacíos y None)
            if data.get('codigo_patrimonial') and str(data.get('codigo_patrimonial')).strip() != 'None':
                bien.codigo_patrimonial = data['codigo_patrimonial']
            if data.get('cod_barras') and str(data.get('cod_barras')).strip() != 'None':
                bien.cod_barras = data['cod_barras']
            if data.get('denominacion') and str(data.get('denominacion')).strip() != 'None':
                bien.denominacion = data['denominacion']
            if data.get('descripcion') and str(data.get('descripcion')).strip() != 'None':
                bien.descripcion = data['descripcion']
            if data.get('marca') and str(data.get('marca')).strip() != 'None':
                bien.marca = data['marca']
            if data.get('modelo') and str(data.get('modelo')).strip() != 'None':
                bien.modelo = data['modelo']
            if data.get('serie') and str(data.get('serie')).strip() != 'None':
                bien.serie = data['serie']
            if data.get('estado') and str(data.get('estado')).strip() != 'None':
                bien.estado = data['estado']
            if data.get('sede') and str(data.get('sede')).strip() != 'None':
                bien.sede_id = int(data['sede'])
            if data.get('dependencia') and str(data.get('dependencia')).strip() != 'None':
                bien.unidad_id = int(data['dependencia'])
            if data.get('ubicacion_texto') and str(data.get('ubicacion_texto')).strip() != 'None':
                bien.ubicacion_texto = data['ubicacion_texto']
            if data.get('responsable') and str(data.get('responsable')).strip() != 'None':
                bien.responsable = str(data['responsable']).strip().upper()
            if data.get('observaciones') and str(data.get('observaciones')).strip() != 'None':
                bien.observaciones = data['observaciones']

            # Actualizar campos CAL
            if 'cal_2020' in data: bien.cal_2020 = clean(data['cal_2020'])
            if 'cal_2021' in data: bien.cal_2021 = clean(data['cal_2021'])
            if 'cal_2022' in data: bien.cal_2022 = clean(data['cal_2022'])
            if 'cal_2023' in data: bien.cal_2023 = clean(data['cal_2023'])
            if 'cal_2024' in data: bien.cal_2024 = clean(data['cal_2024'])
            if 'cal_2025' in data: bien.cal_2025 = clean(data['cal_2025'])

            # Actualizar verificado si hay etiqueta 2025
            if bien.cal_2025:
                bien.verificado = 1

            db.session.commit()
            print(f"DEBUG REPO - Bien ID {bien_id} actualizado exitosamente") # DEBUG

            # GENERAR BITÁCORA DE AUDITORÍA: Registrar SOLO los campos que realmente cambiaron
            valores_nuevos = {
                'codigo_patrimonial': bien.codigo_patrimonial,
                'denominacion': bien.denominacion,
                'estado': bien.estado,
                'sede': str(bien.sede_id) if bien.sede_id else None,
                'dependencia': str(bien.unidad_id) if bien.unidad_id else None,
                'marca': bien.marca,
                'modelo': bien.modelo,
                'serie': bien.serie,
                'responsable': bien.responsable,
                'cal_2020': bien.cal_2020,
                'cal_2021': bien.cal_2021,
                'cal_2022': bien.cal_2022,
                'cal_2023': bien.cal_2023,
                'cal_2024': bien.cal_2024,
                'cal_2025': bien.cal_2025
            }

            # Comparar y crear bitácora con antes/después
            cambios = {}
            for campo in valores_nuevos.keys():
                valor_antiguo = valores_antiguos.get(campo)
                valor_nuevo = valores_nuevos.get(campo)
                # Solo registrar si hubo cambio
                if valor_antiguo != valor_nuevo:
                    cambios[campo] = {
                        'anterior': valor_antiguo,
                        'nuevo': valor_nuevo
                    }

            # Si hay cambios, registrar en historial
            if cambios:
                RepoSQLAlchemy._registrar_historial(bien_id, usuario, 'EDITAR', cambios)

            return True
        except Exception as e:
            db.session.rollback()
            print(f"ERROR REPO - Error al actualizar bien ID {bien_id}: {str(e)}")
            raise

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
        """Total de bienes en BD"""
        return Bien.query.count()

    @staticmethod
    def obtener_progreso_cal_2025() -> Dict:
        """Progreso de inventario CAL 2025"""
        total = Bien.query.count()
        inventariados = Bien.query.filter(
            Bien.cal_2025.isnot(None),
            Bien.cal_2025 != '',
            Bien.cal_2025 != '0'
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
        from sqlalchemy import case
        resultados = db.session.query(
            Sede.id,
            Sede.nombre,
            func.count(Bien.id).label('total'),
            func.sum(
                case(
                    (
                        and_(
                            Bien.cal_2025.isnot(None),
                            Bien.cal_2025 != '',
                            Bien.cal_2025 != '0'
                        ),
                        1
                    ),
                    else_=0
                )
            ).label('inventariados')
        ).outerjoin(Bien).group_by(Sede.id, Sede.nombre).filter(
            Sede.nombre != 'Distrito Fiscal del Callao',
            ~Sede.nombre.like('Tipo SIGA%')
        ).order_by(
            func.sum(
                case(
                    (
                        and_(
                            Bien.cal_2025.isnot(None),
                            Bien.cal_2025 != '',
                            Bien.cal_2025 != '0'
                        ),
                        1
                    ),
                    else_=0
                )
            ).desc()
        ).all()

        resultado = []
        for sede_id, nombre, total, inventariados in resultados:
            inventariados = inventariados or 0
            total = total or 0
            porcentaje = (inventariados / total * 100) if total > 0 else 0
            resultado.append({
                "sede_nombre": nombre,
                "total": total,
                "inventariados": inventariados,
                "porcentaje": round(porcentaje, 2)
            })

        return resultado

    @staticmethod
    def obtener_progreso_por_dependencia() -> List[Dict]:
        """Progreso por dependencia/unidad"""
        from sqlalchemy import case
        resultados = db.session.query(
            Unidad.id,
            Unidad.nombre,
            func.count(Bien.id).label('total'),
            func.sum(
                case(
                    (
                        and_(
                            Bien.cal_2025.isnot(None),
                            Bien.cal_2025 != '',
                            Bien.cal_2025 != '0'
                        ),
                        1
                    ),
                    else_=0
                )
            ).label('inventariados')
        ).outerjoin(Bien).group_by(Unidad.id, Unidad.nombre).order_by(
            func.sum(
                case(
                    (
                        and_(
                            Bien.cal_2025.isnot(None),
                            Bien.cal_2025 != '',
                            Bien.cal_2025 != '0'
                        ),
                        1
                    ),
                    else_=0
                )
            ).desc()
        ).all()

        resultado = []
        for unidad_id, nombre, total, inventariados in resultados:
            inventariados = inventariados or 0
            total = total or 0
            porcentaje = (inventariados / total * 100) if total > 0 else 0
            resultado.append({
                "dependencia_nombre": nombre,
                "total": total,
                "inventariados": inventariados,
                "porcentaje": round(porcentaje, 2)
            })

        return resultado

    @staticmethod
    def obtener_actividad_por_inventariador(limite: int = 1000) -> List[Dict]:
        """
        Todos los inventariadores incluyendo usuarios con 0 progreso.
        Combina usuarios activos con su historial de verificaciones.
        """
        # Validar y limitar
        try:
            limite = int(limite)
        except (ValueError, TypeError):
            limite = 1000
        limite = max(1, min(limite, 10000))

        # 1. Calcular total de bienes verificados global
        total_inv = Bien.query.filter(
            Bien.cal_2025.isnot(None),
            Bien.cal_2025 != '',
            Bien.cal_2025 != '0'
        ).count()

        # 2. Obtener actividad real desde historial (Quién ha trabajado)
        actividad_query = db.session.query(
            Historial.usuario,
            func.count(func.distinct(Bien.id)).label('cantidad')
        ).join(
            Bien, Bien.id == Historial.bien_id
        ).filter(
            Bien.cal_2025.isnot(None),
            Bien.cal_2025 != '',
            Bien.cal_2025 != '0',
            Historial.accion == 'EDITAR',
            Historial.usuario.isnot(None)
        ).group_by(Historial.usuario).all()
        
        # Diccionario {username: cantidad}
        actividad_map = {row.usuario: row.cantidad for row in actividad_query}

        # 3. Obtener todos los usuarios activos de la App para asegurar que aparezcan
        usuarios_app = UsuarioApp.query.filter_by(activo=1).all()
        
        lista_final = []
        
        # Agregar usuarios de la app (con su cantidad real o 0)
        for user in usuarios_app:
            cant = actividad_map.get(user.username, 0)
            lista_final.append({
                "usuario": user.nombre,  # Nombre real (ej: Juan Pérez)
                "username_real": user.username,
                "cantidad": cant,
                "porcentaje": round((cant / total_inv * 100) if total_inv > 0 else 0, 2)
            })
            # Remover del mapa para saber quiénes faltan (ej: admins)
            if user.username in actividad_map:
                del actividad_map[user.username]
                
        # Agregar usuarios restantes que tienen actividad pero no están en usuarios_app (ej: admin)
        for username, cant in actividad_map.items():
            # Filtro Nuclear de Seguridad
            if 'ADMIN' in username.upper() or 'MIGRACION' in username.upper():
                continue
            lista_final.append({
                "usuario": username, # Username directo
                "username_real": username,
                "cantidad": cant,
                "porcentaje": round((cant / total_inv * 100) if total_inv > 0 else 0, 2)
            })
            
        # 4. Ordenar: Primero por cantidad (descendente), luego alfabético
        lista_final.sort(key=lambda x: (-x['cantidad'], x['usuario']))

        return lista_final[:limite]

    @staticmethod
    def obtener_distribucion_estado() -> Dict[str, int]:
        """Distribución de estados (solo bienes verificados en CAL 2025)"""
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
        """Distribución de estados (todos los bienes)"""
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

    @staticmethod
    def obtener_analisis_productividad_inventariadores() -> Dict:
        """Obtener análisis detallado de productividad por inventariador"""
        from datetime import datetime

        # Total de bienes verificados (con CAL 2025)
        total_verificados = db.session.query(func.count(Bien.id)).filter(
            Bien.cal_2025.isnot(None)
        ).scalar() or 0

        # Total de bienes en BD
        total_bienes = db.session.query(func.count(Bien.id)).scalar() or 0

        # Obtener TODOS los usuarios activos del sistema (operadores, inventariadores, etc)
        inventariadores = db.session.query(UsuarioApp).filter(
            UsuarioApp.activo == 1,
            UsuarioApp.username.notin_(['admin', 'MIGRACION_SISTEMA'])
        ).order_by(UsuarioApp.nombre).all()

        analisis = {
            'total_verificados': total_verificados,
            'total_bienes': total_bienes,
            'progreso_general': round((total_verificados / total_bienes * 100) if total_bienes > 0 else 0, 2),
            'inventariadores': [],
            'fecha_reporte': datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        }

        # Analizar cada inventariador
        for inv in inventariadores:
            # Filtro de seguridad V2 (Nuclear): Normalizar y buscar subcadena
            u_name = (inv.username or '').upper().strip()
            u_real_name = (inv.nombre or '').upper().strip()
            
            if 'ADMIN' in u_name or 'MIGRACION' in u_name:
                continue
                
            if 'MIGRACION' in u_real_name:
                continue
            # Bienes verificados por este inventariador (Vía Historial)
            bienes_verificados = db.session.query(func.count(func.distinct(Bien.id))).join(
                Historial, Historial.bien_id == Bien.id
            ).filter(
                Historial.usuario == inv.username,
                Historial.accion == 'EDITAR',
                Bien.cal_2025.isnot(None),
                Bien.cal_2025 != ''
            ).scalar() or 0

            # Total de bienes registrados por este inventariador
            total_registrados = db.session.query(func.count(Bien.id)).filter(
                Bien.usuario_registro == inv.username
            ).scalar() or 0

            # Fecha de última verificación (Vía Historial)
            ultima_verificacion = db.session.query(func.max(Historial.fecha)).join(
                Bien, Bien.id == Historial.bien_id
            ).filter(
                Historial.usuario == inv.username,
                Historial.accion == 'EDITAR',
                Bien.cal_2025.isnot(None)
            ).scalar()

            # Distribución de estados (solo verificados)
            estados = db.session.query(
                Bien.estado,
                func.count(Bien.id).label('cantidad')
            ).filter(
                Bien.usuario_registro == inv.username,
                Bien.cal_2025.isnot(None)
            ).group_by(Bien.estado).all()

            distribucion_estado = {}
            for estado, cantidad in estados:
                estado_label = {'b': 'Bueno', 'r': 'Regular', 'm': 'Malo'}.get(estado, estado or 'Sin Especificar')
                distribucion_estado[estado_label] = cantidad

            # Progreso individual
            progreso_inv = round((bienes_verificados / total_registrados * 100) if total_registrados > 0 else 0, 2)

            # Porcentaje del total general
            porcentaje_del_total = round((bienes_verificados / total_verificados * 100) if total_verificados > 0 else 0, 2)

            inventariadores_data = {
                'username': inv.username,
                'nombre': inv.nombre,
                'rol': inv.rol,
                'bienes_verificados': bienes_verificados,
                'total_registrados': total_registrados,
                'progreso_personal': progreso_inv,
                'porcentaje_del_total': porcentaje_del_total,
                'ultima_verificacion': ultima_verificacion.strftime('%Y-%m-%d %H:%M:%S') if ultima_verificacion else 'Sin verificaciones',
                'distribucion_estado': distribucion_estado
            }

            analisis['inventariadores'].append(inventariadores_data)

        # Ordenar por cantidad de verificaciones (descendente)
        analisis['inventariadores'].sort(key=lambda x: x['bienes_verificados'], reverse=True)

        return analisis

    # ==================== CATÁLOGOS ====================

    @staticmethod
    def obtener_sedes() -> List[Tuple]:
        """Obtener lista de sedes (excluir Distrito y tipos SIGA)"""
        return db.session.query(Sede.id, Sede.nombre).filter(
            Sede.nombre != 'Distrito Fiscal del Callao',
            ~Sede.nombre.like('Tipo SIGA%')
        ).order_by(Sede.nombre).all()

    @staticmethod
    def obtener_unidades() -> List[Tuple]:
        """Obtener lista de unidades/dependencias"""
        return db.session.query(Unidad.id, Unidad.nombre).filter(
            ~Unidad.nombre.like('%iscal%enal%'),
            ~Unidad.nombre.like('%oficina%administrativa%')
        ).order_by(Unidad.nombre).all()

    @staticmethod
    def obtener_responsables() -> List[str]:
        """Obtener lista de responsables únicos y no vacíos, ordenados alfabéticamente"""
        responsables = db.session.query(Bien.responsable).filter(
            Bien.responsable != None,
            Bien.responsable != ''
        ).distinct().order_by(Bien.responsable).all()

        # Convertir de tuplas a strings y eliminar vacíos
        return [r[0].strip() for r in responsables if r[0] and r[0].strip()]

    @staticmethod
    def obtener_usuarios_app() -> List[Tuple]:
        """Obtener usuarios de app"""
        return db.session.query(
            UsuarioApp.username,
            UsuarioApp.nombre,
            UsuarioApp.rol,
            UsuarioApp.activo
        ).order_by(UsuarioApp.nombre).all()

    @staticmethod
    def obtener_inventariadores_activos() -> List[Tuple]:
        """Obtener usuarios que han editado/verificado bienes (por historial)"""
        from sqlalchemy import func
        # Obtener usuarios DISTINTOS del historial que hayan editado bienes
        usuarios_activos = db.session.query(
            func.distinct(Historial.usuario)
        ).filter(
            Historial.usuario.isnot(None),
            Historial.usuario != '',
            Historial.usuario != 'admin',
            Historial.usuario != 'MIGRACION_SISTEMA'
        ).order_by(Historial.usuario).all()

        # Convertir a lista de tuplas (usuario, usuario)
        return [(u[0], u[0]) for u in usuarios_activos]

    @staticmethod
    def obtener_usuario_app(username: str) -> Optional[UsuarioApp]:
        """Obtener un usuario específico por username"""
        return db.session.query(UsuarioApp).filter_by(username=username).first()

    @staticmethod
    def crear_usuario_app(data: Dict, usuario_actual: str) -> str:
        """
        Crear nuevo usuario operador.
        Requiere: username, nombre, rol, password

        Las contraseñas se hashean con bcrypt para máxima seguridad.
        """
        username = data.get('username', '').strip()
        nombre = data.get('nombre', '').strip()
        rol = data.get('rol', 'operador').strip()
        password = data.get('password', '').strip()

        # Validar datos requeridos
        if not username or not nombre or not password:
            raise ValueError("Username, nombre y password son requeridos")

        # Verificar si ya existe
        if db.session.query(UsuarioApp).filter_by(username=username).first():
            raise ValueError(f"El usuario '{username}' ya existe")

        # Crear nuevo usuario con password hasheado con bcrypt
        nuevo_usuario = UsuarioApp(
            username=username,
            nombre=nombre,
            password_hash=hash_password(password),
            rol=rol,
            activo=1
        )

        db.session.add(nuevo_usuario)
        db.session.commit()

        log_action('CREAR_USUARIO', f'Usuario {username} creado por {usuario_actual}')
        return username

    @staticmethod
    def actualizar_usuario_app(username: str, data: Dict, usuario_actual: str) -> bool:
        """
        Actualizar un usuario existente.
        Puede actualizar: nombre, rol, password (opcional), activo
        """
        usuario = db.session.query(UsuarioApp).filter_by(username=username).first()

        if not usuario:
            raise ValueError(f"Usuario '{username}' no encontrado")

        cambios = {}

        if 'nombre' in data and data['nombre']:
            usuario.nombre = data['nombre'].strip()
            cambios['nombre'] = usuario.nombre

        if 'rol' in data and data['rol']:
            usuario.rol = data['rol'].strip()
            cambios['rol'] = usuario.rol

        if 'activo' in data:
            usuario.activo = 1 if data['activo'] else 0
            cambios['activo'] = usuario.activo

        if 'password' in data and data['password']:
            usuario.password_hash = hash_password(data['password'].strip())
            cambios['password'] = '***'  # No logging de password

        if not cambios:
            raise ValueError("No hay cambios para actualizar")

        db.session.commit()
        log_action('ACTUALIZAR_USUARIO', f'Usuario {username} actualizado por {usuario_actual}. Cambios: {cambios}')
        return True

    @staticmethod
    def eliminar_usuario_app(username: str, usuario_actual: str) -> bool:
        """Eliminar un usuario operador"""
        usuario = db.session.query(UsuarioApp).filter_by(username=username).first()

        if not usuario:
            raise ValueError(f"Usuario '{username}' no encontrado")

        db.session.delete(usuario)
        db.session.commit()

        log_action('ELIMINAR_USUARIO', f'Usuario {username} eliminado por {usuario_actual}')
        return True

    @staticmethod
    def resetear_password_usuario(username: str, usuario_actual: str) -> str:
        """
        Resetear password de un usuario a una contraseña temporal.
        Retorna la contraseña temporal generada.

        La contraseña temporal se hashea con bcrypt para máxima seguridad.
        El usuario deberá cambiar esta contraseña en el primer login.
        """
        usuario = db.session.query(UsuarioApp).filter_by(username=username).first()

        if not usuario:
            raise ValueError(f"Usuario '{username}' no encontrado")

        # Generar contraseña temporal (username + "123")
        password_temporal = f"{username}123"
        usuario.password_hash = hash_password(password_temporal)

        db.session.commit()
        log_action('RESETEAR_PASSWORD', f'Password reseteado para usuario {username} por {usuario_actual}')

        return password_temporal

    @staticmethod
    def cambiar_contrasena(username: str, nueva_contrasena: str) -> bool:
        """
        Cambiar la contraseña de un usuario.

        Busca en:
        1. Tabla usuarios (admin)
        2. Tabla usuarios_app (operadores)

        Argumentos:
        - username: Username del usuario
        - nueva_contrasena: Nueva contraseña sin hashear

        Retorna: True si se cambió exitosamente, False si no existe
        """
        # Buscar en usuarios (admin)
        user = Usuario.query.filter_by(usuario=username).first()

        if user:
            user.password = hash_password(nueva_contrasena)
            db.session.commit()
            return True

        # Buscar en usuarios_app (operadores)
        user_app = UsuarioApp.query.filter_by(username=username).first()

        if user_app:
            user_app.password_hash = hash_password(nueva_contrasena)
            db.session.commit()
            return True

        return False

    # ==================== HISTORIAL ====================

    @staticmethod
    def get_historial(bien_id: int) -> List[Dict]:
        """
        Obtener historial de cambios de un bien.

        Args:
            bien_id: ID del bien

        Returns:
            Lista de diccionarios con historial ordenado por fecha descendente
            Las fechas se convierten de UTC a America/Lima
        """
        try:
            historial_records = Historial.query.filter_by(bien_id=bien_id).order_by(Historial.fecha.desc()).all()

            historial_list = []
            lima_tz = timezone('America/Lima')

            for record in historial_records:
                # Convertir fecha de UTC a America/Lima
                fecha_formateada = None
                if record.fecha:
                    try:
                        # Si la fecha es naive (sin zona horaria), asumir que es UTC
                        if record.fecha.tzinfo is None:
                            fecha_utc = timezone('UTC').localize(record.fecha)
                        else:
                            fecha_utc = record.fecha

                        # Convertir a zona horaria local (America/Lima)
                        fecha_lima = fecha_utc.astimezone(lima_tz)
                        fecha_formateada = fecha_lima.strftime('%d/%m/%Y %H:%M:%S')
                    except Exception as e:
                        # Si hay error en conversión, mostrar la fecha original
                        fecha_formateada = record.fecha.strftime('%d/%m/%Y %H:%M:%S')

                historial_list.append({
                    'id': record.id,
                    'bien_id': record.bien_id,
                    'usuario': record.usuario,
                    'accion': record.accion,
                    'detalle_json': record.detalle_json,
                    'fecha': fecha_formateada
                })

            return historial_list
        except Exception as e:
            print(f"Error obteniendo historial: {str(e)}")
            return []

    # ==================== UTILIDADES PRIVADAS ====================

    @staticmethod
    def _registrar_historial(bien_id: int, usuario: str, accion: str, detalle: Dict):
        """
        Registrar cambio en historial.

        No rompe la operación si falla el historial.
        """
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
            db.session.rollback()
    # ==================== FICHAS DE LEVANTAMIENTO ====================

    @staticmethod
    def obtener_fichas_por_bien(codigo_patrimonial: str) -> List:
        """
        Obtener todas las fichas verificadas que contienen un bien específico.

        Args:
            codigo_patrimonial: Código del bien a buscar

        Returns:
            Lista de fichas (solo verificadas) que contienen este bien
        """
        from app.models_sqlalchemy import FichaLevantamiento

        fichas = []
        try:
            todas_fichas = db.session.query(FichaLevantamiento).filter_by(
                estado='VERIFICADA'
            ).all()

            for ficha in todas_fichas:
                bienes = ficha.get_bienes_codigos_list()
                if codigo_patrimonial in bienes:
                    fichas.append(ficha)
        except Exception as e:
            print(f"Error al buscar fichas por bien: {str(e)}")

        return fichas

    @staticmethod
    def obtener_ficha_por_siga(numero_siga: str) -> Optional:
        """Obtener una ficha por su número SIGA"""
        from app.models_sqlalchemy import FichaLevantamiento

        try:
            return db.session.query(FichaLevantamiento).filter_by(
                numero_siga=numero_siga
            ).first()
        except Exception as e:
            print(f"Error al obtener ficha: {str(e)}")
            return None

    @staticmethod
    def obtener_fichas_por_responsable(responsable_name: str) -> List:
        """
        Obtener todas las fichas de un responsable específico (verificadas).

        Args:
            responsable_name: Nombre del responsable

        Returns:
            Lista de fichas verificadas para este responsable
        """
        from app.models_sqlalchemy import FichaLevantamiento

        try:
            return db.session.query(FichaLevantamiento).filter(
                FichaLevantamiento.responsable_name.ilike(f'%{responsable_name}%'),
                FichaLevantamiento.estado == 'VERIFICADA'
            ).order_by(FichaLevantamiento.fecha_creacion.desc()).all()
        except Exception as e:
            print(f"Error al obtener fichas por responsable: {str(e)}")
            return []


# ==================== EXPORTAR ====================
__all__ = ['RepoSQLAlchemy']
