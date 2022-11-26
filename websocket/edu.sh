#!/bin/bash
# Proxy For Edukasi & Imclass
# ==========================================

# Getting Proxy Template
wget -q -O /usr/local/bin/ssh-ws https://raw.githubusercontent.com/presult77/narassh/master/websocket/websocket.py
chmod +x /usr/local/bin/ssh-ws

# Installing Service
cat > /etc/systemd/system/ssh-ws.service << END
[Unit]
Description=NARAVPN
Documentation=NARAVPN
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /usr/local/bin/ssh-ws 80
Restart=on-failure

[Install]
WantedBy=multi-user.target
END

systemctl daemon-reload
systemctl enable ssh-ws
systemctl restart ssh-ws
