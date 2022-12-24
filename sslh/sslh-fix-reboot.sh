#!/bin/bash
# ==========================================

sleep 20
systemctl stop ssh-ws@80
systemctl stop ssh-ws@8080
pkill python
systemctl stop sslh
systemctl daemon-reload
systemctl disable ssh-ws@80
systemctl disable ssh-ws@8080
systemctl disable sslh
systemctl daemon-reload
systemctl enable sslh
systemctl enable ssh-ws@80
systemctl enable ssh-ws@8080
systemctl start sslh 
/etc/init.d/sslh start 
/etc/init.d/sslh restart 
systemctl start ssh-ws@80
systemctl start ssh-ws@8080
systemctl restart ssh-ws@80
systemctl restart ssh-ws@8080
sleep 20
restart
