#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
clear
figlet -f small Panel GRPC1 | lolcat
echo -e ""
echo -e "======================================" | lolcat
echo -e ""
echo -e "     [1]  Create Grpc1 Account" | lolcat
echo -e "     [2]  Delete Grpc1 Account" | lolcat
echo -e "     [3]  Renew Grpc1 Tls Account" | lolcat
echo -e "     [4]  Check User Login Grpc1" | lolcat
echo -e "     [x]  Exit" | lolcat
echo -e "======================================" | lolcat
echo -e ""
read -p "     Select From Options [1-4 or x] :  " port
echo -e ""
case $port in
1)
fb-addgrpc
;;
2)
fb-delgrpc
;;
3)
fb-renewgrpc
;;
4)
fb-cekgrpc
;;
x)
clear
menu
;;
*)
echo "Please enter an correct number"
;;
esac
