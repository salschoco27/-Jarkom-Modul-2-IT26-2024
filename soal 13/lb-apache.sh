apt-get update
apt-get install apache2 -y

service apache2 start
a2enmod proxy
a2enmod proxy_http
a2enmod proxy_balancer
a2enmod lbmethod_byrequests

service apache2 restart

echo '<VirtualHost *:80>
    <Proxy balancer://mycluster>
      BalancerMember http://192.246.2.2:80
      BalancerMember http://192.246.2.3:80
      BalancerMember http://192.246.2.4:80
    </Proxy>
    ProxyPreserveHost On
    ProxyPass / balancer://mycluster/
    ProxyPassReverse / balancer://mycluster/
</VirtualHost>' >/etc/apache2/sites-available/load-balancer.conf

a2dissite 000-default.conf
a2ensite load-balancer.conf

service apache2 restart
service apache2 status