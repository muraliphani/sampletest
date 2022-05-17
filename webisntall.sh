#!/bin/bash

# Installing Dependencies

echo "Installing packages."

sudo yum install wget unzip httpd -y > /dev/null
echo

# Start & Enable Service

echo "Start & Enable HTTPD Service"

sudo systemctl start httpd
sudo systemctl enable httpd
echo

# Creating Temp Directory

echo "Starting Artifact Deployment"

mkdir -p /tmp/webfiles
cd /tmp/webfiles
echo

wget https://www.tooplate.com/zip-templates/2098_health.zip > /dev/null
unzip 2098_health.zip > /dev/null
sudo cp -r 2098_health/* /var/www/html/
echo

# Bounce Service

echo "Restarting HTTPD service"

systemctl restart httpd
echo

# Clean Up

echo "Removing Temporary Files"

rm -rf /tmp/webfiles
echo

sudo systemctl status httpd
ls /var/www/html/

echo "added new line to this file"


