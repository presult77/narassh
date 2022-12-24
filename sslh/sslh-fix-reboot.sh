#!/bin/bash
# ==========================================

sleep 20
systemctl stop ssh-ws80
systemctl stop ssh-ws8080
pkill python
systemctl stop sslh
systemctl daemon-reload
systemctl disable ssh-ws80
systemctl disable ssh-ws8080
systemctl disable sslh
systemctl daemon-reload
systemctl enable sslh
systemctl enable ssh-ws80
systemctl enable ssh-ws8080
systemctl start sslh 
/etc/init.d/sslh start 
/etc/init.d/sslh restart 
systemctl start ssh-ws80
systemctl start ssh-ws8080
systemctl restart ssh-ws80
systemctl restart ssh-ws8080
sleep 20
restart
