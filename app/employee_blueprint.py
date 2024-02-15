from flask import Blueprint, request, redirect, url_for, render_template, flash
from models import db, Employee
from app.forms import EmployeeForm

# Create a Blueprint instance for employees
employee_blueprint = Blueprint('employees', __name__, template_folder='templates')

@employee_blueprint.route('/create', methods=['GET', 'POST'])
def create_employee():
    form = EmployeeForm()
    if form.validate_on_submit():
        new_employee = Employee(
            employee_fname=form.employee_fname.data,
            employee_lname=form.employee_lname.data,
            employee_dept_id=form.employee_dept_id.data,
            employee_title_id=form.employee_title_id.data
        )
        db.session.add(new_employee)
        db.session.commit()
        flash('Employee created successfully!', 'success')
        return redirect(url_for('employees.list_employees'))
    return render_template('create_employee.html', form=form)

@employee_blueprint.route('/')
def list_employees():
    employees = Employee.query.all()
    return render_template('list_employees.html', employees=employees)

@employee_blueprint.route('/update/<int:employee_id>', methods=['GET', 'POST'])
def update_employee(employee_id):
    employee = Employee.query.get_or_404(employee_id)
    form = EmployeeForm(obj=employee)
    if form.validate_on_submit():
        employee.employee_fname = form.employee_fname.data
        employee.employee_lname = form.employee_lname.data
        employee.employee_dept_id = form.employee_dept_id.data
        employee.employee_title_id = form.employee_title_id.data
        db.session.commit()
        flash('Employee updated successfully!', 'success')
        return redirect(url_for('employees.list_employees'))
    return render_template('update_employee.html', form=form, employee_id=employee_id)

@employee_blueprint.route('/delete/<int:employee_id>', methods=['POST'])
def delete_employee(employee_id):
    employee = Employee.query.get_or_404(employee_id)
    db.session.delete(employee)
    db.session.commit()
    flash('Employee deleted successfully!', 'success')
    return redirect(url_for('employees.list_employees'))
