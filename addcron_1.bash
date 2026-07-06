#!/bin/bash

CRON_JOB='0 0 5 1,6,11 * [ "$(date +\%u)" -eq 4 ] && /home/ec2-user/script.sh'

(crontab -l 2>/dev/null; echo "$CRON_JOB") | crontab -

echo "Cron job added successfully."
