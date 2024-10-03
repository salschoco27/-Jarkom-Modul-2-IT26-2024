echo 'server {
    listen 192.246.1.4:31400; 
    listen 192.246.1.4:3697; 
    server_name 192.246.1.4;

    return 301 $scheme://www.solok.it26.com$request_uri;
}
' > /etc/nginx/sites-available/redirect_ip

ln -s /etc/nginx/sites-available/redirect_ip /etc/nginx/sites-enabled/redirect_ip

nginx -t

service nginx restart