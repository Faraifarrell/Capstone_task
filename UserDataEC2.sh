#!/bin/bash

# Install updates and necessary packages
sudo yum update -y
sudo yum install -y httpd mysql wget
sudo amazon-linux-extras install -y php7.4
sudo yum install -y php-cli php-pdo php-fpm php-json php-mysqlnd php-xml
sudo systemctl start httpd
sudo systemctl enable httpd

# Configure MySQL (if needed)
DBRootPassword='rootpassword'
mysqladmin -u root password "$DBRootPassword"

# Retrieve RDS endpoint and configure database variables
DBName=${rds_db_name}
DBUser=${rds_username}
DBPassword=${rds_password}
RDS_ENDPOINT=${rds_endpoint}

# Install WordPress
cd /var/www/html
wget http://wordpress.org/latest.tar.gz
sudo tar -zxvf latest.tar.gz
sudo cp -rvf wordpress/* .
sudo rm -rf wordpress latest.tar.gz

# Configure wp-config.php
sudo cp wp-config-sample.php wp-config.php
sudo sed -i "s/'database_name_here'/'$DBName'/g" wp-config.php
sudo sed -i "s/'username_here'/'$DBUser'/g" wp-config.php
sudo sed -i "s/'password_here'/'$DBPassword'/g" wp-config.php
sudo sed -i "s/'localhost'/'$RDS_ENDPOINT'/g" wp-config.php
echo "define('FS_METHOD', 'direct');" | sudo tee -a wp-config.php

# Verify database connection
sudo mysql -h "$RDS_ENDPOINT" -u "$DBUser" -p"$DBPassword" -e "SHOW DATABASES;"

# Set file permissions
sudo chown -R apache:apache /var/www/html
sudo find /var/www/html -type d -exec chmod 755 {} \;
sudo find /var/www/html -type f -exec chmod 644 {} \;

# Restart Apache
sudo systemctl restart httpd
