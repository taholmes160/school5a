from flask import Blueprint, request, redirect, url_for, render_template, flash
from models import db, Title
from app.forms import TitleForm

# Create a Blueprint instance
titles_blueprint = Blueprint('titles', __name__, template_folder='templates')
    
@titles_blueprint.route('/create', methods=['GET', 'POST'])
def create_title():
    form = TitleForm()
    if form.validate_on_submit():
        new_title = Title(title_name=form.title_name.data, title_description=form.title_description.data)
        db.session.add(new_title)
        db.session.commit()
        flash('Title created successfully!', 'success')
        return redirect(url_for('titles.list_titles'))
    return render_template('create_title.html', form=form)

@titles_blueprint.route('/titles')
def list_titles():
    titles = Title.query.all()
    return render_template('list_titles.html', titles=titles)

@titles_blueprint.route('/update/<int:title_id>', methods=['GET', 'POST'])
def update_title(title_id):
    title = Title.query.get_or_404(title_id)
    form = TitleForm(obj=title)  # Pre-populate the form with the current title data
    if form.validate_on_submit():
        title.title_name = form.title_name.data
        title.title_description = form.title_description.data
        db.session.commit()
        flash('Title updated successfully!', 'success')
        return redirect(url_for('titles.list_titles'))
    return render_template('update_title.html', form=form, title_id=title_id)

@titles_blueprint.route('/delete/<int:title_id>', methods=['POST'])
def delete_title(title_id):
    title = Title.query.get_or_404(title_id)
    db.session.delete(title)
    db.session.commit()
    flash('Title deleted successfully!', 'success')
    return redirect(url_for('titles.list_titles'))
