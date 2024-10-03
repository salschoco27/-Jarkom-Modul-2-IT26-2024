apt-get update
apt-get install bind9 -y

echo 'zone "sudarsana.it26.com" {
    type slave;
    masters { 192.246.3.2; }; //IP Sriwijaya
    file "/var/lib/bind/sudarsana.it26.com";
};

zone "pasopati.it26.com" {
    type slave;
    masters { 192.246.3.2; }; //IP Sriwijaya
    file "/var/lib/bind/pasopati.it26.com";
};

zone "rujapala.it26.com" {
    type slave;
    masters { 192.246.3.2; }; //IP Sriwijaya
    file "/var/lib/bind/rujapala.it26.com";
};' > /etc/bind/named.conf.local

service bind9 restart