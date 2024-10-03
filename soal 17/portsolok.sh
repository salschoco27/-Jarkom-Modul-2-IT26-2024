echo 'upstream webapp {
    server 192.246.2.2;
    server 192.246.2.3;
    server 192.246.2.4;
}

server {
    listen 31400;
    listen 4697;
    server_name solok.it26.com www.solok.it26.com;

    location / {
        proxy_pass http://webapp;
    }
}' > /etc/nginx/sites-available/loadBalancer

service nginx restart
service nginx status