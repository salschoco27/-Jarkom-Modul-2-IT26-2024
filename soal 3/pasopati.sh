echo 'zone "pasopati.it26.com" {
type master; 
file "/etc/bind/pasopati/pasopati.it26.com";
};' >> /etc/bind/named.conf.local

mkdir /etc/bind/pasopati

cp /etc/bind/db.local /etc/bind/pasopati/pasopati.it26.com

echo ';
;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     pasopati.it26.com root.pasopati.it26.com (
                              2         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      pasopati.it26.com.
@       IN      A       192.246.2.2     ;IP Solok
www     IN      CNAME   pasopati.it26.com.' > /etc/bind/pasopati/pasopati.it26.com

service bind9 restart