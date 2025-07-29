#!/usr/bin/env bash
set -e

echo ">>> Waiting for PostgreSQL..."
while ! nc -z $POSTGRES_HOST $POSTGRES_PORT; do
  sleep 0.5
done
echo ">>> PostgreSQL is up"

echo ">>> Running Django migrations..."
python manage.py migrate --noinput

echo ">>> Collecting static files..."
python manage.py collectstatic --noinput

echo ">>> Starting Gunicorn..."
exec "$@"
