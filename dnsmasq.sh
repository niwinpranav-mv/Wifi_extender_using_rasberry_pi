# /etc/dnsmasq.conf
interface=wlan1
dhcp-range=192.168.4.2,192.168.4.20,255.255.255.0,24h
domain=wlan
address=/gw.wlan/192.168.4.1
bogus-priv
server=8.8.8.8
server=8.8.4.4
