#!/bin/sh
echo | grep -C 0 "UDP link remote" /var/log/system.log | tail -1 | cut -d ']' -f 3 | cut -d ':' -f 1
