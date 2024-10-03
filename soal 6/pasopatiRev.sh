echo 'zone "2.246.192.in-addr.arpa" {
type master; 
file "/etc/bind/pasopati/2.246.192.in-addr.arpa";
};' > /etc/bind/named.conf.local

mkdir /etc/bind/pasopati

cp /etc/bind/db.local /etc/bind/pasopati/2.246.192.in-addr.arpa

echo ';
;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     pasopati.it26.com. root.pasopati.it26.com. (
                              2         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
2.246.192.in-addr.arpa.       IN      NS      pasopati.it26.com.
2                             IN      PTR     pasopati.it26.com.' > /etc/bind/pasopati/2.246.192.in-addr.arpa

service bind9 restart