#!/bin/bash
apt update
apt install -y httpd
systemctl start httpd
systemctl enable https
echo "<h1>Apache is installed and running</h1>" > /var/www/html/index.html