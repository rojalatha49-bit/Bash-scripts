#!/bin/bash

# Update the system
sudo yum update -y

# Install Java 17
sudo yum install java-17-amazon-corretto -y

# Create Tomcat user
sudo useradd -r -m -U -d /opt/tomcat -s /bin/false tomcat

# Download Apache Tomcat
cd /tmp
wget https://downloads.apache.org/tomcat/tomcat-10/v10.1.44/bin/apache-tomcat-10.1.44.tar.gz

# Create installation directory
sudo mkdir -p /opt/tomcat

# Extract Tomcat
sudo tar -xzf apache-tomcat-10.1.44.tar.gz -C /opt/tomcat --strip-components=1

# Set ownership
sudo chown -R tomcat:tomcat /opt/tomcat

# Make scripts executable
sudo chmod +x /opt/tomcat/bin/*.sh

# Create Tomcat systemd service
sudo tee /etc/systemd/system/tomcat.service > /dev/null <<EOF
[Unit]
Description=Apache Tomcat Web Application Container
After=network.target

[Service]
Type=forking

User=tomcat
Group=tomcat

Environment="JAVA_HOME=/usr/lib/jvm/java-17-amazon-corretto"
Environment="CATALINA_HOME=/opt/tomcat"
Environment="CATALINA_BASE=/opt/tomcat"

ExecStart=/opt/tomcat/bin/startup.sh
ExecStop=/opt/tomcat/bin/shutdown.sh

Restart=always

[Install]
WantedBy=multi-user.target
EOF

# Reload systemd
sudo systemctl daemon-reload

# Enable and start Tomcat
sudo systemctl enable tomcat
sudo systemctl start tomcat
