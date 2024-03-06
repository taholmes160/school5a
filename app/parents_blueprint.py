from flask import Blueprint, request, redirect, url_for, render_template, flash
from models import db, Parent, GuardianType
from app.forms import ParentForm, GuardianTypeForm

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

@parents_bp.route('/guardian_type/create', methods=['GET', 'POST'])
def create_guardian_type():
    form = GuardianTypeForm()  # Create an instance of the form
    if form.validate_on_submit():  # Check if the form is submitted and valid
        guardian_type_name = form.guardian_type_name.data
        guardian_type_description = form.guardian_type_description.data
        
        new_guardian_type = GuardianType(guardian_type_name=guardian_type_name, guardian_type_description=guardian_type_description)
        db.session.add(new_guardian_type)
        db.session.commit()
        flash('Guardian type added successfully!', 'success')
        return redirect(url_for('parents.list_guardian_types'))
    
    # Pass the form object to the template
    return render_template('create_guardian_type.html', form=form)

@parents_bp.route('/guardian_types')
def list_guardian_types():
    guardian_types = GuardianType.query.all()
    return render_template('list_guardian_types.html', guardian_types=guardian_types)