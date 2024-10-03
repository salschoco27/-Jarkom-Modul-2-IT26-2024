echo ';
;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     sudarsana.it26.com. root.sudarsana.it26.com. (
                              2         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      sudarsana.it26.com.
@       IN      A       192.246.1.4     ;IP Solok
www     IN      CNAME   sudarsana.it26.com.
cakra   IN      A       192.246.2.3     ;IP Bedahulu
@       IN      AAAA    ::1' > /etc/bind/sudarsana/sudarsana.it26.com