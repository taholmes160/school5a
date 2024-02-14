# app_creator.py

from flask import Flask
from models import db
from flask_wtf.csrf import CSRFProtect

def create_app():
    app = Flask(__name__)
    
    # Configure your app (e.g., database, secret key, etc.)
    app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+mysqlconnector://server:T3t0npack@192.168.1.28/school5?charset=utf8mb4&collation=utf8mb4_general_ci'
    app.config['SECRET_KEY'] = 'developmentsecretkey'
    csrf = CSRFProtect(app)

    # Initialize the SQLAlchemy instance
    db.init_app(app)


    # Define routes and other configurations

    return app, db
