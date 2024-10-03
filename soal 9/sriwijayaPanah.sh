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
@       IN      NS      pasopati.it26.com.
@       IN      A       192.246.2.2     ;IP Kotalingga
www     IN      CNAME   pasopati.it26.com.
ns1     IN      A       192.246.2.2    ;IP Kotalingga
panah   IN      NS      ns1
@       IN      AAAA    ::1' > /etc/bind/pasopati/pasopati.it26.com

echo 'options {
    directory "/var/cache/bind";
    allow-query{ any; };
    auth-nxdomain no;
    listen-on-v6 { any; };
};' > /etc/bind/named.conf.options

service bind9 restart