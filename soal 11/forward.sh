echo 'options {
    directory "/var/cache/bind";
    forwarders {
        192.168.122.1 // IP Nusantara
    }
    allow-query{ any; };
    auth-nxdomain no;
    listen-on-v6 { any; };
};' > /etc/bind/named.conf.options