apt-get update
apt-get install nginx -y

cp /etc/nginx/sites-available/default /etc/nginx/sites-available/loadBalancer

echo 'upstream webapp {
    server 192.246.2.2:80;
    server 192.246.2.3:80;
    server 192.246.2.4:80;
}

server {
    listen 80;
    server_name 192.168.1.4;

    location / {
        proxy_pass http://webapp;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
    }
}' > /etc/nginx/sites-available/loadBalancer

nginx -t
service nginx restart
service nginx status