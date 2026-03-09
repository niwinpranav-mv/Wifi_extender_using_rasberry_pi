#!/bin/bash
# Wi-Fi Range Extender - Raspberry Pi Setup Script
# Author: [Your Name] | Faculty: [Faculty Name]
 
set -e
echo '=== Wi-Fi Range Extender Setup ==='
 
# Update system
sudo apt-get update && sudo apt-get upgrade -y
 
# Install required packages
sudo apt-get install -y hostapd dnsmasq python3 python3-pip git
pip3 install flask
 
# Stop services during config
sudo systemctl stop hostapd dnsmasq
 
# Configure static IP for wlan1 (AP interface)
sudo bash -c 'cat >> /etc/dhcpcd.conf << EOF
interface wlan1
    static ip_address=192.168.4.1/24
    nohook wpa_supplicant
EOF'
 
# Copy configuration files
sudo cp config/hostapd.conf /etc/hostapd/hostapd.conf
sudo cp config/dnsmasq.conf /etc/dnsmasq.conf
 
# Enable IP forwarding
sudo sed -i 's/#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/' /etc/sysctl.conf
sudo sysctl -p
 
# Set up NAT with iptables
sudo iptables -t nat -A POSTROUTING -o wlan0 -j MASQUERADE
sudo sh -c 'iptables-save > /etc/iptables.ipv4.nat'
 
# Enable and start services
sudo systemctl unmask hostapd
sudo systemctl enable hostapd dnsmasq
sudo systemctl start hostapd dnsmasq
 
echo '=== Setup Complete! Rebooting in 5s ==='
sleep 5 && sudo reboot
