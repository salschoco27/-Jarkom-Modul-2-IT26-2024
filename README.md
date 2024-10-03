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
[Soal 10](#soal-10)

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
<br>[Script Soal 1](./soal%201/)

### Soal 2
Karena para pasukan membutuhkan koordinasi untuk melancarkan serangannya, maka buatlah sebuah domain yang mengarah ke **Solok** dengan alamat **sudarsana.xxxx.com** dengan alias **www.sudarsana.xxxx.com**, dimana **xxxx** merupakan kode kelompok. Contoh: sudarsana.it01.com.
<br>[Script Soal 2](./soal%202)

### Soal 3
Para pasukan juga perlu mengetahui mana titik yang akan diserang, sehingga dibutuhkan domain lain yaitu **pasopati.xxxx.com** dengan alias **www.pasopati.xxxx.com** yang **mengarah ke Kotalingga.**
<br>[Script Soal 3](./soal%203)

### Soal 4
Markas pusat meminta dibuatnya domain khusus untuk menaruh informasi persenjataan dan suplai yang tersebar. Informasi dan suplai meme terbaru tersebut **mengarah ke Tanjungkulai** dan domain yang ingin digunakan adalah **rujapala.xxxx.com** dengan alias **www.rujapala.xxxx.com.**
<br>[Script Soal 4](./soal%204)

### Soal 5
Pastikan domain-domain tersebut dapat diakses oleh **seluruh komputer (client)** yang berada di **Nusantara.**
<br>[Script Soal 5](./soal%205)

### Soal 6
Beberapa daerah memiliki keterbatasan yang menyebabkan **hanya dapat** mengakses domain secara langsung melalui **alamat IP** domain tersebut. Karena daerah tersebut tidak diketahui secara spesifik, pastikan semua komputer (client) dapat mengakses domain **pasopati.xxxx.com** melalui **alamat IP Kotalingga** (Notes: menggunakan pointer record).
<br>[Script Soal 6](./soal%206)

### Soal 7
Akhir-akhir ini seringkali terjadi **serangan brainrot** ke DNS Server Utama, sebagai tindakan antisipasi kamu diperintahkan untuk membuat **DNS Slave di Majapahit** untuk **semua domain** yang sudah dibuat sebelumnya yang mengarah ke **Sriwijaya.**
<br>[Script Soal 7](./soal%207)

### Soal 8
Kamu juga diperintahkan untuk membuat subdomain khusus melacak kekuatan tersembunyi di **Ohio** dengan subdomain **cakra.sudarsana.xxxx.com** yang mengarah ke Bedahulu.
<br>[Script Soal 9](./soal%208)

### Soal 9
Karena terjadi serangan DDOS oleh shikanoko nokonoko koshitantan (NUN), sehingga sistem komunikasinya terhalang. Untuk melindungi warga, kita diperlukan untuk membuat sistem peringatan dari siren man oleh Frekuensi Freak dan memasukkannya ke subdomain **panah.pasopati.xxxx.com** dalam folder panah dan pastikan dapat diakses secara mudah dengan menambahkan alias **www.panah.pasopati.xxxx.com** dan mendelegasikan subdomain tersebut ke **Majapahit** dengan alamat IP menuju radar di **Kotalingga**.
<br>[Script Soal 9](./soal%209)

### Soal 10
Markas juga meminta catatan kapan saja meme brain rot akan dijatuhkan, maka buatlah subdomain baru di subdomain panah yaitu **log.panah.pasopati.xxxx.com** serta aliasnya **www.log.panah.pasopati.xxxx.com** yang juga mengarah ke **Kotalingga**.
<br>[Script Soal 10](./soal%2010)

### Soal 11
Setelah pertempuran mereda, warga IT dapat kembali mengakses jaringan luar dan menikmati meme brainrot terbaru, tetapi **hanya** warga **Majapahit** saja yang dapat mengakses jaringan luar secara **langsung**. Buatlah konfigurasi agar warga IT yang berada diluar Majapahit dapat mengakses jaringan luar **melalui** DNS Server **Majapahit**.
<br>[Script Soal 11](./soal%2011)

### Soal 12
Karena pusat ingin sebuah laman web yang ingin digunakan untuk memantau kondisi kota lainnya maka deploy laman web ini (cek resource yg lb) pada **Kotalingga** menggunakan **apache**.
<br>[Script Soal 12](./soal%2012)

### Soal 13
Karena Sriwijaya dan Majapahit memenangkan pertempuran ini dan memiliki banyak uang dari hasil penjarahan (sebanyak 35 juta, belum dipotong pajak) maka pusat meminta kita memasang load balancer untuk membagikan uangnya pada web nya, dengan **Kotalingga, Bedahulu, Tanjungkulai** sebagai worker dan **Solok** sebagai **Load Balancer** menggunakan apache sebagai web server nya dan load balancer nya.
<br>[Script Soal 13](./soal%2013)

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
