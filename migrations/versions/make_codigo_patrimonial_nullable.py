"""Make codigo_patrimonial nullable to allow creating bienes without code

Revision ID: allow_bienes_without_code
Revises: c929f0ecd872
Create Date: 2025-12-15 00:00:00.000000

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = 'allow_bienes_without_code'
down_revision = 'c929f0ecd872'
branch_labels = None
depends_on = None


def upgrade():
    # Allow codigo_patrimonial to be NULL so users can create bienes without a code initially
    with op.batch_alter_table('bienes', schema=None) as batch_op:
        batch_op.alter_column('codigo_patrimonial',
               existing_type=sa.String(length=50),
               nullable=True,
               existing_nullable=False)


def downgrade():
    # Revert back to NOT NULL if migration is rolled back
    with op.batch_alter_table('bienes', schema=None) as batch_op:
        batch_op.alter_column('codigo_patrimonial',
               existing_type=sa.String(length=50),
               nullable=False,
               existing_nullable=True)
