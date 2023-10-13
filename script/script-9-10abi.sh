9-10-Abimanyu(){
echo 'nameserver 192.168.122.1' > /etc/resolv.conf
apt-get update && apt install nginx php php-fpm -y
php -v
mkdir /var/www/praktikum-jarkom
echo '
 <?php
  echo "Halo, Kamu berada di Abimanyu";
 ?>
' > index.php
cd /etc/nginx/sites-available
echo '
 server {

 	listen 8002;

 	root /var/www/praktikum-jarkom;

 	index index.php index.html index.htm;
 	server_name _;

 	location / {
 			try_files $uri $uri/ /index.php?$query_string;
 	}

 	# pass PHP scripts to FastCGI server
 	location ~ \.php$ {
 	include snippets/fastcgi-php.conf;
 	fastcgi_pass unix:/var/run/php/php7.0-fpm.sock;
 	}

 location ~ /\.ht {
 			deny all;
 	}

 	error_log /var/log/nginx/arjuna.f07_error.log;
 	access_log /var/log/nginx/arjuna.f07_access.log;
 }
' > arjuna.f07

ln -s /etc/nginx/sites-available/arjuna.f07 /etc/nginx/sites-enabled
service php7.0-fpm start
service nginx restart
}
