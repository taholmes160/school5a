"""add guardian_type table

Revision ID: a9fb5185f71d
Revises: 99e53907c907
Create Date: 2024-03-06 15:39:39.490517

"""
from typing import Sequence, Union

from alembic import op
import sqlalchemy as sa

# revision identifiers, used by Alembic.
revision: str = 'a9fb5185f71d'
down_revision: Union[str, None] = '99e53907c907'
branch_labels: Union[str, Sequence[str], None] = None
depends_on: Union[str, Sequence[str], None] = None

# Import the 'db' object directly from your Flask application
from models import db

def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.create_table(
        'tbl_guardian_type',
        sa.Column('guardian_type_id', sa.Integer, primary_key=True),
        sa.Column('guardian_type_name', sa.String(50), nullable=False),
        sa.Column('guardian_type_description', sa.String(500))
    )

def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_table('tbl_guardian_type')
