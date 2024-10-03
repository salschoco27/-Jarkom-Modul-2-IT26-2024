apt-get update
apt-get install nginx -y
service apache2 stop

cp /etc/nginx/sites-available/default /etc/nginx/sites-available/loadBalancer

echo 'upstream webapp {
    server 192.246.2.2:80;
    server 192.246.2.3:80;
    server 192.246.2.4:80;
}

server {
    listen 80;
    server_name 192.246.1.4;

    location / {
        proxy_pass http://webapp;
    }
}' > /etc/nginx/sites-available/loadBalancer

nginx -t

ln -s /etc/nginx/sites-available/loadBalancer /etc/nginx/sites-enabled/

service nginx restart
service nginx status