#!/bin/bash

THRESHOLD=80
EMAIL="admin@example.com"

CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print int($2)}')

if [ "$CPU_USAGE" -gt "$THRESHOLD" ]
then
    echo "Warning! CPU usage is ${CPU_USAGE}%." | mail -s "High CPU Usage Alert" "$EMAIL"
    echo "Email notification sent."
else
    echo "CPU usage is normal: ${CPU_USAGE}%"
fi
