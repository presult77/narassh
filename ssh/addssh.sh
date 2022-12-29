#!/bin/bash
# ==========================================
# Getting
MYIP=$(wget -qO- ipinfo.io/ip);
domain=$(cat /root/scdomain)
clear
read -p "Username : " Login
read -p "Expired (Days): " masaaktif

IP=$(wget -qO- ipinfo.io/ip);
ws="$(cat ~/log-install.txt | grep -w "Websocket TLS" | cut -d: -f2|sed 's/ //g')"
ws2="$(cat ~/log-install.txt | grep -w "Websocket None TLS" | cut -d: -f2|sed 's/ //g')"
ssl="$(cat ~/log-install.txt | grep -w "Stunnel5" | cut -d: -f2)"
clear
random=`</dev/urandom tr -dc X-Z0-9 | head -c4`
Pass=$Login$random
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
expi="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
hariini=`date -d "0 days" +"%Y-%m-%d"`
expi=`date -d "$masaaktif days" +"%Y-%m-%d"`
clear
echo -e ""
echo -e "═══════════════════════"
echo -e "Informasi SSH Premium"
echo -e "═══════════════════════"
echo -e "Hostname    : $domain"
echo -e "Username    : $Login"
echo -e "Password    : $Pass"
echo -e "═══════════════════════"
echo -e "OpenSSH     : 22"
echo -e "Dropbear    : 443, 109, 143"
echo -e "SSL/TLS     :$ssl"
echo -e "═══════════════════════"
echo -e "OHP SSH     : 8181"
echo -e "OHP Dropbear: 8282"
echo -e "═══════════════════════"
echo -e "SSH Ws SSL  : 443"
echo -e "SSH Ws HTTP : 80, 8080"
echo -e "═══════════════════════"
echo -e "BadVPN      : 7100,7200,7300"
echo -e "═══════════════════════"
echo -e "PAYLOAD WS HTTP"
echo -e "═══════════════════════"
echo -e "GET / HTTP/1.1[crlf]Host: ${domain}[crlf]Connection: Keep-Alive[crlf]User-Agent: [ua][crlf]Upgrade: websocket[crlf][crlf]"
echo -e "═══════════════════════"
echo -e "PAYLOAD WS SSL"
echo -e "═══════════════════════"
echo -e "GET wss://bug.com/ HTTP/1.1[crlf]Host: ${domain}[crlf]Connection: Keep-Alive[crlf]User-Agent: [ua][crlf]Upgrade: websocket[crlf][crlf]"
echo -e "═══════════════════════"
echo -e "Created     : $hariini"
echo -e "Expired     : $expi"
echo -e "═══════════════════════"
sleep 2
systemctl restart ssh-ohp
systemctl restart dropbear-ohp
