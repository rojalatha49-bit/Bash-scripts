#!/bin/bash

#!/bin/bash

echo "Updating system..."
sudo yum update -y

echo "Installing Java..."
sudo yum install java-17-amazon-corretto -y

echo "Creating Tomcat user..."
sudo useradd -r -m -d /opt/tomcat -s /sbin/nologin tomcat

echo "Downloading Tomcat..."
cd /tmp
wget https://downloads.apache.org/tomcat/tomcat-10/v10.1.44/bin/apache-tomcat-10.1.44.tar.gz

echo "Installing Tomcat..."
sudo mkdir -p /opt/tomcat
sudo tar -xzf apache-tomcat-10.1.44.tar.gz -C /opt/tomcat --strip-components=1

echo "Setting permissions..."
sudo chown -R tomcat:tomcat /opt/tomcat
sudo chmod +x /opt/tomcat/bin/*.sh

echo "Creating tomcat.service..."
sudo tee /etc/systemd/system/tomcat.service > /dev/null <<EOF
[Unit]
Description=Apache Tomcat Web Application Container
After=network.target

[Service]
Type=forking

User=tomcat
Group=tomcat

Environment=JAVA_HOME=/usr/lib/jvm/java-17-amazon-corretto
Environment=CATALINA_HOME=/opt/tomcat
Environment=CATALINA_BASE=/opt/tomcat

ExecStart=/opt/tomcat/bin/startup.sh
ExecStop=/opt/tomcat/bin/shutdown.sh

Restart=always

[Install]
WantedBy=multi-user.target
EOF
