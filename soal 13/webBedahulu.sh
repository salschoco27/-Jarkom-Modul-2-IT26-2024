apt-get update
apt-get install wget -y
apt-get install apache2 -y
apt-get install unzip -y
apt-get install php -y
apt-get install libapache2-mod-php7.0 -y

service apache2 start
	
wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=1Sqf0TIiybYyUp5nyab4twy9svkgq8bi7' -O lb.zip
unzip lb.zip  -d  lb

mkdir /var/www/html/Bedahulu
cp ./lb/worker/index.php /var/www/html/Bedahulu/index.php

echo '<VirtualHost *:80>
    ServerAdmin webmaster@localhost
    DocumentRoot /var/www/html/Bedahulu
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>' > /etc/apache2/sites-available/000-default.conf

service apache2 restart