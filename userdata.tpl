#!/bin/bash
# A script to install and configure a WordPress blog

# Step 1: Install a LAMP Stack and other necessary packages
sudo apt-get update -y
sudo apt-get install -y apache2 php libapache2-mod-php php-mysql php-curl php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip wget unzip

# Step 2: Download and set up WordPress files
cd /var/www/html
sudo rm -rf index.html
sudo wget https://wordpress.org/latest.tar.gz
sudo tar -xvzf latest.tar.gz
sudo mv wordpress/* .
sudo rm -rf wordpress latest.tar.gz

# Step 3: Set correct file permissions for WordPress
sudo chown -R www-data:www-data /var/www/html/
sudo chmod -R 755 /var/www/html/

# Step 4: Create the wp-config.php file and inject database credentials
sudo cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

sudo sed -i "s/database_name_here/${db_name}/g" /var/www/html/wp-config.php
sudo sed -i "s/username_here/${db_user}/g" /var/www/html/wp-config.php
sudo sed -i "s/password_here/${db_pass}/g" /var/www/html/wp-config.php
sudo sed -i "s/localhost/${db_host}/g" /var/www/html/wp-config.php

# Step 5: Restart Apache
sudo systemctl restart apache2