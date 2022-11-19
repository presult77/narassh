#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
clear
figlet -f small Panel SSH | lolcat
echo -e ""
echo -e "======================================" | lolcat
echo -e ""
echo -e "     [1]  Create SSH & OpenVPN Account" | lolcat
echo -e "     [2]  Trial Account SSH & OpenVPN" | lolcat
echo -e "     [3]  Renew SSH & OpenVPN Account" | lolcat
echo -e "     [4]  Delete SSH & OpenVPN Account" | lolcat
echo -e "     [5]  Check User Login SSH & OpenVPN" | lolcat
echo -e "     [6]  Daftar Member SSH & OpenVPN" | lolcat
echo -e "     [7]  Delete User Expired SSH & OpenVPN" | lolcat
echo -e "     [8]  Set up Autokill SSH" | lolcat
echo -e "     [9]  Cek Users Who Do Multi Login SSH" | lolcat
echo -e "     [10] Restart Service Dropbear, Squid3" | lolcat
echo -e "     [x]  Exit"
echo -e "======================================" | lolcat
echo -e ""
read -p "     Select From Options [1-10 or x] :  " port
echo -e ""
case $port in
1)
addssh
;;
2)
trialssh
;;
3)
renewssh
;;
4)
delssh
;;
5)
cekssh
;;
6)
member
;;
7)
delexp
;;
8)
autokill
;;
9)
ceklim
;;
10)
restart
;;
x)
clear
menu
;;
*)
echo "Please enter an correct number"
;;
esac
