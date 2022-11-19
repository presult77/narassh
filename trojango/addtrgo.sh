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
clear
uuid=$(cat /etc/trojan-go/uuid.txt)
source /var/lib/crot/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/xray/domain)
else
domain=$IP
fi
read -rp "Masukkan Bug: " -e bug
trgo="$(cat ~/log-install.txt | grep -w "TrojanGo" | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${user_EXISTS} == '0' ]]; do
		read -rp "Password : " -e user
		user_EXISTS=$(grep -w $user /etc/trojan-go/akun.conf | wc -l)

		if [[ ${user_EXISTS} == '1' ]]; then
			echo ""
			echo -e "Username ${RED}${user}${NC} Already On VPS Please Choose Another"
			exit 1
		fi
	done
read -p "Expired (Days) : " masaaktif
sed -i '/"'""$uuid""'"$/a\,"'""$user""'"' /etc/trojan-go/config.json
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
hariini=`date -d "0 days" +"%Y-%m-%d"`
echo -e "### $user $exp" >> /etc/trojan-go/akun.conf
systemctl restart trojan-go.service
link="trojan-go://${user}@${bug}:${trgo}/?sni=${domain}&type=ws&host=${domain}&path=/trojango&encryption=none#$user"
clear
echo -e ""
echo -e "══════════════════════════" | lolcat
echo -e "${RED}=====-TROJAN-GO-====${NC}"
echo -e "══════════════════════════" | lolcat
echo -e "Remarks    : ${user}" | lolcat
echo -e "IP/Host    : ${MYIP}" | lolcat
echo -e "Address    : ${domain}" | lolcat
echo -e "Port       : ${trgo}" | lolcat
echo -e "Key        : ${user}" | lolcat
echo -e "Encryption : none" | lolcat
echo -e "Bug.       : ${bug}" | lolcat
echo -e "Path       : /trojango" | lolcat
echo -e "Created    : $hariini" | lolcat
echo -e "Expired    : $exp" | lolcat
echo -e "══════════════════════════" | lolcat
echo -e "${RED}Link Trojan-Go${NC}  : "
echo -e "═══════════════" | lolcat
echo -e " ${link}" | lolcat
echo -e "=============================" | lolcat
echo -e "========Config Yaml==========" | lolcat
echo -e "=============================" | lolcat
echo -e "proxies:" | lolcat
echo -e "  - name: TrojanGo"
echo -e "    server: ${bug}" | lolcat
echo -e "    port: ${trgo}" | lolcat
echo -e "    password: ${user}" | lolcat
echo -e "    network: ws" | lolcat
echo -e "    sni: ${domain}" | lolcat
echo -e "    skip-cert-verify: true" | lolcat
echo -e "    udp: true" | lolcat
echo -e "    ws-opts:" | lolcat
echo -e "     path: /trojan-go" | lolcat
echo -e "     headers:" | lolcat
echo -e "      Host: ${domain}" | lolcat
echo -e "══════════════════════════" | lolcat
echo -e "${RED}AutoScript Premium${NC}"
echo -e "══════════════════════════" | lolcat
echo -e""
read -p "Ketik Enter Untuk Kembali Ke Menu...."
sleep 1
menu
exit 0
fi
