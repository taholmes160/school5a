# app/index_blueprint.py
from flask import Blueprint, render_template

index_bp = Blueprint('index_bp', __name__)

@index_bp.route('/')
def index():
    # Import inside the function to avoid circular import
    from .student_blueprint import student_bp  
    return render_template('index.html')
