# app/forms.py
from flask_wtf import FlaskForm
from wtforms import StringField, IntegerField, SubmitField, SelectField,TextAreaField, PasswordField
from wtforms.validators import DataRequired, Length, Email
from models import Gender, GradeLevel, Department, Title, Employee

class StudentForm(FlaskForm):
    student_fname = StringField('First Name', validators=[DataRequired()])
    student_lname = StringField('Last Name', validators=[DataRequired()])
    student_age = IntegerField('Age', validators=[DataRequired()])
    student_gender_id = SelectField('Gender', coerce=int, validators=[DataRequired()])
    student_level_id = SelectField('Grade', coerce=int, validators=[DataRequired()])
    submit = SubmitField('Submit')

class CourseForm(FlaskForm):
    course_name = StringField('Course Name', validators=[DataRequired()])
    department_id = SelectField('Department', coerce=int, validators=[DataRequired()])
    submit = SubmitField('Create Course')

# forms.py

class DepartmentForm(FlaskForm):
    department_name = StringField('Department Name', validators=[DataRequired()])
    submit = SubmitField('Submit')
    
class TitleForm(FlaskForm):
    title_name = StringField('Title Name', validators=[DataRequired(), Length(max=100)])
    title_description = TextAreaField('Title Description', validators=[Length(max=500)])
    submit = SubmitField('Submit')
    
class EmployeeForm(FlaskForm):
    employee_fname = StringField('First Name', validators=[DataRequired(), Length(max=45)])
    employee_lname = StringField('Last Name', validators=[DataRequired(), Length(max=45)])
    
    # Dynamically populate the choices for department and title
    employee_dept_id = SelectField('Department', coerce=int, validators=[DataRequired()])
    employee_title_id = SelectField('Title', coerce=int, validators=[DataRequired()])
    
    submit = SubmitField('Submit')

    def __init__(self, *args, **kwargs):
        super(EmployeeForm, self).__init__(*args, **kwargs)
        self.employee_dept_id.choices = [(d.department_id, d.department_name) for d in Department.query.order_by('department_name')]
        self.employee_title_id.choices = [(t.title_id, t.title_name) for t in Title.query.order_by('title_name')]

class CommentForm(FlaskForm):
    comment_text = TextAreaField('Comment', validators=[DataRequired()])
    author_id = SelectField('Author', coerce=int, validators=[DataRequired()])
    submit = SubmitField('Submit')

    def __init__(self, *args, **kwargs):
        super(CommentForm, self).__init__(*args, **kwargs)
        self.author_id.choices = [(e.employee_id, e.employee_fname + ' ' + e.employee_lname) for e in Employee.query.order_by(Employee.employee_lname).all()]
        
class UpdateStudentForm(FlaskForm):
    student_fname = StringField('First Name', validators=[DataRequired()])
    student_lname = StringField('Last Name', validators=[DataRequired()])
    student_age = IntegerField('Age', validators=[DataRequired()])
    student_gender_id = SelectField('Gender', coerce=int, validators=[DataRequired()])
    student_level_id = SelectField('Grade', coerce=int, validators=[DataRequired()])
    submit = SubmitField('Update')
    
class ParentForm(FlaskForm):
    parent_fname = StringField('First Name', validators=[DataRequired()])
    parent_lname = StringField('Last Name', validators=[DataRequired()])
    parent_email = StringField('Email', validators=[DataRequired(), Email()])
    parent_password = PasswordField('Password', validators=[DataRequired()])
    submit = SubmitField('Create Parent')
    
class GuardianTypeForm(FlaskForm):
    guardian_type_name = StringField('Name', validators=[DataRequired()])
    guardian_type_description = TextAreaField('Description')   