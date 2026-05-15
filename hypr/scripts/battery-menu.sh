    #!/bin/bash

choice=$(printf "desk\nnormal\ntravel\nfull\nstatus" | wofi --dmenu --prompt "Battery profile")

  [ -n "$choice" ] && ~/.config/hypr/scripts/battery-profile.sh "$choice"
