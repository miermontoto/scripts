#!/bin/bash

LOG_DIR="$HOME/okt/okt-api/storage/logs"

# Check if inotify-tools is installed
if ! command -v inotifywait &> /dev/null; then
    echo "inotify-tools is not installed. Please install it using your package manager."
    exit 1
fi

# Monitor the directory for file creation and modification events
inotifywait -m -e create -e modify "$LOG_DIR" |
while read -r directory event filename; do
    # Send a GNOME notification
    notify-send "File $event" "File: $filename\nIn directory: $directory"
done
