#!/bin/bash
# ==========================================
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# ==========================================
# Izin Akses
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
clear
echo -e ""
echo -e "════════════════════════════" | lolcat
echo -e ""
echo -e "[1]. Change Port SSH WS HTTP"
echo -e "═════════════════" | lolcat
echo -e "[2]. Change Port SSH WS TLS / SSL"
echo -e "═════════════════" | lolcat
echo -e "[0]. Exit"
echo -e ""
echo -e "════════════════════════════" | lolcat
echo -e ""
read -p "Select From Options [ 1-7 ] : " port
echo -e ""
case $port in
1)
portsshnontls
;;
2)
portsshws
;;
0)
clear
menu
;;
*)
echo "Please enter an correct number"
;;
esac
