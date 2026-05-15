#!/bin/bash

# IP local (rápido y confiable)
ip_local=$(ip -4 addr show wlan0| awk '/inet / {print $2}' | cut -d/ -f1)

# Si quieres la IP pública, descomenta esto (requiere curl):
#ip_local=$(curl -s https://api.ipify.org)

echo "󰩠 $ip_local"


