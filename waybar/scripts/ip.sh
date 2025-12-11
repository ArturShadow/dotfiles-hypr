#!/bin/bash

# IP local (rápido y confiable)
ip_local=$(ip route get 1 | awk '{print $7; exit}')

# Si quieres la IP pública, descomenta esto (requiere curl):
# ip_local=$(curl -s https://api.ipify.org)

echo "󰩠 $ip_local"
