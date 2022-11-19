#!/bin/bash
merah="\e[1;31m"
hijau="\e[1;32m"
kuning="\e[1;33m"
biru="\e[1;34m"
putih="\e[1;37m"
cyan="\e[1;36m"
NC="\e[1;37m"
clear
if [[ -e /etc/debian_version ]]; then
	OS=debian
	RCLOCAL='/etc/rc.local'
elif [[ -e /etc/centos-release || -e /etc/redhat-release ]]; then
	OS=centos
	RCLOCAL='/etc/rc.d/rc.local'
	chmod +x /etc/rc.d/rc.local
else
	echo "It looks like you are not running this installer on Debian, Ubuntu or Centos system"
	exit
fi
# Getting
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################
red='\e[1;31m'
green='\e[1;32m'
NC='\e[0m'
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }

sslh_status=$(systemctl status sslh | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
# SSLH Status
if [[ $sslh_status == "running" ]] ; then
  status_sslh="${BLUE}Running${NC} ( Aktif )${NC}"
else
  status_sslh="${RED}Not Running ${NC}( Not Aktif )${NC}"
fi
color3='\e[031;1m'
color2='\e[34;1m'
color3='\e[0m'
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
WKT=$(curl -s ipinfo.io/timezone )
IPVPS=$(curl -s ipv4.icanhazip.com )
	
	echo " "
	cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
	cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
	freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
	tram=$( free -m | awk 'NR==2 {print $2}' )
	swap=$( free -m | awk 'NR==4 {print $2}' )
	up=$(uptime|awk '{ $1=$2=$(NF-6)=$(NF-5)=$(NF-4)=$(NF-3)=$(NF-2)=$(NF-1)=$NF=""; print }')
	
echo -e "${cyan}------------------------------------------------------------------${cyan}" 
echo -e "${NUMBER}PILIH MENU VPS DIBAWAH INI ${NUMBER}" | lolcat
echo -e "${cyan}------------------------------------------------------------------${cyan}"
echo -e "$cyan  1$putih. Control Panel Trial (trial-menu)" | lolcat
echo -e "$cyan  2$putih. Control Panel SSH & OVPN (tessh)" | lolcat
echo -e "${cyan}------------------------------------------------------------------${cyan}" 
echo -e "${NUMBER}SYSTEM MENU ${NUMBER}" | lolcat
echo -e "${cyan}------------------------------------------------------------------${cyan}"
echo -e "$cyan  9$putih. Add Subdomain Host For VPS (addhost)" | lolcat
echo -e "$cyan  11$putih. Change Port All Account Account(changeport)" | lolcat
echo -e "$cyan  12$putih. Autobackup Data VPS (autobackup)" | lolcat
echo -e "$cyan  13$putih. Backup Data VPS (backup)" | lolcat
echo -e "$cyan  14$putih. Restore Data VPS (restore)" | lolcat
echo -e "$cyan  15$putih. Webmin Menu (webmin)" | lolcat
echo -e "$cyan  16$putih. Limit Bandwith Speed Server (limitspeed)" | lolcat
echo -e "$cyan  17$putih. Check Usage of VPS Ram (ram)" | lolcat
echo -e "$cyan  18$putih. Reboot VPS (reboot)" | lolcat
echo -e "$cyan  19$putih. Speedtest VPS (speedtest)" | lolcat
echo -e "$cyan  20$putih. Information Display System (info)" | lolcat
echo -e "$cyan  21$putih. Info Script Auto Install (about)" | lolcat
echo -e "$cyan  22$putih. Restart All Service (restart)" | lolcat
echo -e "$cyan  23$putih. Set Multi Login Akun (autokill)" | lolcat
echo -e "$cyan  24$putih. Merubah password VPS (passwd)" | lolcat
echo -e "${cyan}------------------------------------------------------------------${cyan}" 
echo -e " x.)   Exit Menu"
echo -e "${cyan}------------------------------------------------------------------${cyan}" 
read -p " Please Input Number  [1-31 or x] :  "  num

echo -e ""

case $num in

1)

trial-menu

;;

2)

tessh

;;

3)

wss

;;

4)

vls

;;

5)

trj

;;

6)

trjgo

;;

7)

grpcc

;;

8)

grpccc

;;

9)

addhost

;;

10)

certv2ray

;;

11)

changeport

;;

12)

autobackup

;;

13)

backup

;;

14)

limitspeed

;;

15)

webmin

;;

16)

limitspeed

;;

17)

ram

;;

18)

reboot

;;

19)

speedtest

;;

20)

info

;;

21)

about

;;

22)

restart

;;

23)

autokill

;;

24)

passwd

;;

25)

wilcard

;;

26)

running

;;

27)

cfh

;;

28)

cat log-install.txt

;;

29)

systemctl disable sslh
systemctl stop sslh
menu

;;

30)

systemctl enable sslh
systemctl start sslh
menu

;;

x)

bash .profile

;;

*)

echo "Please enter an correct number"

;;

esac
