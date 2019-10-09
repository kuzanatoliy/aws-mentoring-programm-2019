#!/bin/bash
yum install java-1.8.0-openjdk -y
yum install httpd -y
systemctl enable httpd
systemctl start httpd
aws s3 cp s3://ak.staticwebsitetask2 /var/www/html --recursive
