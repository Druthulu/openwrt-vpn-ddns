# openwrt-vpn-ddns
Reads system.log for vpn connection IP address. For use in OpenWRT LuCI / Services / Dynamic DNS / "Edit" / Advanced / Script. filepaths are relative. mark as u+x
created for no-ip.com script , not sure if other log format is different. but adaptable if you know how

Version 2
reduced to a single line, no extra logs or files created during echo of vpn ip address.
(for troubleshooting, use version 1 as its more verbose about its actions to see where the issue happens)