#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
clear
figlet -f small Panel V2ray | lolcat
echo -e ""
echo -e "======================================" | lolcat
echo -e ""
echo -e "     [1]  Create Vmess Account" | lolcat
echo -e "     [2]  Delete Vmess Account" | lolcat
echo -e "     [3]  Renew Vmess Tls Account" | lolcat
echo -e "     [4]  Check User Login Vmess" | lolcat
echo -e "     [x]  Exit" | lolcat
echo -e "======================================" | lolcat
echo -e ""
read -p "     Select From Options [1-4 or x] :  " port
echo -e ""
case $port in
1)
addvmess
;;
2)
delvmess
;;
3)
renewvmess
;;
4)
cekvmess
;;
x)
clear
menu
;;
*)
echo "Please enter an correct number"
;;
esac
