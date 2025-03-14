#!/bin/sh

echo "Waiting for PostgreSQL to start..."
while ! nc -z db 5432; do sleep 1; done
echo "PostgreSQL started!"

# Apply migrations
python manage.py migrate

# Start server
exec "$@"
