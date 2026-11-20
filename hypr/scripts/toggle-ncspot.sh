#!/usr/bin/env bash

session_name="ncspot"

"$HOME/.config/hypr/scripts/start-ncspot.sh"

if hyprctl clients -j | grep -q '"class": "ncspot"'; then
  hyprctl dispatch 'hl.dsp.workspace.toggle_special("ncspot")'
  exit 0
fi

kitty --class ncspot -e tmux attach-session -t "$session_name" &
disown

# La regla de ventana la envía oculta a special:ncspot; después la mostramos.
sleep 0.3
hyprctl dispatch 'hl.dsp.workspace.toggle_special("ncspot")'
