#!/bin/bash

echo "Waiting for postgres..."

while ! nc -z db 5432; do
    sleep 0.1
done

echo "PostgreSQL started"

echo "Assets precompile" 

rails assets:precompile

echo "Setting up db"

rails db:setup

echo "Starting application"

rails server -b 0.0.0.0