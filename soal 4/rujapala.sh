echo 'zone "rujapala.it26.com" {
type master; 
file "/etc/bind/rujapala/rujapala.it26.com";
};' > /etc/bind/named.conf.local

mkdir /etc/bind/rujapala

cp /etc/bind/db.local /etc/bind/rujapala/rujapala.it26.com

echo ';
;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     rujapala.it26.com. root.rujapala.it26.com. (
                              2         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      rujapala.it26.com.
@       IN      A       192.246.2.4     ;IP Tanjungkulai
www     IN      CNAME   rujapala.it26.com.' > /etc/bind/rujapala/rujapala.it26.com

service bind9 restart