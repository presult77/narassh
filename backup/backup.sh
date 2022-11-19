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
clear
IP=$(wget -qO- ipinfo.io/ip);
domain=$(cat /root/scdomain)
date=$(date +"%Y-%m-%d")
clear
email=$(cat /home/email)
if [[ "$email" = "" ]]; then
echo "Masukkan Email Untuk Menerima Backup"
read -rp "Email : " -e email
cat <<EOF>>/home/email
$email
EOF
fi
clear
echo "Mohon Menunggu , Proses Backup sedang berlangsung !!"
rm -rf /root/backup
mkdir /root/backup
cp /etc/passwd backup/
cp /etc/group backup/
cp /etc/shadow backup/
cp /etc/gshadow backup/
cp -r /var/lib/crot/ backup/crot
cd /root
zip -r $domain-$date.zip backup > /dev/null 2>&1
rclone copy /root/$domain-$date.zip dr:backup/
url=$(rclone link dr:backup/$domain-$date.zip)
id=(`echo $url | grep '^https' | cut -d'=' -f2`)
link="https://drive.google.com/u/4/uc?id=${id}&export=download"
echo -e "
Detail Backup 
==================================
IP VPS        : $domain
Link Backup   : $link
Tanggal       : $date
==================================
" | mail -s "Backup Data" $email
rm -rf /root/backup
rm -r /root/$domain-$date.zip
clear
echo -e "
Detail Backup 
==================================
IP VPS        : $domain
Link Backup   : $link
Tanggal       : $date
==================================
"
echo "Silahkan cek Kotak Masuk $email"
