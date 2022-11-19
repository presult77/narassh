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
echo -e "[1]. Change Port OpenVPN"
echo -e "═════════════════" | lolcat
echo -e "[2]. Change Port Vmess + Vless"
echo -e "═════════════════" | lolcat
echo -e "[3]. Change Port Trojan GFW"
echo -e "═════════════════" | lolcat
echo -e "[4]. Change Port Trojan GO"
echo -e "═════════════════" | lolcat
echo -e "[5]. Change Port Squid"
echo -e "═════════════════" | lolcat
echo -e "[6]. Change Port SSH WS HTTP"
echo -e "═════════════════" | lolcat
echo -e "[7]. Change Port SSH WS TLS / SSL"
echo -e "═════════════════" | lolcat
echo -e "[0]. Exit"
echo -e ""
echo -e "════════════════════════════" | lolcat
echo -e ""
read -p "Select From Options [ 1-7 ] : " port
echo -e ""
case $port in
1)
portovpn
;;
2)
portvlm
;;
3)
porttrojan
;;
4)
port-trojango
;;
5)
portsquid
;;
6)
portsshnontls
;;
7)
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
