#!/usr/bin/env bash
# exit on error
set -o errexit

poetry install
poetry run pip install dj_database_url
poetry run pip install psycopg2
poetry run pip install selenium
poetry run pip install parsel
poetry run pip install -r requirements.txt

python manage.py collectstatic --no-input

python manage.py makemigrations authentication
python manage.py migrate