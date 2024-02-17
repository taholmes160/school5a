# app/student_blueprint.py
from flask import Blueprint, render_template, redirect, url_for, request
from app.forms import StudentForm
from models import db, Student, Gender, GradeLevel  # Updated import
from sqlalchemy import or_, asc, desc 

student_bp = Blueprint('student_bp', __name__, url_prefix='/students')

@student_bp.route('/')
def list_students():
    sort_column = request.args.get('sort', 'student_id')  # Default sort column is 'student_id'
    sort_direction = request.args.get('direction', 'asc')  # Default sort direction is 'asc'

    if sort_direction == 'desc':
        students = Student.query.order_by(desc(sort_column)).all()
    else:
        students = Student.query.order_by(asc(sort_column)).all()

    return render_template('students.html', students=students, sort_column=sort_column, sort_direction=sort_direction)

@student_bp.route('/add', methods=['GET', 'POST'])
def add_student():
    form = StudentForm()

    # Create choices for the gender and level fields
    gender_choices = [(gender.gender_id, gender.gender_name) for gender in Gender.query.all()]
    level_choices = [(level.grade_id, level.grade_name) for level in GradeLevel.query.all()]  # Updated attribute names

    form.student_gender_id.choices = gender_choices
    form.student_level_id.choices = level_choices

    if form.validate_on_submit():
        new_student = Student(
            student_fname=form.student_fname.data,
            student_lname=form.student_lname.data,
            student_age=form.student_age.data,
            student_gender_id=form.student_gender_id.data,
            grade_level_id=form.student_level_id.data  # Updated attribute name
        )
        db.session.add(new_student)
        db.session.commit()
        return redirect(url_for('student_bp.list_students'))

    return render_template('add_student.html', form=form)

@student_bp.route('/update/<int:student_id>', methods=['GET', 'POST'])
def update_student(student_id):
    student = Student.query.get_or_404(student_id)
    form = StudentForm(obj=student)

    gender_choices = [(gender.gender_id, gender.gender_name) for gender in Gender.query.all()]
    level_choices = [(level.grade_id, level.grade_name) for level in GradeLevel.query.all()]  # Updated attribute names

    form.student_gender_id.choices = gender_choices
    form.student_level_id.choices = level_choices

    if form.validate_on_submit():
        student.student_fname = form.student_fname.data
        student.student_lname = form.student_lname.data
        student.student_age = form.student_age.data
        student.student_gender_id = form.student_gender_id.data
        student.grade_level_id = form.student_level_id.data  # Updated attribute name

        db.session.commit()
        return redirect(url_for('student_bp.list_students'))

    return render_template('update_student.html', form=form, student_id=student_id)

@student_bp.route('/delete/<int:student_id>', methods=['POST'])
def delete_student(student_id):
    student = Student.query.get_or_404(student_id)
    db.session.delete(student)
    db.session.commit()
    return redirect(url_for('student_bp.list_students'))


@student_bp.route('/search', methods=['GET'])
def search_students():
    search_term = request.args.get('q', '')
    students = db.session.query(Student).join(GradeLevel).filter(
        or_(
            Student.student_fname.contains(search_term),
            Student.student_lname.contains(search_term),
            GradeLevel.grade_name.contains(search_term)
        )
    ).all()
    return render_template('students.html', students=students)

@student_blueprint.route('/student/<int:student_id>/add_comment', methods=['GET', 'POST'])
def add_comment(student_id):
    student = Student.query.get_or_404(student_id)
    form = CommentForm()
    if form.validate_on_submit():
        comment = Comment(comment_text=form.comment_text.data, student_id=student_id)
        db.session.add(comment)
        db.session.commit()
        flash('Comment added successfully!', 'success')
        return redirect(url_for('students.student_detail', student_id=student_id))
    return render_template('add_comment.html', form=form, student=student)
