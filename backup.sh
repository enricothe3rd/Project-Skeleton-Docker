#!/bin/bash

# Get the directory of the script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Database credentials
DB_NAME="e-commerce-clone"
DB_USER="enrico-e-commerce"
DB_PASSWORD="1234"

# Get current date and time for filename
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_FILE="$SCRIPT_DIR/backup_${DB_NAME}_${TIMESTAMP}.sql"

# Export password for pg_dump
export PGPASSWORD="$DB_PASSWORD"

# Perform the database backup
pg_dump -U "$DB_USER" -d "$DB_NAME" -F p -f "$BACKUP_FILE"

# Unset password for security
unset PGPASSWORD

# Check if backup was successful
if [ $? -eq 0 ]; then
    echo "Backup successful: $BACKUP_FILE"
else
    echo "Backup failed!"
fi
