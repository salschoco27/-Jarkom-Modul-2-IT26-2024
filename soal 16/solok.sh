echo 'zone "solok.it26.com" { 
    type master; 
    file "/etc/bind/solok/solok.it26.com";
};' >> /etc/bind/named.conf.local

mkdir /etc/bind/solok

cp /etc/bind/db.local /etc/bind/solok/solok.it26.com

echo ';
;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     solok.it26.com. root.solok.it26.com. (
                              2         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      solok.it26.com.
@       IN      A       192.246.1.4     ;IP Solok
www     IN      CNAME   solok.it26.com.' > /etc/bind/solok/solok.it26.com

service bind9 restart
