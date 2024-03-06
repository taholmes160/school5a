# models.py
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy.orm import relationship
from datetime import datetime

db = SQLAlchemy()

class Gender(db.Model):
    __tablename__ = 'tbl_gender'
    gender_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    gender_name = db.Column(db.String(20), nullable=False)

class GradeLevel(db.Model):
    __tablename__ = 'tbl_grade_levels'  # Renamed from 'tbl_levels'
    grade_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    grade_name = db.Column(db.String(20), nullable=False)
    sections = relationship('Section', backref='grade_level', lazy=True)

class Course(db.Model):
    __tablename__ = 'tbl_courses'
    course_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    course_name = db.Column(db.String(255), nullable=False)
    department_id = db.Column(db.Integer, db.ForeignKey('tbl_departments.department_id'), nullable=False)
    department = db.relationship('Department', backref='courses', lazy=True)
    sections = db.relationship('Section', backref='course', lazy=True)

class Section(db.Model):
    __tablename__ = 'tbl_sections'
    section_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    section_name = db.Column(db.String(20), nullable=False)
    course_id = db.Column(db.Integer, db.ForeignKey('tbl_courses.course_id'), nullable=False)
    grade_id = db.Column(db.Integer, db.ForeignKey('tbl_grade_levels.grade_id'), nullable=False)
    enrollments = relationship('Enrollment', backref='section', lazy=True)

class Student(db.Model):
    __tablename__ = 'tbl_student'
    student_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    student_fname = db.Column(db.String(45), nullable=True)
    student_lname = db.Column(db.String(45), nullable=True)
    student_gender_id = db.Column(db.Integer, db.ForeignKey('tbl_gender.gender_id'), nullable=True)
    grade_level_id = db.Column(db.Integer, db.ForeignKey('tbl_grade_levels.grade_id'), nullable=True)   
    student_age = db.Column(db.Integer, nullable=True)
    enrollments = relationship('Enrollment', backref='student', lazy=True)

    # Define relationships
    gender = relationship(Gender, foreign_keys=[student_gender_id])
    grade_level = relationship(GradeLevel, foreign_keys=[grade_level_id])

class Enrollment(db.Model):
    __tablename__ = 'tbl_enrollments'
    enrollment_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    student_id = db.Column(db.Integer, db.ForeignKey('tbl_student.student_id'), nullable=False)
    section_id = db.Column(db.Integer, db.ForeignKey('tbl_sections.section_id'), nullable=False)
    
class Department(db.Model):
    __tablename__ = 'tbl_departments'
    department_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    department_name = db.Column(db.String(50), nullable=False)
    employees = db.relationship('Employee', backref='department', lazy=True)

class Title(db.Model):
    __tablename__ = 'tbl_titles'
    title_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    title_name = db.Column(db.String(100), nullable=False)
    title_description = db.Column(db.Text, nullable=True)

    # You can add relationships here if needed in the future
    # For example, if each employee has one title, you would add a relationship to the Employee model
    # employees = db.relationship('Employee', backref='title', lazy=True)

class Employee(db.Model):
    __tablename__ = 'tbl_employees'
    employee_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    employee_fname = db.Column(db.String(45), nullable=False)
    employee_lname = db.Column(db.String(45), nullable=False)
    employee_dept_id = db.Column(db.Integer, db.ForeignKey('tbl_departments.department_id'), nullable=False)
    employee_title_id = db.Column(db.Integer, db.ForeignKey('tbl_titles.title_id'), nullable=False)

    # Relationships
    title = relationship('Title', backref='employees', lazy=True)
    
class Comment(db.Model):
    __tablename__ = 'tbl_comments'
    comment_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    comment_text = db.Column(db.Text, nullable=False)
    student_id = db.Column(db.Integer, db.ForeignKey('tbl_student.student_id'), nullable=False)
    author_id = db.Column(db.Integer, db.ForeignKey('tbl_employees.employee_id'), nullable=False)  # Assuming the author is an employee
    timestamp = db.Column(db.DateTime, default=datetime.utcnow)

    student = relationship('Student', backref='comments')
    author = relationship('Employee', backref='authored_comments')  # Assuming the author is an employee
    
    
class Parent(db.Model):
    __tablename__ = 'tbl_parents'
    parent_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    parent_fname = db.Column(db.String(45), nullable=True)
    parent_lname = db.Column(db.String(45), nullable=True)
    parent_email = db.Column(db.String(100), unique=True, nullable=False)
    parent_password = db.Column(db.String(255), nullable=False)
    # Add any other fields specific to parents

    children = db.relationship('Student', secondary='tbl_parent_student', backref='parents')

# Association table for parent-student relationship
parent_student = db.Table('tbl_parent_student',
    db.Column('parent_id', db.Integer, db.ForeignKey('tbl_parents.parent_id'), primary_key=True),
    db.Column('student_id', db.Integer, db.ForeignKey('tbl_student.student_id'), primary_key=True)
)

class GuardianType(db.Model):
    __tablename__ = 'tbl_guardian_type'

    guardian_type_id = db.Column(db.Integer, primary_key=True)
    guardian_type_name = db.Column(db.String(50), nullable=False)
    guardian_type_description = db.Column(db.String(500))

    def __repr__(self):
        return f"GuardianType(guardian_type_id={self.guardian_type_id}, guardian_type_name={self.guardian_type_name})"
