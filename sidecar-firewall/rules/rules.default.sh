#!/bin/sh

# block everything
iptables -A OUTPUT -j DROP
# allow local loopback traffic
iptables -A OUTPUT -o lo -j ACCEPT
# allow established and related connections
iptables -A OUTPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
# allow dns queries
iptables -I OUTPUT -p udp --dport 53 -j ACCEPT
iptables -I OUTPUT -p tcp --dport 53 -j ACCEPT
# allow docker netork traffic (very lax /8 mask)
iptables -I OUTPUT -d 172.20.0.0/8 -j ACCEPT
