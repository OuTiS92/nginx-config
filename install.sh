#!/bin/bash
echo "wait for a few seconds ... "
{
  apt-get install fortune cowsay  -y 
} &> /dev/null
clear 
cowsay -f  eyes "OuTiS ....  Version 0.1.1 "  
sleep 3 
clear 
echo "install and confing nginx manually:" 
sleep 2 
clear 
echo "wait ..... "
sudo apt update -y 
wait
apt install gcc   libpcre3 libpcre3-dev zlib1g-dev  libgd-dev  build-essential build-essential  libssl-dev  -y  
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
./configure --sbin-path=/usr/bin/nginx --conf-path=/etc/nginx/nginx.conf --error-log-path=/var/log/nginx/error.log --http-log-path=/var/log/nginx/access.log --with-pcre --pid-path=/var/run/nginx.pid --with-http_ssl_module --with-http_image_filter_module=dynamic --modules-path=/etc/nginx/modules  --without-http_proxy_module --without-http_rewrite_module --without-http_rewrite_module 
wait 
sleep 3 
clear 
make 
wait 
make install
wait 
clear
sleep 2
echo "make services nginx ...."
sleep 1 
echo " [Unit]
Description=The NGINX HTTP and reverse proxy server
After=syslog.target network.target remote-fs.target nss-lookup.target

[Service]
Type=forking
PIDFile=/var/run/nginx.pid
ExecStartPre=/usr/bin/nginx -t
ExecStart=/usr/bin/nginx
ExecReload=/usr/sbin/nginx -s reload
ExecStop=/bin/kill -s QUIT $MAINPID
PrivateTmp=true

[Install]
WantedBy=multi-user.target" >  /lib/systemd/system/nginx.service
percentBar ()  {
    local prct totlen=$((8*$2)) lastchar barstring blankstring;
    printf -v prct %.2f "$1"
    ((prct=10#${prct/.}*totlen/10000, prct%8)) &&
        printf -v lastchar '\\U258%X' $(( 16 - prct%8 )) ||
            lastchar=''
    printf -v barstring '%*s' $((prct/8)) ''
    printf -v barstring '%b' "${barstring// /\\U2588}$lastchar"
    printf -v blankstring '%*s' $(((totlen-prct)/8)) ''
    printf -v "$3" '%s%s' "$barstring" "$blankstring"
}
clear
for i in {0..10000..33} 10000;do i=0$i
    printf -v p %0.2f ${i::-2}.${i: -2}
    percentBar $p $((COLUMNS-15)) bar
    printf '\r|%s|%6.2f%%' "$bar" $p
    read -srt .002 _ && break    # console sleep avoiding fork
done
        echo "\n"
    echo "Install Done :) "


