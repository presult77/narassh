#!/bin/bash
cd
echo -e "\e[32;32;32m "
echo "================================================================="
echo "|| Welcome To Script Automatic Install NARAVPN.COM||"
echo "================================================================="
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi
mkdir /var/lib/crot;
echo "IP=" >> /var/lib/crot/ipvps.conf
echo " "
read -rp "Input ur domain : " -e pp
    if [ -z $pp ]; then
        echo -e "
        Nothing input for domain!
        Then a random domain will be created"
    else
        echo "$pp" > /root/scdomain
        echo "IP=$pp" > /var/lib/crot/ipvps.conf
    fi
#install ssh ovpn
wget https://raw.githubusercontent.com/presult77/narassh/master/ssh/ssh-vpn.sh && chmod +x ssh-vpn.sh && sed -i -e 's/\r$//' ssh-vpn.sh && screen -S ssh-vpn ./ssh-vpn.sh
# install screenfetch
cd
wget https://raw.githubusercontent.com/presult77/narassh/master/screenfetch.sh
mv screenfetch.sh /usr/bin/screenfetch
chmod +x /usr/bin/screenfetch
echo "clear" >> .profile
echo "screenfetch | lolcat && welcomeadmin" >> .profile
# install gambar boxes
sudo apt-get install boxes -y
# text warna pelangi
sudo apt-get install ruby -y
gem install lolcat 
wget https://raw.githubusercontent.com/presult77/narassh/master/backup/set-br.sh && chmod +x set-br.sh && sed -i -e 's/\r$//' set-br.sh && ./set-br.sh
# Websocket
wget https://raw.githubusercontent.com/presult77/narassh/master/websocket/edu.sh && chmod +x edu.sh && sed -i -e 's/\r$//' edu.sh && ./edu.sh
# Ohp Server
wget https://raw.githubusercontent.com/presult77/narassh/master/ohp/ohp.sh && chmod +x ohp.sh && sed -i -e 's/\r$//' ohp.sh && ./ohp.sh

rm -f /root/ssh-vpn.sh
rm -f /root/set-br.sh
rm -f /root/edu.sh
rm -f /root/ohp.sh
rm -f /root/install
#rm -f /root/ipsaya

systemctl daemon-reload

history -c
echo "1.2" > /home/ver
echo " "
echo "Installation has been completed!!"echo " "
echo "============================================================================" | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo "----------------------------------------------------------------------------" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "=============================-SSH SEDANG NETWORK-===========================" | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo "----------------------------------------------------------------------------" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Service & Port"  | tee -a log-install.txt
echo "   - OpenSSH                 : 22, 2253"  | tee -a log-install.txt
echo "   - Stunnel5                : 443, 445"  | tee -a log-install.txt
echo "   - Dropbear                : 443, 109, 143"  | tee -a log-install.txt
echo "   - Badvpn                  : 7100, 7200, 7300"  | tee -a log-install.txt
echo "   - Nginx                   : 89"  | tee -a log-install.txt
echo "   - Websocket TLS           : 443"  | tee -a log-install.txt
echo "   - Websocket None TLS      : 8880"  | tee -a log-install.txt
echo "   - OHP SSH                 : 8181"  | tee -a log-install.txt
echo "   - OHP Dropbear            : 8282"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Server Information & Other Features"  | tee -a log-install.txt
echo "   - Timezone                : Asia/Jakarta (GMT +7)"  | tee -a log-install.txt
echo "   - Fail2Ban                : [ON]"  | tee -a log-install.txt
echo "   - Dflate                  : [ON]"  | tee -a log-install.txt
echo "   - IPtables                : [ON]"  | tee -a log-install.txt
echo "   - Auto-Reboot             : [ON]"  | tee -a log-install.txt
echo "   - IPv6                    : [OFF]"  | tee -a log-install.txt
echo "   - Autoreboot On 05.00 GMT +7" | tee -a log-install.txt
echo "   - Autobackup Data" | tee -a log-install.txt
echo "   - Restore Data" | tee -a log-install.txt
echo "   - Auto Delete Expired Account" | tee -a log-install.txt
echo "   - Full Orders For Various Services" | tee -a log-install.txt
echo "   - White Label" | tee -a log-install.txt
echo "   - Installation Log --> /root/log-install.txt"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "------------------Script Mod By Army Phreakers Nusantara-----------------" | tee -a log-install.txt
echo ""
echo " Reboot 15 Sec"
sleep 15
rm -f setup.sh
reboot