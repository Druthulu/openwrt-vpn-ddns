# openwrt-vpn-ddns
Reads system.log for vpn connection IP address. For use in OpenWRT LuCI / Services / Dynamic DNS / "Edit" / Advanced / Script. filepaths are relative. mark as u+x
created for no-ip.com script , not sure if other log format is different. but adaptable if you know how

Version 2
reduced to a single line, no extra logs or files created during echo of vpn ip address.
(for troubleshooting, use version 1 as its more verbose about its actions to see where the issue happens)

echo | grep "UDP link remote" /var/log/system.log | tail -1 | cut -d ']' -f 3 | cut -d ':' -f 1

There was very little discussion on the format of this file, if it needed to be encoded or returned as a variable etc.
If you are here then you have need of assigning a custom dynamic IP to ddns, say from a vpn, via a script.

I will break down the script here

echo means return a value
| is pipe, google it
grep will search a file or output
"somestring" is our search pattern, this must be a unique value to that line, its alright if there are duplicate lines.
/var/log/system.log is the location of the log file where our vpn logs the ip address to
tail -1 uses the last line in the results. This prevents old vpn addresses from being read from the log file
cut uses a delimiter and a field value, I cut at the first of 2 ']' and select field 3, then cut at ':' and select field 1

Here is the line of log I used to create this script:

Wed Sep xx xx:xx:xx 2020 daemon.notice openvpn(CAMontreal)[28884]: UDP link remote: [AF_INET]xxx.xxx.xxx.xxx:XXXX

This was designed using openvpn and ddns on openWRT to solve an issue of revolving IP address from daily VPN changes for a game server. 
hostname:port is now used and ddns updates itself with the new VPN address everytime it changes.

Future Plans:
Integrate Port Forwarding for service WAN access on a dynamic VPN, or determine that should be solely in openvpn setup and ignore
