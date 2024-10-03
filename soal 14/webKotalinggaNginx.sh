apt-get update
apt-get install nginx php-fpm php -y
service apache2 stop
service nginx stop

echo 'server {
    listen 80;
    server_name 192.246.2.2;

    root /var/www/html/Kotalingga;
    index index.php index.html index.htm;

    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/run/php/php7.0-fpm.sock;
    }

    error_log /var/log/nginx/Kotalingga_error.log;
    access_log /var/log/nginx/Kotalingga_access.log;
}' > /etc/nginx/sites-available/Kotalingga

rm /etc/nginx/sites-enabled/default
ln -s /etc/nginx/sites-available/Kotalingga /etc/nginx/sites-enabled/

service php7.0-fpm start

systemctl enable php7.0-fpm

service nginx restart
service nginx status