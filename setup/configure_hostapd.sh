#!/bin/bash
sudo cp ../config/hostapd.conf /etc/hostapd/hostapd.conf
sudo systemctl restart hostapd
