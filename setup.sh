#!/bin/bash

echo "Setting Non interactive"

export TERM=linux
export DEBIAN_FRONTEND=noninteractive

echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

echo "updating apt-cache"

apt-get update

echo "Ensuring standard packages exist "
# Only matters on Docker based vms

apt-get install -y wget tar apt-utils

echo "Setting mysql password"

PASSWORD='password'
REGION='Australia'
PORT='80'

debconf-set-selections <<< "mysql-server mysql-server/root_password password ${PASSWORD}"
debconf-set-selections <<< "mysql-server mysql-server/root_password_again ${PASSWORD}"
debconf-set-selections <<< "tzdata tzdata/Areas select ${REGION}"

echo "Installing Apache"

apt-get install -y apache2 libapache2-mod-php7.2
service apache2 start

echo "Installing PHP 7"

apt-get install -y php7.2 php7.2-curl php7.2-gd php7.2-json php7.2-mbstring

echo "Installing MySql"

apt-get install -y mysql-server5.7 php7.2-mysql

mysql_secure_installation

echo "R"

echo "Installing PHP MyAdmin"

apt-get install -y phpmyadmin

echo "Restarting Apache and mysql"

service apache2 restart
service mysql restart

echo "Exposing port 80"

iptables -A INPUT -m state --state NEW -p tcp --dport 80 -j ACCEPT

echo "Getting Wordpress"

wget -P /tmp/ https://wordpress.org/latest.tar.gz

echo "Extracting Wordpress"

tar xzvf /tmp/latest.tar.gz -C /var/www/html/ --strip-components=1

echo "Creating htaccess"

touch /var/www/html/.htaccess

chmod 660 /var/www/html/.htaccess

echo "Copying example config"

cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
