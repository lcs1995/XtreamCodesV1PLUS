#!/bin/bash
###############################
###############################
###############################
start=$(date +%s)
txtrst=$(tput sgr0) # Text reset
txtred=$(tput setab 1) # Red Background
textpurple=$(tput setab 5) #Purple Background
txtblue=$(tput setab 4) #Blue Background
txtgreen=$(tput bold ; tput setaf 2) # GreenBold
txtyellow=$(tput bold ; tput setaf 3) # YellowBold
arch=$(getconf LONG_BIT)
start=$(date +%s)
iplocal=$(ifconfig  | grep 'inet addr' | awk '{print $2}' | cut -d ':' -f2 |grep -v 127)
echo "${txtblue}Preparing System, please wait ........................ ${txtrst}"
echo "${txtgreen}....................................................................${txtrst}"
apt-get update -y >/dev/null 2>&1
apt-get install sudo -y >/dev/null 2>&1
apt-get install screen -y >/dev/null 2>&1
apt-get install htop -y >/dev/null 2>&1
sudo apt-get install dialog pv cron nano aptitude mlocate -y >/dev/null 2>&1
apt-get update -y >/dev/null 2>&1
pkill -9 nginx
pkill -9 php 
sleep 1
apt-get install lsb-release nscd curl php5 php5-mysql php5-cli php5-curl unzip nano -y >/dev/null 2>&1
sleep 1
apt-get install php5-mcrypt -y >/dev/null 2>&1
sleep 1
php5enmod mcrypt >/dev/null 2>&1
sleep 1
cd /var/www/html
rm -rf 160.zip
wget http://191.252.185.96:7070/xtreamcodes/full/160.zip
sleep 1
unzip -o 160.zip
sleep 1
rm -rf whatismyip.php
wget http://191.252.185.96:7070/xtreamcodes/full/whatismyip.txt -O whatismyip.php
sleep 1
cd /tmp
sleep 1
rm -rf iptv_panel_pro.zip.ZIP
wget http://191.252.185.96:7070/xtreamcodes/full/iptv_panel_pro.zip.ZIP
sleep 1
cd /var/www/html/downloads/
sleep 1
rm -rf IPTV_PLATFORM.zip
wget http://191.252.185.96:7070/xtreamcodes/full/IPTV_PLATFORM.zip
sleep 1
cd /root
sleep 1
rm -rf install_iptv_pro.zip
wget http://191.252.185.96:7070/xtreamcodes/full/install_iptv_pro.zip
sleep 1
unzip -o install_iptv_pro.zip
sleep 1
ip tuntap add tun0 mode tun
sleep 1
iplocal=$(ifconfig  | grep 'inet addr' | awk '{print $2}' | cut -d ':' -f2 |grep -v 127)
sleep 1
ip addr add 149.202.206.51 dev tun0
sleep 1
ip addr add 185.73.239.7 dev tun0
sleep 1
ip addr add 62.210.244.122 dev tun0
sleep 1
ip addr add 123.103.255.87 dev tun0
sleep 1
ip addr add 104.27.137.168 dev tun0
sleep 1
ip addr add "$iplocal" dev tun0
sleep 1
service apache2 restart
php install_iptv_pro.php
sleep 1
chown -R xtreamcodes:xtreamcodes /sys/
echo 'ip tuntap add tun0 mode tun' >> /etc/init.d/xtreamcodes_pro_panel
echo 'ip addr add 149.202.206.51 dev tun0' >> /etc/init.d/xtreamcodes_pro_panel
echo 'ip addr add 185.73.239.7 dev tun0' >> /etc/init.d/xtreamcodes_pro_panel
echo 'ip addr add 62.210.244.122 dev tun0' >> /etc/init.d/xtreamcodes_pro_panel
echo 'ip addr add 123.103.255.87 dev tun0' >> /etc/init.d/xtreamcodes_pro_panel
echo 'ip addr add 104.27.137.168 dev tun0' >> /etc/init.d/xtreamcodes_pro_panel
echo 'chown -R xtreamcodes:xtreamcodes /sys/' >> /etc/init.d/xtreamcodes_pro_panel
end=$(date +%s)
runtime=$(python -c "print '%u:%02u' % ((${end} - ${start})/60, (${end} - ${start})%60)")
sleep 2

#echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
#read -p "Please enter a password again for your MySQL root user:" mysqlpassword


echo "Total install Runtime = "$runtime" "
