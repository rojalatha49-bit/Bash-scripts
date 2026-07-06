#!/bin/bash

CRON_JOB="0 0 * * * /home/ec2-user/script.sh"

(crontab -l 2>/dev/null; echo "$CRON_JOB") | crontab -

echo "Cron job added successfully."
