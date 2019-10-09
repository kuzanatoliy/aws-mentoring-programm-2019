#!/bin/bash
sudo yum install java-1.8.0-openjdk -y
sudo yum install httpd -y
sudo systemctl enable httpd
sudo systemctl start httpd
sudo aws s3 cp s3://ak.staticwebsitetask2 /var/www/html --recursive
