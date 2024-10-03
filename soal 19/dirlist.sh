apt-get update
apt-get install wget unzip -y

echo 'server {
    listen 80;
    server_name sekiantterimakasih.it26.com www.sekiantterimakasih.it26.com;

    root /var/www/sekiantterimakasih.it26.com/dir-listing/worker2;
    index index.php index.html index.htm;

    location / {
        autoindex on;
        try_files $uri $uri/ =404;
    }
}' > /etc/nginx/sites-available/sekiantterimakasih.it26.com

mkdir /var/www/sekiantterimakasih.it26.com

wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=1JGk8b-tZgzAOnDqTx5B3F9qN6AyNs7Zy' -O dirlist.zip
unzip dirlist.zip -d /var/www/sekiantterimakasih.it26.com

ln -s /etc/nginx/sites-available/sekiantterimakasih.it26.com /etc/nginx/sites-enabled/sekiantterimakasih.it26.com

nginx -t

service nginx restart
service nginx status