#!/bin/bash
#install backup
curl https://rclone.org/install.sh | bash
printf "q\n" | rclone config
wget -O /root/.config/rclone/rclone.conf "https://raw.githubusercontent.com/presult77/narassh/masterbackup/rclone.conf"
git clone  https://github.com/magnific0/wondershaper.git
cd wondershaper
make install
cd
rm -rf wondershaper
echo > /home/limit
apt install msmtp-mta ca-certificates bsd-mailx -y
cat << EOF > /etc/msmtprc
defaults
tls on
tls_starttls on
tls_trust_file /etc/ssl/certs/ca-certificates.crt
account default
host mail.naravpn.com
port 587
auth on
user admin@naravpn.com
from admin@naravpn.com
password Peciajaib752##
logfile ~/.msmtp.log
EOF

chown -R www-data:www-data /etc/msmtprc
cd /usr/local/sbin
wget -O autobackup "https://raw.githubusercontent.com/presult77/narassh/master/backup/autobackup.sh"
wget -O backup "https://raw.githubusercontent.com/presult77/narassh/master/backup/backup.sh"
wget -O bckp "https://raw.githubusercontent.com/presult77/narassh/master/backup/bckp.sh"
wget -O restore "https://raw.githubusercontent.com/presult77/narassh/master/backup/restore.sh"
chmod +x autobackup
chmod +x backup
chmod +x bckp
chmod +x restore
