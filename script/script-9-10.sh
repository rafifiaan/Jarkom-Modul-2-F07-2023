#!/bin/bash
9-10-Arjuna(){
echo 'nameserver 192.168.122.1' > /etc/resolv.conf
ping google.com -c 3
apt-get update
apt-get install bind9 nginx
}

9-10-Arjuna-LB(){
cd /etc/nginx/sites-available
echo '
 upstream myweb  {
 	server 10.55.3.2:8001; #IP Prabakusuma
 	server 10.55.3.3:8002; #IP Abimanyu
 	server 10.55.3.4:8003; #IP Wisanggeni
 }

 server {
 	listen 80;
 	server_name arjuna.f07.com;

 	location / {
 	proxy_pass http://myweb;
 	}
 }
' > lb-arjuna.f07
 ln -s /etc/nginx/sites-available/lb-arjuna.f07 /etc/nginx/sites-enabled
}