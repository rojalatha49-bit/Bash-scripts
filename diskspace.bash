#!/bin/bash

THRESHOLD=80
EMAIL="admin@example.com"

DISK_USAGE=$(df -h / | awk 'NR==2 {gsub("%",""); print $5}')

if [ "$DISK_USAGE" -gt "$THRESHOLD" ]
then
    echo "Warning! Disk usage is ${DISK_USAGE}%." | mail -s "Disk Space Alert" "$EMAIL"
    echo "Email notification sent."
else
    echo "Disk usage is normal: ${DISK_USAGE}%"
fi
