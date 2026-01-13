"""Decoradores personalizados para control de permisos"""

from functools import wraps
from flask import abort
from flask_login import current_user

def require_edit_permission(f):
    """Decorador para restringir acceso solo a usuarios con permisos de edición (no visitor)"""
    @wraps(f)
    def decorated_function(*args, **kwargs):
        # Permitir acceso a admins y operadores (no visitor)
        if not current_user.is_authenticated:
            abort(401)  # No autenticado

        # Si es admin, permitir
        if current_user.is_admin:
            return f(*args, **kwargs)

        # Si tiene rol 'visitor', denegar
        if hasattr(current_user, 'rol') and current_user.rol == 'visitor':
            abort(403)  # Prohibido - sin permisos de edición

        # El resto pueden acceder (operadores, supervisores, etc.)
        return f(*args, **kwargs)

    return decorated_function


def is_visitor_user():
    """Verificar si el usuario actual es visitor"""
    if not current_user.is_authenticated:
        return False

    if current_user.is_admin:
        return False

    if hasattr(current_user, 'rol') and current_user.rol == 'visitor':
        return True

    return False


def can_edit():
    """Verificar si el usuario actual puede editar"""
    if not current_user.is_authenticated:
        return False

    if current_user.is_admin:
        return True

    if hasattr(current_user, 'rol') and current_user.rol == 'visitor':
        return False

    # Operadores y otros roles pueden editar
    return True
