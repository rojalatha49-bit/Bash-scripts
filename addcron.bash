#!/bin/bash

CRON_JOB="0 0 5 4 * /home/ec2-user/backup.sh"

(crontab -l 2>/dev/null; echo "$CRON_JOB") | crontab -

echo "Cron job added successfully."
