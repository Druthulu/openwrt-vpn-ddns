#!/bin/sh
cp -f /var/log/system.log /etc/_tacotown/s.log
grep -C 0 "UDP link remote" /etc/tacotown/s.log | tail -1 /etc/_tacotown/s2.log
cut -d ']' -f 3 /etc/_tacotown/s2.log | cut -d ':' -f 1 > /etc/_tacotown/vpnip.log
read -r NET_ADDR < /etc/_tacotown/vpnip.log
#for testing
#while read line; do echo "$line"; done < /etc/_tacotown/s2,log
echo "${NET_ADDR}"
