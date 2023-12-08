#! /bin/bash
yum update -y
yum install -y httpd.x86_64
systemctl start httpd.service
systemctl enable httpd.service
sudo systemctl enable apache2
echo "The page was created by Woofers!" > /var/www/html/index.html