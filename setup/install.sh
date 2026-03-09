#!/bin/bash
echo "Installing WiFi Extender Dependencies"
sudo apt update
sudo apt install -y hostapd dnsmasq python3 python3-pip
pip3 install flask
echo "Setup complete"

