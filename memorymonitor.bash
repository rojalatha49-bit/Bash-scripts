#!/bin/bash

THRESHOLD=80
EMAIL="admin@example.com"

MEMORY_USAGE=$(free | awk '/Mem:/ {printf("%.0f"), $3/$2 * 100}')

if [ "$MEMORY_USAGE" -gt "$THRESHOLD" ]
then
    echo "Warning! Memory usage is ${MEMORY_USAGE}%." | mail -s "High Memory Usage Alert" "$EMAIL"
    echo "Email notification sent."
else
    echo "Memory usage is normal: ${MEMORY_USAGE}%"
fi
