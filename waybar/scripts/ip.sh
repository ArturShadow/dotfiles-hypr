#!/bin/bash

# Obtiene la IP de la interfaz usada por la ruta predeterminada, sin asumir wlan0.
ip_local=$(ip -4 route get 1.1.1.1 2>/dev/null | awk '{
    for (i = 1; i <= NF; i++) {
        if ($i == "src") {
            print $(i + 1)
            exit
        }
    }
}')

connectivity=$(nmcli -t -f CONNECTIVITY general 2>/dev/null)
has_internet=false

if [[ "$connectivity" == "full" ]]; then
    has_internet=true
elif [[ -z "$connectivity" ]] && ping -q -c 1 -W 1 1.1.1.1 >/dev/null 2>&1; then
    has_internet=true
fi

if [[ -n "$ip_local" && "$has_internet" == true ]]; then
    printf '{"text":"󰓨","tooltip":"Connected\\nIP: %s","class":"online"}\n' "$ip_local"
else
    tooltip="No internet connection"
    [[ -n "$ip_local" ]] && tooltip="No internet\\nLocal IP: $ip_local"
    printf '{"text":"󰓭","tooltip":"%s","class":"offline"}\n' "$tooltip"
fi
