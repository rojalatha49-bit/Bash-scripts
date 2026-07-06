#!/bin/bash

CRON_JOB="5,27 9-11 * * * /home/ec2-user/script.sh"

(crontab -l 2>/dev/null; echo "$CRON_JOB") | crontab -

echo "Cron job added successfully."
