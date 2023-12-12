#! /bin/bash
yum update -y
yum install -y httpd.x86_64
systemctl start httpd.service
systemctl enable httpd.service
echo "This instance is apart of 2-Tier Architecture!" > /var/www/html/index.html