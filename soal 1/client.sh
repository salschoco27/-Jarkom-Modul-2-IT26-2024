echo -e 'nameserver 192.246.3.2
nameserver 192.246.1.2
nameserver 192.168.122.1' > /etc/resolv.conf

apt-get update
apt-get install dnsutils -y
apt-get install lynx -y
