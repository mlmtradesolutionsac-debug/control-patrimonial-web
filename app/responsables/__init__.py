from flask import Blueprint

bp = Blueprint('responsables', __name__, url_prefix='/responsables')

from app.responsables import routes
