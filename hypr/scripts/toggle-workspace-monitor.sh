#!/bin/sh

set -eu

current_monitor=$(hyprctl activeworkspace -j | jq -r '.monitor')

case "$current_monitor" in
    HDMI-A-1)
        target_monitor="eDP-1"
        ;;
    eDP-1)
        target_monitor="HDMI-A-1"
        ;;
    *)
        notify-send "Hyprland" "Monitor no contemplado: $current_monitor"
        exit 1
        ;;
esac

hyprctl dispatch movecurrentworkspacetomonitor "$target_monitor"
