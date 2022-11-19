#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
clear
figlet -f small Panel Vless | lolcat
echo -e ""
echo -e "======================================" | lolcat
echo -e ""
echo -e "     [1]  Create Vless Websocket Account" | lolcat
echo -e "     [2]  Delete Vless Websocket Account" | lolcat
echo -e "     [3]  Renew Vless Account" | lolcat
echo -e "     [4]  Check User Login Vless" | lolcat
echo -e "     [x]  Exit" | lolcat
echo -e "======================================" | lolcat
echo -e ""
read -p "     Select From Options [1-4 or x] :  " port
echo -e ""
case $port in
1)
addvless
;;
2)
delvless
;;
3)
renewvless
;;
4)
cekvless
;;
x)
clear
menu
;;
*)
echo "Please enter an correct number"
;;
esac
