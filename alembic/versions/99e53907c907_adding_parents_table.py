"""adding parents table

Revision ID: 99e53907c907
Revises: 9d19dcf89f04
Create Date: 2024-02-26 15:50:32.137164

"""
from typing import Sequence, Union

from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision: str = '99e53907c907'
down_revision: Union[str, None] = '9d19dcf89f04'
branch_labels: Union[str, Sequence[str], None] = None
depends_on: Union[str, Sequence[str], None] = None


def upgrade() -> None:
    op.create_table(
        'tbl_parents',
        sa.Column('parent_id', sa.Integer(), primary_key=True, autoincrement=True),
        sa.Column('parent_fname', sa.String(45), nullable=True),
        sa.Column('parent_lname', sa.String(45), nullable=True),
        sa.Column('parent_email', sa.String(100), unique=True, nullable=False),
        sa.Column('parent_password', sa.String(255), nullable=False),
        # Add any other fields specific to parents
    )

    op.create_table(
        'tbl_parent_student',
        sa.Column('parent_id', sa.Integer(), sa.ForeignKey('tbl_parents.parent_id'), primary_key=True),
        sa.Column('student_id', sa.Integer(), sa.ForeignKey('tbl_student.student_id'), primary_key=True)
    )



def downgrade() -> None:
    # ### commands auto generated by Alembic - please adjust! ###
    pass
    # ### end Alembic commands ###