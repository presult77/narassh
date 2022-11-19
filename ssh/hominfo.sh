#!/bin/bash
yl='\e[32;1m'
bl='\e[36;1m'
gl='\e[32;1m'
rd='\e[31;1m'
mg='\e[0;95m'
blu='\e[34m'
op='\e[35m'
or='\033[1;33m'
bd='\e[1m'
color1='\e[031;1m'
color2='\e[34;1m'
color3='\e[0m'
clear
MYIP2=$(wget -qO- icanhazip.com);
clear 
echo -e  "     "
# Getting
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################
echo -e ""
toilet --gay -f slant -t "SSN SCRIPT"
harini=`date -d "0 days" +"%d-%m-%Y"`
jam=`date -d "0 days" +"%X"`
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
WKT=$(curl -s ipinfo.io/timezone )
hariini=`date -d "0 days" +"%Y-%m-%d"`
IPVPS=$(curl -s ipinfo.io/ip )
	cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
	cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
	freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
	tram=$( free -h | awk 'NR==2 {print $2}' )
	uram=$( free -m | awk 'NR==2 {print $3}' )
	tmem=$( df -h | awk 'NR==4 {print $2}' )
        umem=$( df -h | awk 'NR==4 {print $3}' )
	swap=$( free -m | awk 'NR==4 {print $2}' )
        uptime=$(uptime -p | cut -d " " -f 2-10)
        kernelku=$(uname -r)
	osku=$( lsb_release -d | awk 'NR==1 {print $2,$3,$4,$5}' )
	host=$( hostname )
	waktu=$(date)
	
source /var/lib/crot/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/xray/domain)
else
domain=$IP
fi
IP=$(wget -qO- ifconfig.me/ip);
	echo -e "\e[033;1m--------------------------\e[0m "
	echo -e "\e[033;1mSystem Info \e[0m($host) :\e[0m "
	echo -e "\e[033;1m--------------------------\e[0m "
	echo -e "\e[033;1mCPU Model:\e[0m $cname"
	echo -e "\e[033;1mNumber Of Cores:\e[0m $cores Core"
	echo -e "\e[033;1mCPU Frequency:\e[0m $freq MHz"
	echo -e "\e[033;1mOS:\e[0m $osku"
	echo -e "\e[033;1mKernel:\e[0m $kernelku"
	echo -e "\e[033;1mTotal RAM:\e[0m $uram/$tram (Usage)"
        echo -e "\e[033;1mTotal Memory:\e[0m $umem/$tmem (Usage)"
	echo -e "\e[033;1mSystem Uptime:\e[0m $uptime"
	echo -e "\e[033;1mIsp Name:\e[0m $ISP"
	echo -e "\e[033;1mCity:\e[0m $CITY"
	echo -e "\e[033;1mTime:\e[0m $WKT"
	echo -e "\e[033;1mIPVPS:\e[0m $IPVPS"
	echo -e "\e[033;1mDomain:\e[0m $domain"
	echo -e "\e[033;1mDate:\e[0m $jam $hariini"
	echo -e "\e[033;1mExpired Date Script:\e[0m $Exp "
	echo -e "\e[033;1m--------------------------\e[0m "