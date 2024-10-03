mkdir /etc/bind/panah

echo ';
;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     panah.pasopati.it26.com. root.panah.pasopati.it26.com. (
                              2         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      panah.pasopati.it26.com.
@       IN      A       192.246.2.2     ;IP Kotalingga
www     IN      CNAME   panah.pasopati.it26.com.
log     IN      A       192.246.2.2     ;IP Kotalingga
www.log IN      CNAME   panah.pasopati.it26.com.' > /etc/bind/panah/panah.pasopati.it26.com
