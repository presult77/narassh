#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
clear
figlet -f small Panel TRIAL-VPN PERJAM | lolcat
echo -e ""
echo -e "======================================" | lolcat
echo -e ""
echo -e "     [1]  Create Trial-SSH Account"
echo -e "     [2]  Create Trial-VMESS Account"
echo -e "     [3]  Create Trial-VLESS Account"
echo -e "     [4]  Create Trial-Trojan Account"
echo -e "     [5]  Create Trial-TrojanGO Account"
echo -e "     [6]  Create Trial-GRPC Account"
echo -e "     [x]  Exit"
echo -e "======================================" | lolcat
echo -e ""
read -p "     Select From Options [1-4 or x] :  " port
echo -e ""
case $port in
1)
trial-ssh
;;
2)
trial-vmess
;;
3)
trial-vless
;;
4)
trial-trojan
;;
5)
trial-trojango
;;
6)
trial-grpc
;;
x)
clear
menu
;;
*)
echo "Please enter an correct number"
;;
esac
