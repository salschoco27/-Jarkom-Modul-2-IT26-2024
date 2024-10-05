# Laporan Resmi Jarkom-Modul-2-IT26-2024
**Salsabila Rahmah (5027231005)** <br>
**Rafael Ega Krisaditya (5027231025)**
## Daftar Isi
[Soal 1](#soal-1)<br>
[Soal 2](#soal-2)<br>
[Soal 3](#soal-3)<br>
[Soal 4](#soal-4)<br>
[Soal 5](#soal-5)<br>
[Soal 6](#soal-6)<br>
[Soal 7](#soal-7)<br>
[Soal 8](#soal-8)<br>
[Soal 9](#soal-9)<br>
[Soal 10](#soal-10)<br>
[Soal 11](#soal-11)<br>
[Soal 12](#soal-12)<br>
[Soal 13](#soal-13)<br>
[Soal 14](#soal-14)<br>
[Soal 15](#soal-15)<br>
[Soal 16](#soal-16)<br>
[Soal 17](#soal-17)<br>
[Soal 18](#soal-18)<br>
[Soal 19](#soal-19)<br>
[Soal 20](#soal-20)

## Topologi
![image](https://github.com/user-attachments/assets/fb989a13-7dfc-4c3e-92eb-ea457c38f189)

## Setup Network
IP setiap Node:
- Nusantara:
    - eth1: 192.246.1.1
    - eth2: 192.246.2.1
    - eth3: 192.246.3.1
- Kotalingga 192.246.2.2
- Bedahulu 192.246.2.3
- Tanjungkulai 192.246.2.4
- AlbertEinstein 192.246.2.5
- Sriwijaya 192.246.3.2
- Majapahit 192.246.1.2’
- HayamWuruk 192.246.1.3
- Solok 192.246.1.4
- Srikandi 192.246.1.5

### Nusantara
```
auto eth0
iface eth0 inet dhcp

auto eth1
iface eth1 inet static
	address 192.246.1.1
	netmask 255.255.255.0

auto eth2
iface eth2 inet static
	address 192.246.2.1
	netmask 255.255.255.0

auto eth3
iface eth3 inet static
	address 192.246.3.1
	netmask 255.255.255.0

up iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE -s 192.246.0.0/16
```

### Kotalingga
``` 
auto eth0
iface eth0 inet static
	address 192.246.2.2
	netmask 255.255.255.0
	gateway 192.246.2.1
up echo nameserver 192.168.122.1 > /etc/resolv.conf
```


### Bedahulu
``` 
auto eth0
iface eth0 inet static
	address 192.246.2.3
	netmask 255.255.255.0
	gateway 192.246.2.1
up echo nameserver 192.168.122.1 > /etc/resolv.conf
```

### Tanjungkulai
``` 
auto eth0
iface eth0 inet static
	address 192.246.2.4
	netmask 255.255.255.0
	gateway 192.246.2.1
up echo nameserver 192.168.122.1 > /etc/resolv.conf
```

### Albert Einstein
``` 
auto eth0
iface eth0 inet static
	address 192.246.2.5
	netmask 255.255.255.0
	gateway 192.246.2.1
```

### Sriwijaya
``` 
auto eth0
iface eth0 inet static
	address 192.246.3.2
	netmask 255.255.255.0
	gateway 192.246.3.1
up echo nameserver 192.168.122.1 > /etc/resolv.conf
```

### Majapahit
``` 
auto eth0
iface eth0 inet static
	address 192.246.1.2
	netmask 255.255.255.0
	gateway 192.246.1.1
up echo nameserver 192.168.122.1 > /etc/resolv.conf
```

### HayamWuruk
``` 
auto eth0
iface eth0 inet static
	address 192.246.1.3
	netmask 255.255.255.0
	gateway 192.246.1.1
```

### Solok
``` 
auto eth0
iface eth0 inet static
	address 192.246.1.4
	netmask 255.255.255.0
	gateway 192.246.1.1
up echo nameserver 192.168.122.1 > /etc/resolv.conf
```

### Srikandi
``` 
auto eth0
iface eth0 inet static
	address 192.246.1.5
	netmask 255.255.255.0
	gateway 192.246.1.1
```


## Pengerjaan Soal
### Soal 1
Untuk mempersiapkan peperangan World War MMXXIV (Iya sebanyak itu), **Sriwijaya** membuat dua kotanya menjadi web server yaitu **Tanjungkulai,** dan **Bedahulu**, serta **Sriwijaya** sendiri akan menjadi DNS Master. Kemudian karena merasa terdesak, **Majapahit** memberikan bantuan dan menjadikan kerajaannya **(Majapahit)** menjadi **DNS Slave.** 
<br>[Script Soal 1](./soal%201/)<br>
1. Buat script bind9.sh pada Sriwijaya dan Majapahit dan jalankan.
```
#!/bin/bash

apt-get update
apt-get install bind9 -y
service bind9 start
```
2. Buat script client.sh dan jalankan di setiap client **AlbertEinstein**, **HayamWuruk**, **Srikandi**
```
echo -e 'nameserver 192.246.3.2
nameserver 192.246.1.2
nameserver 192.168.122.1' > /etc/resolv.conf

apt-get update
apt-get install dnsutils -y
apt-get install lynx -y
```

### Soal 2
Karena para pasukan membutuhkan koordinasi untuk melancarkan serangannya, maka buatlah sebuah domain yang mengarah ke **Solok** dengan alamat **sudarsana.xxxx.com** dengan alias **www.sudarsana.xxxx.com**, dimana **xxxx** merupakan kode kelompok. Contoh: sudarsana.it01.com.
<br>[Script Soal 2](./soal%202)<br>

Di Sriwijaya buat **sudarsana.sh**
```
apt-get update
apt-get install bind9 -y

echo 'zone "sudarsana.it26.com" { 
    type master; 
    file "/etc/bind/sudarsana/sudarsana.it26.com";
};' > /etc/bind/named.conf.local

mkdir /etc/bind/sudarsana

cp /etc/bind/db.local /etc/bind/sudarsana/sudarsana.it26.com

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
www     IN      CNAME   sudarsana.it26.com.' > /etc/bind/sudarsana/sudarsana.it26.com

service bind9 restart
```
![image](https://github.com/user-attachments/assets/8066d24c-5550-49a8-af32-30206673ebd2)


### Soal 3
Para pasukan juga perlu mengetahui mana titik yang akan diserang, sehingga dibutuhkan domain lain yaitu **pasopati.xxxx.com** dengan alias **www.pasopati.xxxx.com** yang **mengarah ke Kotalingga.**
<br>[Script Soal 3](./soal%203)

Di Sriwijaya buat **pasopati.sh**
```
echo 'zone "pasopati.it26.com" {
    type master; 
    file "/etc/bind/pasopati/pasopati.it26.com";
};' > /etc/bind/named.conf.local

mkdir /etc/bind/pasopati

cp /etc/bind/db.local /etc/bind/pasopati/pasopati.it26.com

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
www     IN      CNAME   pasopati.it26.com.' > /etc/bind/pasopati/pasopati.it26.com

service bind9 restart
```
![Soal 3](./image/Soal%203.png)

### Soal 4
Markas pusat meminta dibuatnya domain khusus untuk menaruh informasi persenjataan dan suplai yang tersebar. Informasi dan suplai meme terbaru tersebut **mengarah ke Tanjungkulai** dan domain yang ingin digunakan adalah **rujapala.xxxx.com** dengan alias **www.rujapala.xxxx.com.**
<br>[Script Soal 4](./soal%204)

Di Sriwijaya buat **rujapala.sh**
```
echo 'zone "rujapala.it26.com" {
    type master; 
    file "/etc/bind/rujapala/rujapala.it26.com";
};' > /etc/bind/named.conf.local

mkdir /etc/bind/rujapala

cp /etc/bind/db.local /etc/bind/rujapala/rujapala.it26.com

echo ';
;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     rujapala.it26.com. root.rujapala.it26.com. (
                              2         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      rujapala.it26.com.
@       IN      A       192.246.2.4     ;IP Tanjungkulai
www     IN      CNAME   rujapala.it26.com.' > /etc/bind/rujapala/rujapala.it26.com

service bind9 restart
```
![image](https://github.com/user-attachments/assets/db4a1bbb-8a45-4042-a8c9-8ead2ac1c7b9)


### Soal 5
Pastikan domain-domain tersebut dapat diakses oleh **seluruh komputer (client)** yang berada di **Nusantara.**
<br>[Script Soal 5](./soal%205)
1. Di **Semua Client** buat **tesping.sh**.
```
ping sudarsana.it26.com -c 1
ping www.sudarsana.it26.com -c 1
ping pasopati.it26.com -c 1
ping www.pasopati.it26.com -c 1
ping rujapala.it26.com -c 1
ping www.rujapala.it26.com -c 1
```
2. Jalankan **tesping.sh** untuk mengecek.
![image](./image/Soal%205.png)

### Soal 6
Beberapa daerah memiliki keterbatasan yang menyebabkan **hanya dapat** mengakses domain secara langsung melalui **alamat IP** domain tersebut. Karena daerah tersebut tidak diketahui secara spesifik, pastikan semua komputer (client) dapat mengakses domain **pasopati.xxxx.com** melalui **alamat IP Kotalingga** (Notes: menggunakan pointer record).
<br>[Script Soal 6](./soal%206)
1. Di Sriwijaya buat **pasopatiRev.sh**.
```
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
```
![image](./image/Soal%206.png)
2. Install dnsutils pada salah satu client.
```
apt-get update
apt-get install dnsutils
```
3. Arahkan nameserver ke Sriwijaya (192.246.3.2)
```
echo 'nameserver 192.246.3.2' >> /etc/resolv.conf
```
4. Jalankan `host -t PTR 192.246.2.2` di client.

![image](./image/Soal%206_2.png)

### Soal 7
Akhir-akhir ini seringkali terjadi **serangan brainrot** ke DNS Server Utama, sebagai tindakan antisipasi kamu diperintahkan untuk membuat **DNS Slave di Majapahit** untuk **semua domain** yang sudah dibuat sebelumnya yang mengarah ke **Sriwijaya.**
<br>[Script Soal 7](./soal%207)
1. Buat file sriwijayaAllow.sh di Sriwijaya.
```
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
};' > /etc/bind/named.conf.local

service bind9 restart
```

2. Di Majapahit buat **slave.sh**
```
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
```
4. Pada client tambahkan Nameserver Majapahit (192.246.1.2) sebagai slave.
5. Tes DNS Slave menggunakan ```ping sudarsana.it26.com``` setelah mematikan service bind9 pada Sriwijaya dengan `service bind9 stop`.


### Soal 8
Kamu juga diperintahkan untuk membuat subdomain khusus melacak kekuatan tersembunyi di **Ohio** dengan subdomain **cakra.sudarsana.xxxx.com** yang mengarah ke Bedahulu.
<br>[Script Soal 9](./soal%208)
1. Pada Sriwijaya buat file sriwijayaCakra.sh
```
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
```

### Soal 9
Karena terjadi serangan DDOS oleh shikanoko nokonoko koshitantan (NUN), sehingga sistem komunikasinya terhalang. Untuk melindungi warga, kita diperlukan untuk membuat sistem peringatan dari siren man oleh Frekuensi Freak dan memasukkannya ke subdomain **panah.pasopati.xxxx.com** dalam folder panah dan pastikan dapat diakses secara mudah dengan menambahkan alias **www.panah.pasopati.xxxx.com** dan mendelegasikan subdomain tersebut ke **Majapahit** dengan alamat IP menuju radar di **Kotalingga**.
<br>[Script Soal 9](./soal%209)
1. Pada Sriwijaya buat file sriwijayaPanah.sh
```
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
```

2. Buat **panah.sh**
```
echo 'options {

    directory "/var/cache/bind";
    auth-nxdomain no;
    listen-on-v6 { any; };
};' > /etc/bind/named.conf.options

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

zone "panah.pasopati.it26.com" {
    type master;
    file "/etc/bind/panah/panah.pasopati.it26.com";
};' > /etc/bind/named.conf.local

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
@       IN      AAAA    ::1' > /etc/bind/panah/panah.pasopati.it26.com

service bind9 restart
```
3. Restart bind9 dan jalankan ```ping panah.pasopati.it26.com -c 5```
![image](https://github.com/user-attachments/assets/da459d87-b9ed-4f04-b54d-4adb136916bc)




### Soal 10
Markas juga meminta catatan kapan saja meme brain rot akan dijatuhkan, maka buatlah subdomain baru di subdomain panah yaitu **log.panah.pasopati.xxxx.com** serta aliasnya **www.log.panah.pasopati.xxxx.com** yang juga mengarah ke **Kotalingga**.
<br>[Script Soal 10](./soal%2010)
1. Pada Majapahit buat **log.sh**
```
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
```

![image](https://github.com/user-attachments/assets/c39b6f86-775e-46aa-9683-49ca6fcb8451)


### Soal 11
Setelah pertempuran mereda, warga IT dapat kembali mengakses jaringan luar dan menikmati meme brainrot terbaru, tetapi **hanya** warga **Majapahit** saja yang dapat mengakses jaringan luar secara **langsung**. Buatlah konfigurasi agar warga IT yang berada diluar Majapahit dapat mengakses jaringan luar **melalui** DNS Server **Majapahit**.
<br>[Script Soal 11](./soal%2011)
1. Pada Majapahit buat **forward.sh**
```
echo 'options {
    directory "/var/cache/bind";
    forwarders {
        192.168.122.1; // IP Nusantara
    };
    allow-query{ any; };
    auth-nxdomain no;
    listen-on-v6 { any; };
};' > /etc/bind/named.conf.options
```

### Soal 12
Karena pusat ingin sebuah laman web yang ingin digunakan untuk memantau kondisi kota lainnya maka deploy laman web ini (cek resource yg lb) pada **Kotalingga** menggunakan **apache**.
<br>[Script Soal 12](./soal%2012)
1. Pada Kotalingga buat script  **web.sh**
```
apt-get update
apt-get install wget -y
apt-get install apache2 -y
apt-get install unzip -y
apt-get install php -y
apt-get install libapache2-mod-php7.0 -y

service apache2 start
	
wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=1Sqf0TIiybYyUp5nyab4twy9svkgq8bi7' -O lb.zip
unzip lb.zip  -d  lb

mkdir /var/www/html/Kotalingga
cp ./lb/worker/index.php /var/www/html/Kotalingga/index.php

echo '<VirtualHost *:80>
    ServerAdmin webmaster@localhost
    DocumentRoot /var/www/html/Kotalingga
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>' > /etc/apache2/sites-available/000-default.conf

service apache2 restart
```

2. Pada client install lynx
```
apt-get update
apt-get install lynx -y
apt-get install libapache2-mod-php7.0 -y
```
3. Akses dengan ```lynx 192.246.2.2/index.php```
![image](./image/Soal%2012.png)

### Soal 13
Karena Sriwijaya dan Majapahit memenangkan pertempuran ini dan memiliki banyak uang dari hasil penjarahan (sebanyak 35 juta, belum dipotong pajak) maka pusat meminta kita memasang load balancer untuk membagikan uangnya pada web nya, dengan **Kotalingga, Bedahulu, Tanjungkulai** sebagai worker dan **Solok** sebagai **Load Balancer** menggunakan apache sebagai web server nya dan load balancer nya.
<br>[Script Soal 13](./soal%2013)
1. Hal yang sebelumnya dilakukan di Kotalingga juga dilakukan sama persis di Bedahulu dan Tanjungkulai.

2. Buat **webBedahulu.sh**
```
apt-get update
apt-get install wget -y
apt-get install apache2 -y
apt-get install unzip -y
apt-get install php -y
apt-get install libapache2-mod-php7.0 -y

service apache2 start
	
wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=1Sqf0TIiybYyUp5nyab4twy9svkgq8bi7' -O lb.zip
unzip lb.zip  -d  lb

mkdir /var/www/html/Bedahulu
cp ./lb/worker/index.php /var/www/html/Bedahulu/index.php

echo '<VirtualHost *:80>
    ServerAdmin webmaster@localhost
    DocumentRoot /var/www/html/Bedahulu
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>' > /etc/apache2/sites-available/000-default.conf

service apache2 restart
```
3. Buat **webTanjungkulai.sh**
```
apt-get update
apt-get install wget -y
apt-get install apache2 -y
apt-get install unzip -y
apt-get install php -y
apt-get install libapache2-mod-php7.0 -y

service apache2 start
	
wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=1Sqf0TIiybYyUp5nyab4twy9svkgq8bi7' -O lb.zip
unzip lb.zip  -d  lb

mkdir /var/www/html/Tanjungkulai
cp ./lb/worker/index.php /var/www/html/Tanjungkulai/index.php

echo '<VirtualHost *:80>
    ServerAdmin webmaster@localhost
    DocumentRoot /var/www/html/Tanjungkulai
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>' > /etc/apache2/sites-available/000-default.conf

service apache2 restart
```

4. Restart service apache
5. Lalu pada Solok buat **lb-apache.sh**
```
apt-get update
apt-get install apache2 -y

service apache2 start
a2enmod proxy
a2enmod proxy_http
a2enmod proxy_balancer
a2enmod lbmethod_byrequests

service apache2 restart

echo '<VirtualHost *:80>
    <Proxy balancer://mycluster>
      BalancerMember http://192.246.2.2:80
      BalancerMember http://192.246.2.3:80
      BalancerMember http://192.246.2.4:80
    </Proxy>
    ProxyPreserveHost On
    ProxyPass / balancer://mycluster/
    ProxyPassReverse / balancer://mycluster/
</VirtualHost>' >/etc/apache2/sites-available/load-balancer.conf

a2dissite 000-default.conf
a2ensite load-balancer.conf

service apache2 restart
service apache2 status
```

6. Akses Load Balancer dengan ```lynx 192.246.1.4``` (IP Solok) lalu ctrl+r untuk refresh webpage.


### Soal 14
Selama melakukan penjarahan mereka melihat bagaimana web server luar negeri, hal ini membuat mereka iri, dengki, sirik dan ingin flexing sehingga meminta agar web server dan load balancer nya **diubah menjadi nginx.**
<br>[Script Soal 14](./soal%2014)
1. Buat **webBedahuluNginx.sh**
```
apt-get update
apt-get install nginx php-fpm php -y
service apache2 stop
service nginx stop

echo 'server {
    listen 80;
    server_name 192.246.2.3;

    root /var/www/html/Bedahulu;
    index index.php index.html index.htm;

    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/run/php/php7.0-fpm.sock;
    }

    error_log /var/log/nginx/Bedahulu_error.log;
    access_log /var/log/nginx/Bedahulu_access.log;
}' > /etc/nginx/sites-available/Bedahulu

rm /etc/nginx/sites-enabled/default
ln -s /etc/nginx/sites-available/Bedahulu /etc/nginx/sites-enabled/

service php7.0-fpm start

systemctl enable php7.0-fpm

service nginx restart
service nginx status
```

2.Buat **webKotalinggaNginx.sh**
```
apt-get update
apt-get install nginx php-fpm php -y
service apache2 stop
service nginx stop

echo 'server {
    listen 80;
    server_name 192.246.2.2;

    root /var/www/html/Kotalingga;
    index index.php index.html index.htm;

    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/run/php/php7.0-fpm.sock;
    }

    error_log /var/log/nginx/Kotalingga_error.log;
    access_log /var/log/nginx/Kotalingga_access.log;
}' > /etc/nginx/sites-available/Kotalingga

rm /etc/nginx/sites-enabled/default
ln -s /etc/nginx/sites-available/Kotalingga /etc/nginx/sites-enabled/

service php7.0-fpm start

systemctl enable php7.0-fpm

service nginx restart
service nginx status
```
3. Buat **webTanjungkulaiNginx.sh**
```
apt-get update
apt-get install nginx php-fpm php -y
service apache2 stop
service nginx stop

echo 'server {
    listen 80;
    server_name 192.246.2.4;

    root /var/www/html/Tanjungkulai;
    index index.php index.html index.htm;

    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/run/php/php7.0-fpm.sock;
    }

    error_log /var/log/nginx/Tanjungkulai_error.log;
    access_log /var/log/nginx/Tanjungkulai_access.log;
}' > /etc/nginx/sites-available/Tanjungkulai

rm /etc/nginx/sites-enabled/default
ln -s /etc/nginx/sites-available/Tanjungkulai /etc/nginx/sites-enabled/

service php7.0-fpm start

systemctl enable php7.0-fpm

service nginx restart
service nginx status
```
4. Buat **lb-nginx.sh**
```
apt-get update
apt-get install nginx -y
service apache2 stop

cp /etc/nginx/sites-available/default /etc/nginx/sites-available/loadBalancer

echo 'upstream webapp {
    server 192.246.2.2:80;
    server 192.246.2.3:80;
    server 192.246.2.4:80;
}

server {
    listen 80;
    server_name 192.246.1.4;

    location / {
        proxy_pass http://webapp;
    }
}' > /etc/nginx/sites-available/loadBalancer

nginx -t

ln -s /etc/nginx/sites-available/loadBalancer /etc/nginx/sites-enabled/

service nginx restart
service nginx status
```

### Soal 15
Markas pusat meminta **laporan hasil benchmark** dengan menggunakan apache benchmark dari load balancer dengan 2 web server yang berbeda tersebut dan meminta secara detail dengan ketentuan:
- Nama Algoritma Load Balancer
- Report hasil testing apache benchmark 
- Grafik request per second untuk masing masing algoritma. 
- Analisis
- Meme terbaik kalian (terserah ( ͡° ͜ʖ ͡°)) 🤓

1. Install apache2-utils menggunakan ```apt-get install apache2-utils -y```
2. Jalankan ```ab -n 1000 -c 100 http://[ip load balancer]``` untuk melihat hasil

Hasil Analisis dapat dilihat pada laporan berikut [Analisa Hasil](./laporan%20analisa)

### Soal 16
Karena dirasa kurang aman dari brainrot karena masih memakai IP, markas ingin akses ke **Solok** memakai **solok.xxxx.com** dengan alias **www.solok.xxxx.com** (sesuai web server terbaik hasil analisis kalian).
<br>[Script Soal 16](./soal%2016)
1. Buat solok.sh
```
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
```

### Soal 17
Agar aman, buatlah konfigurasi agar **solok.xxx.com** hanya dapat diakses melalui **port sebesar π x 10^4 = (phi nya desimal)** dan 2000 + 2000 log 10 (10) +700 - π = ?.
<br>[Script Soal 17](./soal%2017)
1. Buat **portsolok.sh**
```
echo 'upstream webapp {
    server 192.246.2.2;
    server 192.246.2.3;
    server 192.246.2.4;
}

server {
    listen 31400;
    listen 4697;
    server_name solok.it26.com www.solok.it26.com;

    location / {
        proxy_pass http://webapp;
    }
}' > /etc/nginx/sites-available/loadBalancer

service nginx restart
service nginx status
```

### Soal 18
Apa bila ada yang mencoba mengakses IP solok akan secara otomatis dialihkan ke **www.solok.xxxx.com.**
<br>[Script Soal 18](./soal%2018)
1. Buat **redirect.sh**
```
echo 'server {
    listen 192.246.1.4:31400; 
    listen 192.246.1.4:3697; 
    server_name 192.246.1.4;

    return 301 $scheme://www.solok.it26.com$request_uri;
}
' > /etc/nginx/sites-available/redirect_ip

ln -s /etc/nginx/sites-available/redirect_ip /etc/nginx/sites-enabled/redirect_ip

nginx -t

service nginx restart
```

### Soal 19
Karena probset sudah kehabisan ide masuk ke **salah satu** worker buatkan akses direktori listing yang mengarah ke resource worker2.
<br>[Script Soal 19](./soal%2019)
1. Buat dirlist.sh
```
apt-get update
apt-get install wget unzip -y

echo 'server {
    listen 80;
    server_name sekiantterimakasih.it26.com www.sekiantterimakasih.it26.com;

    root /var/www/sekiantterimakasih.it26.com/dir-listing/worker2;
    index index.php index.html index.htm;

    location / {
        autoindex on;
        try_files $uri $uri/ =404;
    }
}' > /etc/nginx/sites-available/sekiantterimakasih.it26.com

mkdir /var/www/sekiantterimakasih.it26.com

wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=1JGk8b-tZgzAOnDqTx5B3F9qN6AyNs7Zy' -O dirlist.zip
unzip dirlist.zip -d /var/www/sekiantterimakasih.it26.com

ln -s /etc/nginx/sites-available/sekiantterimakasih.it26.com /etc/nginx/sites-enabled/sekiantterimakasih.it26.com

nginx -t

service nginx restart
service nginx status
```

### Soal 20
Worker tersebut harus dapat di akses dengan **sekiantterimakasih.xxxx.com** dengan alias **www.sekiantterimakasih.xxxx.com**.
<br>[Script Soal 20](./soal%2020)
1. Buat **sekianterimakasih.sh**
```
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
```
![image](./image/Soal%2020.png)
