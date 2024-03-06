from flask import Blueprint, request, redirect, url_for, render_template
from models import db, Parent
from app.forms import ParentForm

parents_bp = Blueprint('parents', __name__)
# Implement routes for creating, updating, and deleting parents as needed

@parents_bp.route('/create', methods=['GET', 'POST'])
def create_parent():
    form = ParentForm()
    if form.validate_on_submit():
        parent_fname = form.parent_fname.data
        parent_lname = form.parent_lname.data
        parent_email = form.parent_email.data
        parent_password = form.parent_password.data

        new_parent = Parent(parent_fname=parent_fname, parent_lname=parent_lname, parent_email=parent_email, parent_password=parent_password)
        db.session.add(new_parent)
        db.session.commit()

        return redirect(url_for('parents.get_parents'))  # Redirect to the list of parents page after adding a new parent
    
    return render_template('create_parent.html', form=form)  # Pass the form object to the template

@parents_bp.route('/', methods=['GET'])
def get_parents():
    parents = Parent.query.all()  # Fetch all parents from the database
    return render_template('list_parents.html', parents=parents)
