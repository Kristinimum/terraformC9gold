#!/bin/bash
yum update -y
yum install -y httpd.x86_64
systemctl start httpd.service
systemctl enable httpd.service
echo "Keep those tails wagging with Woofers & Pupcakes this holiday season! $(hostname -f)" > /var/www/html/index.html