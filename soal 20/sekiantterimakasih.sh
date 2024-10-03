echo 'zone "sekiantterimakasih.it26.com" {
    type master;
    file "/etc/bind/it26/sekiantterimakasih.it26.com";
};' >> /etc/bind/named.conf.local

mkdir /etc/bind/it26

cp /etc/bind/db.local /etc/bind/it26/sekiantterimakasih.it26.com

echo ';
;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     sekiantterimakasih.it26.com. root.sekiantterimakasih.it26.com. (
                                2         ; Serial
                           604800         ; Refresh
                            86400         ; Retry
                          2419200         ; Expire
                           604800 )       ; Negative Cache TTL
;
@       IN      NS      sekiantterimakasih.it26.com.
@       IN      A       192.246.2.2     ;IP Kotalingga
www     IN      CNAME   sekiantterimakasih.it26.com.' > /etc/bind/it26/sekiantterimakasih.it26.com

service bind9 restart