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
# Getting
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
domain=$(cat /root/scdomain)
clear
read -p "Username : " Login
read -p "Password : " Pass
read -p "Expired (Days): " masaaktif

IP=$(wget -qO- ipinfo.io/ip);
ws="$(cat ~/log-install.txt | grep -w "Websocket TLS" | cut -d: -f2|sed 's/ //g')"
ws2="$(cat ~/log-install.txt | grep -w "Websocket None TLS" | cut -d: -f2|sed 's/ //g')"
ssl="$(cat ~/log-install.txt | grep -w "Stunnel5" | cut -d: -f2)"
clear
systemctl restart ws-tls
systemctl restart ws-nontls
systemctl restart ssh-ohp
systemctl restart dropbear-ohp
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
expi="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
hariini=`date -d "0 days" +"%Y-%m-%d"`
expi=`date -d "$masaaktif days" +"%Y-%m-%d"`
echo -e ""
echo -e "═══════════════════════" | lolcat
echo -e "Informasi SSH Premium"
echo -e "═══════════════════════" | lolcat
echo -e "IP/Host             : $IP" | lolcat
echo -e "Domain              : $domain" | lolcat
echo -e "Username            : $Login" | lolcat
echo -e "Password            : $Pass" | lolcat
echo -e "═══════════════════════" | lolcat
echo -e "OpenSSH             : 22" | lolcat
echo -e "Dropbear            : 443, 109, 143" | lolcat
echo -e "SSL/TLS             :$ssl" | lolcat
echo -e "═══════════════════════" | lolcat
echo -e "OHP SSH             : 8181" | lolcat
echo -e "OHP Dropbear        : 8282" | lolcat
echo -e "═══════════════════════" | lolcat
echo -e "SSH Websocket SSL   : 443" | lolcat
echo -e "SSH Websocket HTTP  : 8880" | lolcat
echo -e "═══════════════════════" | lolcat
echo -e "BadVPN UDPGW        : 7100,7200,7300" | lolcat
echo -e "═══════════════════════" | lolcat
echo -e "PAYLOAD WS HTTP" | lolcat
echo -e "═══════════════════════" | lolcat
echo -e "GET / HTTP/1.1[crlf]Host: ${domain}[crlf]Connection: Keep-Alive[crlf]User-Agent: [ua][crlf]Upgrade: websocket[crlf][crlf]" | lolcat
echo -e "═══════════════════════" | lolcat
echo -e "PAYLOAD WS SSL" | lolcat
echo -e "═══════════════════════" | lolcat
echo -e "GET wss://bug.com/ HTTP/1.1[crlf]Host: ${domain}[crlf]Connection: Keep-Alive[crlf]User-Agent: [ua][crlf]Upgrade: websocket[crlf][crlf]" | lolcat
echo -e "═══════════════════════" | lolcat
echo -e "Created             : $hariini" | lolcat
echo -e "Expired             : $expi" | lolcat
echo -e "═══════════════════════" | lolcat
