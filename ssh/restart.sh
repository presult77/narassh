#!/bin/bash
# ==========================================
clear
echo -e ""
echo -e "Starting Restart All Service"
sleep 2
systemctl stop ssh-ws
systemctl start sslh
systemctl restart sslh
/etc/init.d/sslh start
/etc/init.d/sslh restart
systemctl restart ssh-ws
systemctl restart ssh-ohp
systemctl restart dropbear-ohp
/etc/init.d/ssh restart
/etc/init.d/dropbear restart
/etc/init.d/sslh restart
/etc/init.d/stunnel5 restart
/etc/init.d/fail2ban restart
/etc/init.d/cron restart
/etc/init.d/nginx restart
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 1000
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 1000
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 1000
echo -e "Restart All Service Berhasil"
