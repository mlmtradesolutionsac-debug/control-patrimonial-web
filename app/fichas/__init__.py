from flask import Blueprint

bp = Blueprint('fichas', __name__)

from app.fichas import routes
