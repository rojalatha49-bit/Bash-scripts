#!/bin/bash

echo "Installing Java..."

yum install java-17-amazon-corretto -y

echo "Downloading Apache Tomcat..."

cd /opt

wget https://downloads.apache.org/tomcat/tomcat-10/v10.1.44/bin/apache-tomcat-10.1.44.tar.gz

echo "Extracting Tomcat..."

tar -xvzf apache-tomcat-10.1.44.tar.gz

mv apache-tomcat-10.1.44 tomcat

chmod +x /opt/tomcat/bin/*.sh

echo "Starting Tomcat..."

/opt/tomcat/bin/startup.sh

echo "Tomcat installation completed successfully."
