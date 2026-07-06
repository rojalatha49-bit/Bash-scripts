#!/bin/bash

echo "Installing Nginx..."

sudo dnf install nginx -y

sudo systemctl start nginx
sudo systemctl enable nginx

echo "Nginx installation completed."

sudo systemctl status nginx --no-pager
