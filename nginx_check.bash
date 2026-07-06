#!/bin/bash

if systemctl is-active --quiet nginx
then
    echo "Nginx is already running."
else
    echo "Nginx is not running."
    echo "Starting Nginx..."
    systemctl start nginx

    if systemctl is-active --quiet nginx
    then
        echo "Nginx started successfully."
    else
        echo "Failed to start Nginx."
    fi
fi
