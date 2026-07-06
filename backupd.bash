#!/bin/bash

SOURCE="/home/ec2-user/phase"
BACKUP="/home/ec2-user/backup.tar.gz"

tar -czf "$BACKUP" "$SOURCE"

echo "Backup created successfully!"
