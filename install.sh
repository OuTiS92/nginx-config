#!/bin/bash
clear
echo "install and confing nginx manually:"
sleep 2 
clear
echo "wait ..... "
sudo apt update -y
wait
apt install pcre-devel -y  
wait
apt-get install libpcre3 libpcre3-dev -y 
wait
apt-get install zlib1g-dev -y 
wait
apt install libgd-dev -y
wait
apt install libgd-dev -y
wait
apt-get install build-essential -y 
wait
apt install libssl-dev -y
wait
clear

echo "soon install config nginx ...."
sleep 2


wget http://nginx.org/download/nginx-1.25.2.tar.gz
wait
tar -zxvf nginx-1.25*

wait
cd nginx-1.25.2
sleep 1
clear

./configure --sbin-path=/usr/bin/nginx --conf-path=/etc/nginx/nginx.conf --error-log-path=/var/log/nginx/error.log --http-log-path=/var/log/nginx/access.log --with-pcre --pid-path=/var/run/nginx.pid --with-http_ssl_module --with-http_image_filter_module=dynamic --modules-path=/etc/nginx/modules  --without-http_rewrite_module 
wait 

echo " insall Ok :) "
sleep 3 
clear
make 
wait 
make install
wait 
systemctl status nginx


