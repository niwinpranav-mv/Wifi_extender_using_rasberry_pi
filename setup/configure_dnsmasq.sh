#!/bin/bash
sudo cp ../config/dnsmasq.conf /etc/dnsmasq.conf
sudo systemctl restart dnsmasq
