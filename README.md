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

## Topologi
![image](https://github.com/user-attachments/assets/fb989a13-7dfc-4c3e-92eb-ea457c38f189)

## Setup Network
IP setiap Node, selain nusantara:
- Nusantara:
  eth1: 192.246.1.1
  eth2: 192.246.2.1
  eth3: 192.246.3.1
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
``` auto eth0
iface eth0 inet static
	address 192.246.2.2
	netmask 255.255.255.0
	gateway 192.246.2.1
up echo nameserver 192.168.122.1 > /etc/resolv.conf
```


### Bedahulu
``` auto eth0
iface eth0 inet static
	address 192.246.2.3
	netmask 255.255.255.0
	gateway 192.246.2.1
up echo nameserver 192.168.122.1 > /etc/resolv.conf
```

### Tanjungkulai
``` auto eth0
iface eth0 inet static
	address 192.246.2.4
	netmask 255.255.255.0
	gateway 192.246.2.1
up echo nameserver 192.168.122.1 > /etc/resolv.conf
```

### Albert Einstein
``` auto eth0
iface eth0 inet static
	address 192.246.2.5
	netmask 255.255.255.0
	gateway 192.246.2.1
up echo nameserver 192.246.3.2 > /etc/resolv.conf
up echo nameserver 192.246.1.2 > /etc/resolv.conf
up echo nameserver 192.168.122.1 > /etc/resolv.conf
```

### Sriwijaya
``` auto eth0
iface eth0 inet static
	address 192.246.3.2
	netmask 255.255.255.0
	gateway 192.246.3.1
up echo nameserver 192.168.122.1 > /etc/resolv.conf
```

### Majapahit
``` auto eth0
iface eth0 inet static
	address 192.246.1.2
	netmask 255.255.255.0
	gateway 192.246.1.1
up echo nameserver 192.168.122.1 > /etc/resolv.conf
```

### HayamWuruk
``` auto eth0
iface eth0 inet static
	address 192.246.1.3
	netmask 255.255.255.0
	gateway 192.246.1.1
up echo nameserver 192.168.122.1 > /etc/resolv.conf
```

### Solok
``` auto eth0
iface eth0 inet static
	address 192.246.1.4
	netmask 255.255.255.0
	gateway 192.246.1.1
up echo nameserver 192.168.122.1 > /etc/resolv.conf
```

### Srikandi
``` auto eth0
iface eth0 inet static
	address 192.246.1.5
	netmask 255.255.255.0
	gateway 192.246.1.1
up echo nameserver 192.168.122.1 > /etc/resolv.conf
```


## Pengerjaan Soal
### Soal 1
Untuk mempersiapkan peperangan World War MMXXIV (Iya sebanyak itu), **Sriwijaya** membuat dua kotanya menjadi web server yaitu **Tanjungkulai,** dan **Bedahulu**, serta **Sriwijaya** sendiri akan menjadi DNS Master. Kemudian karena merasa terdesak, **Majapahit** memberikan bantuan dan menjadikan kerajaannya **(Majapahit)** menjadi **DNS Slave.** 
<br>[Script Soal 1](./soal%201/)<br>
1. Buat script install.sh pada Sriwijaya dan Majapahit dan jalankan.
```
#!/bin/bash

apt-get update
apt-get install bind9 -y
service bind9 start
```

### Soal 2
Karena para pasukan membutuhkan koordinasi untuk melancarkan serangannya, maka buatlah sebuah domain yang mengarah ke **Solok** dengan alamat **sudarsana.xxxx.com** dengan alias **www.sudarsana.xxxx.com**, dimana **xxxx** merupakan kode kelompok. Contoh: sudarsana.it01.com.
<br>[Script Soal 2](./soal%202)<br>
1. Di Sriwijaya buat **sudarsana.sh**
```
echo 'zone "sudarsana.it26.com" {' >> /etc/bind/named.conf.local
echo '	type master;' >> /etc/bind/named.conf.local
echo '	file "/etc/bind/sudarsana/sudarsana.it26.com";' >> /etc/bind/named.conf.local
echo '};' >> /etc/bind/named.conf.local

mkdir /etc/bind/sudarsana
cp /etc/bind/db.local /etc/bind/sudarsana/sudarsana.it26.com
service bind9 restart
```
2. Jalankan ```nano /etc/bind/sudarsana/sudarsana.it26.com``` lalu ubah agar seperti gambar dibawah.
![image](https://github.com/user-attachments/assets/8066d24c-5550-49a8-af32-30206673ebd2)




### Soal 3
Para pasukan juga perlu mengetahui mana titik yang akan diserang, sehingga dibutuhkan domain lain yaitu **pasopati.xxxx.com** dengan alias **www.pasopati.xxxx.com** yang **mengarah ke Kotalingga.**
<br>[Script Soal 3](./soal%203)
1. Di Sriwijaya buat **pasopati.sh**
```
echo 'zone "pasopati.it26.com" {' >> /etc/bind/named.conf.local
echo '	type master;' >> /etc/bind/named.conf.local
echo '	file "/etc/bind/pasopati/pasopati.it26.com";' >> /etc/bind/named.conf.local
echo '};' >> /etc/bind/named.conf.local
mkdir /etc/bind/pasopati
cp /etc/bind/db.local /etc/bind/pasopati/pasopati.it26.com
service bind9 restart
```
2. Jalankan ```nano /etc/bind/pasopati/pasopati.it26.com``` lalu ubah konfigurasinya agar seperti gambar dibawah.
![image](https://github.com/user-attachments/assets/e33b0ed2-5666-4fd7-95eb-9091f9ddbafe)



### Soal 4
Markas pusat meminta dibuatnya domain khusus untuk menaruh informasi persenjataan dan suplai yang tersebar. Informasi dan suplai meme terbaru tersebut **mengarah ke Tanjungkulai** dan domain yang ingin digunakan adalah **rujapala.xxxx.com** dengan alias **www.rujapala.xxxx.com.**
<br>[Script Soal 4](./soal%204)
1. Di Sriwijaya buat **rujapala.sh**
```
echo 'zone "rujapala.it26.com" {' >> /etc/bind/named.conf.local
echo '	type master;' >> /etc/bind/named.conf.local
echo '	file "/etc/bind/rujapala/rujapala.it26.com";' >> /etc/bind/named.conf.local
echo '};' >> /etc/bind/named.conf.local
mkdir /etc/bind/rujapala
cp /etc/bind/db.local /etc/bind/rujapala/rujapala.it26.com
service bind9 restart
```
2. Jalankan ```nano /etc/bind/rujapala/rujapala.it26.com``` lalu ubah konfigurasinya agar seperti gambar dibawah.
![image](https://github.com/user-attachments/assets/db4a1bbb-8a45-4042-a8c9-8ead2ac1c7b9)


### Soal 5
Pastikan domain-domain tersebut dapat diakses oleh **seluruh komputer (client)** yang berada di **Nusantara.**
<br>[Script Soal 5](./soal%205)
1. Di Nusantara buat **tesping.sh**.
```
ping sudarsana.it26.com -c 1
ping www.sudarsana.it26.com -c 1
ping pasopati.it26.com -c 1
ping www.pasopati.it26.com -c 1
ping rujapala.it26.com -c 1
ping www.rujapala.it26.com -c 1
```
2. Jalankan **tesping.sh** untuk mengecek.


### Soal 6
Beberapa daerah memiliki keterbatasan yang menyebabkan **hanya dapat** mengakses domain secara langsung melalui **alamat IP** domain tersebut. Karena daerah tersebut tidak diketahui secara spesifik, pastikan semua komputer (client) dapat mengakses domain **pasopati.xxxx.com** melalui **alamat IP Kotalingga** (Notes: menggunakan pointer record).
<br>[Script Soal 6](./soal%206)
1. Di Sriwijaya buat **pasopatiRev.sh**.
```
echo ' ' >> /etc/bind/named.conf.local
echo 'zone "2.246.192.in-addr.arpa" {' >> /etc/bind/named.conf.local
echo '	type master;' >> /etc/bind/named.conf.local
echo '	file "/etc/bind/pasopati/2.246.192.in-addr.arpa";' >> /etc/bind/named.conf.local
echo '};' >> /etc/bind/named.conf.local
cp /etc/bind/db.local /etc/bind/pasopati/2.246.192.in-addr.arpa
service bind9 restart
```
2. Jalankan ```nano /etc/bind/pasopati/2.246.192.in-addr.arp``` lalu ubah konfigurasinya agar seperti gambar dibawah.
//GAMBAR
3. Install dnsutils pada salah satu client. ```apt-get update<br>apt-get install dnsutils```.
4. Arahkan nameserver ke Sriwijaya (192.246.3.2) ```echo 'nameserver 192.246.3.2' >> /etc/resolv.conf```.
5. Jalankan ```host -t PTR 192.246.2.2```.

### Soal 7
Akhir-akhir ini seringkali terjadi **serangan brainrot** ke DNS Server Utama, sebagai tindakan antisipasi kamu diperintahkan untuk membuat **DNS Slave di Majapahit** untuk **semua domain** yang sudah dibuat sebelumnya yang mengarah ke **Sriwijaya.**
<br>[Script Soal 7](./soal%207)
1. Edit file ```/etc/bind/named.conf.local``` di Sriwijaya dan tambahkan 2 line ini di semua zone
```
also-notify { 192.246.1.2; }; // IP Majapahit
allow-transfer { 192.246.1.2; }; // IP Majapahit
```
2. Restart bind ```service bind9 restart```
3. Di Majapahit buat **slave.sh**
```
echo 'zone "sudarsana.it26.com" {' >> /etc/bind/named.conf.local
echo '	type slave;' >> /etc/bind/named.conf.local
echo '	masters { 192.246.3.2; };	//IP Sriwijaya' >> /etc/bind/named.conf.local
echo '	file "/var/lib/bind/sudarsana.it26.com";' >> /etc/bind/named.conf.local
echo '};' >> /etc/bind/named.conf.local
echo ' ' >> /etc/bind/named.conf.local
echo 'zone "pasopati.it26.com" {' >> /etc/bind/named.conf.local
echo '	type slave;' >> /etc/bind/named.conf.local
echo '	masters { 192.246.3.2; };	//IP Sriwijaya' >> /etc/bind/named.conf.local
echo '	file "/var/lib/bind/pasopati.it26.com";' >> /etc/bind/named.conf.local
echo '};' >> /etc/bind/named.conf.local
echo ' ' >> /etc/bind/named.conf.local
echo 'zone "rujapala.it26.com" {' >> /etc/bind/named.conf.local
echo '	type slave;' >> /etc/bind/named.conf.local
echo '	masters { 192.246.3.2; };	//IP Sriwijaya' >> /etc/bind/named.conf.local
echo '	file "/var/lib/bind/rujapala.it26.com";' >> /etc/bind/named.conf.local
echo '};' >> /etc/bind/named.conf.local
service bind9 restart
```
4. Pada client tambahkan Nameserver Majapahit (192.246.1.2) sebagai slave.
5. Tes DNS Slave menggunakan ```ping sudarsana.it26.com```.


### Soal 8
Kamu juga diperintahkan untuk membuat subdomain khusus melacak kekuatan tersembunyi di **Ohio** dengan subdomain **cakra.sudarsana.xxxx.com** yang mengarah ke Bedahulu.
<br>[Script Soal 9](./soal%208)
1. Pada Sriwijaya buka file menggunakan ```nano /etc/bind/sudarsana/sudarsana.it26.com```.
2. Tambahkan subdomain cakra mengarah ke Bedahulu
```cakra IN A 192.246.2.3```


### Soal 9
Karena terjadi serangan DDOS oleh shikanoko nokonoko koshitantan (NUN), sehingga sistem komunikasinya terhalang. Untuk melindungi warga, kita diperlukan untuk membuat sistem peringatan dari siren man oleh Frekuensi Freak dan memasukkannya ke subdomain **panah.pasopati.xxxx.com** dalam folder panah dan pastikan dapat diakses secara mudah dengan menambahkan alias **www.panah.pasopati.xxxx.com** dan mendelegasikan subdomain tersebut ke **Majapahit** dengan alamat IP menuju radar di **Kotalingga**.
<br>[Script Soal 9](./soal%209)
1. Pada Sriwijaya buka file dengan ```nano /etc/bind/pasopati/pasopati.it26.com```
2. Tambahkan ns1 dan subdomain panah
```
ns1 IN A 192.246.2.2
panah IN NS ns1
```
3. Ubah beberapa konfigurasi pada ```/etc/bind/named.conf.options```
<br>Comment pada dnssec-validation auto; dan
<br>Uncomment allow-query{any;};
<br>Restart bind9 dan lakukan hal yang sama seperti sebelumnya.

4. Buat **panah.sh**
```
echo 'zone "panah.pasopati.it26.com" {' >> /etc/bind/named.conf.local
echo '	type master;' >> /etc/bind/named.conf.local
echo '	file "/etc/bind/panah/panah.pasopati.it26.com";' >> /etc/bind/named.conf.local
echo '};' >> /etc/bind/named.conf.local
mkdir /etc/bind/panah
cp /etc/bind/db.local /etc/bind/panah/panah.pasopati.it26.com
```
5. Buka file dengan ```nano /etc/bind/panah/panah.pasopati.it26.com``` dan ubah agar menjadi seperti gambar dibawah.
![image](https://github.com/user-attachments/assets/5db1ee73-b18c-4ef7-8056-534b064f94ff)
6. Restart bind9 dan jalankan ```ping panah.pasopati.it26.com -c 5```
![image](https://github.com/user-attachments/assets/da459d87-b9ed-4f04-b54d-4adb136916bc)




### Soal 10
Markas juga meminta catatan kapan saja meme brain rot akan dijatuhkan, maka buatlah subdomain baru di subdomain panah yaitu **log.panah.pasopati.xxxx.com** serta aliasnya **www.log.panah.pasopati.xxxx.com** yang juga mengarah ke **Kotalingga**.
<br>[Script Soal 10](./soal%2010)
1. Pada Majapahit ```nano /etc/bind/panah/panah.pasopati.it26.com``` tambahkan
<br>log IN A 192.246.2.2
<br>www.log IN A 192.246.2.2

![image](https://github.com/user-attachments/assets/c39b6f86-775e-46aa-9683-49ca6fcb8451)


### Soal 11
Setelah pertempuran mereda, warga IT dapat kembali mengakses jaringan luar dan menikmati meme brainrot terbaru, tetapi **hanya** warga **Majapahit** saja yang dapat mengakses jaringan luar secara **langsung**. Buatlah konfigurasi agar warga IT yang berada diluar Majapahit dapat mengakses jaringan luar **melalui** DNS Server **Majapahit**.
<br>[Script Soal 11](./soal%2011)
1. Pada Majapahit ```nano /etc/bind/named.conf.options``` dan tambahkan IP Nusantara (192.168.122.1) pada bagian forwarders.

### Soal 12
Karena pusat ingin sebuah laman web yang ingin digunakan untuk memantau kondisi kota lainnya maka deploy laman web ini (cek resource yg lb) pada **Kotalingga** menggunakan **apache**.
<br>[Script Soal 12](./soal%2012)
1. Pada Kotalingga gunakan script ini dengan **web.sh**
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
cp ./lb/worker/index.php /var/www/html/index.php
```

2. Pada client install lynx
```
apt-get update
apt-get install lynx -y
apt-get install libapache2-mod-php7.0 -y
```
3. Akses dengan ```lynx 192.246.2.2/index.php```

### Soal 13
Karena Sriwijaya dan Majapahit memenangkan pertempuran ini dan memiliki banyak uang dari hasil penjarahan (sebanyak 35 juta, belum dipotong pajak) maka pusat meminta kita memasang load balancer untuk membagikan uangnya pada web nya, dengan **Kotalingga, Bedahulu, Tanjungkulai** sebagai worker dan **Solok** sebagai **Load Balancer** menggunakan apache sebagai web server nya dan load balancer nya.
<br>[Script Soal 13](./soal%2013)
1. Hal yang sebelumnya dilakukan di Kotalingga juga dilakukan sama persis di Bedahulu dan Tanjungkulai.

2. Edit beberapa file berikut.
```nano /etc/apache2/sites-available/000-default.conf``` lalu tambahkan pada DocumentRoot ```/var/www/html/Bedahulu```

```nano /etc/apache2/sites-available/000-default.conf``` lalu tambahkan pada DocumentRoot ```/var/www/html/Tanjungkulai```

3. Restart service apache
4. Lalu pada Solok buat lb-apache.sh
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

5. Akses Load Balancer dengan ```lynx 192.246.1.4``` (IP Solok) lalu ctrl+r untuk refresh webpage.


### Soal 14
Selama melakukan penjarahan mereka melihat bagaimana web server luar negeri, hal ini membuat mereka iri, dengki, sirik dan ingin flexing sehingga meminta agar web server dan load balancer nya **diubah menjadi nginx.**
<br>[Script Soal 14](./soal%2014)

### Soal 15
Markas pusat meminta **laporan hasil benchmark** dengan menggunakan apache benchmark dari load balancer dengan 2 web server yang berbeda tersebut dan meminta secara detail dengan ketentuan:
- Nama Algoritma Load Balancer
- Report hasil testing apache benchmark 
- Grafik request per second untuk masing masing algoritma. 
- Analisis
- Meme terbaik kalian (terserah ( ͡° ͜ʖ ͡°)) 🤓
<br>[Script Soal 15](./soal%2015)
[Analisa Hasil](./laporan%20analisa)
### Soal 16
Karena dirasa kurang aman dari brainrot karena masih memakai IP, markas ingin akses ke **Solok** memakai **solok.xxxx.com** dengan alias **www.solok.xxxx.com** (sesuai web server terbaik hasil analisis kalian).
<br>[Script Soal 16](./soal%2016)

### Soal 17
Agar aman, buatlah konfigurasi agar **solok.xxx.com** hanya dapat diakses melalui **port sebesar π x 10^4 = (phi nya desimal)** dan 2000 + 2000 log 10 (10) +700 - π = ?.
<br>[Script Soal 17](./soal%2017)

### Soal 18
Apa bila ada yang mencoba mengakses IP solok akan secara otomatis dialihkan ke **www.solok.xxxx.com.**
<br>[Script Soal 18](./soal%2018)

### Soal 19
Karena probset sudah kehabisan ide masuk ke **salah satu** worker buatkan akses direktori listing yang mengarah ke resource worker2.
<br>[Script Soal 19](./soal%2019)

### Soal 20
Worker tersebut harus dapat di akses dengan **sekiantterimakasih.xxxx.com** dengan alias **www.sekiantterimakasih.xxxx.com**.
<br>[Script Soal 20](./soal%2020)
