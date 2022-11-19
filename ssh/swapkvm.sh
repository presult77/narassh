#!/bin/bash
# JAGOANNEON
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
sleep 1
echo "Cek Izin Akses Script"
IZIN=$( curl http://akses.jagoanneon-premium.xyz:81/akses | grep $MYIP )
if [ $MYIP = $IZIN ]; then
echo -e "${GREEN}Akses Di Izinkan...${NC}"
else
echo -e "${RED}VPS tidak diijinkan${NC}";
echo "Kontak Admin Untuk Mendapatkan Akses Script"
echo "Facebook   : Generasi Ronggolawe Tuban"
echo "WhatsApp   : 083857684916"
exit 0
fi
clear
dd if=/dev/zero of=/swapfile1 bs=1024 count=524288
dd if=/dev/zero of=/swapfile2 bs=1024 count=524288
mkswap /swapfile1
mkswap /swapfile2
chown root:root /swapfile1
chown root:root /swapfile2
chmod 0600 /swapfile1
chmod 0600 /swapfile2
swapon /swapfile1
swapon /swapfile2
sed -i '$ i\swapon /swapfile1' /etc/rc.local
sed -i '$ i\swapon /swapfile2' /etc/rc.local
sed -i '$ i\/swapfile1      swap swap   defaults    0 0' /etc/fstab
sed -i '$ i\/swapfile2      swap swap   defaults    0 0' /etc/fstab
rm -f swapkvm.sh
echo -e "Swap Memori Sukses Bossku....."
sleep 1
fi
clear