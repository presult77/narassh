#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
clear
read -p "         Username       :  " User
egrep "^$User" /etc/passwd >/dev/null
if [ $? -eq 0 ]; then
read -p "         Day Extend     :  " Days
clear
echo -e ""
echo -e "Account Successfully Renewed"
echo -e "======================"
echo -e "Username   : $User"
echo -e "Days Added : $Days Days"
echo -e "Expires on : Check Panel"
echo -e "======================"
else
exit
fi