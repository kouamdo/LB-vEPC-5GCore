#!/usr/bin/bash

ip link set up tunl0 && 
ip addr add 20.20.20.1 dev tunl0 && 
sysctl -w net.ipv4.conf.tunl0.rp_filter=0 && 
sysctl -w net.ipv4.conf.all.arp_ignore=1 && 
sysctl -w net.ipv4.conf.all.arp_announce=2 && 
sysctl -w net.ipv4.conf.tunl0.arp_ignore=1 && 
sysctl -w net.ipv4.conf.tunl0.arp_announce=2 && 
sysctl -w net.ipv4.conf.tunl0.rp_filter=2 && 
apt-get update && 
apt-get install tcpdump inetutils-ping -y && 
echo 1 > /proc/sys/net/ipv4/ip_forward && 
sleep 5