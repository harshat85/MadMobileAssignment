#!/bin/bash

# Load configuration
source /path/to/log_rotation.conf

# Create archive directory if it does not exist
mkdir -p "$ARCHIVE_DIR"

# Move rotated logs to archive and compress them
for log_file in "$LOG_DIR"/$LOG_PATTERN; do
    if [ -f "$log_file" ]; then
        # Move the log file to the archive directory with a date suffix
        mv "$log_file" "$ARCHIVE_DIR/$(basename "$log_file")-$(date +'%Y-%m-%d')"
        # Compress the archived log file
        gzip "$ARCHIVE_DIR/$(basename "$log_file")-$(date +'%Y-%m-%d')"
    fi
done

# Delete archived logs older than $RETENTION_DAYS days
find "$ARCHIVE_DIR" -type f -mtime +$RETENTION_DAYS -exec rm -f {} \;
