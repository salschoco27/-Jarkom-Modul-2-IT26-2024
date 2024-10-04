echo 'zone "sudarsana.it26.com" {
    type master; 
    also-notify { 192.246.1.2; }; // IP Majapahit
    allow-transfer { 192.246.1.2; }; // IP Majapahit
    file "/etc/bind/sudarsana/sudarsana.it26.com";
};

zone "pasopati.it26.com" {
    type master; 
    also-notify { 192.246.1.2; }; // IP Majapahit
    allow-transfer { 192.246.1.2; }; // IP Majapahit
    file "/etc/bind/pasopati/pasopati.it26.com";
};

zone "rujapala.it26.com" {
    type master; 
    also-notify { 192.246.1.2; }; // IP Majapahit
    allow-transfer { 192.246.1.2; }; // IP Majapahit
    file "/etc/bind/rujapala/rujapala.it26.com";
};

zone "2.246.192.in-addr.arpa" {
    type master; 
    file "/etc/bind/pasopati/2.246.192.in-addr.arpa";
};' > /etc/bind/named.conf.local

service bind9 restart