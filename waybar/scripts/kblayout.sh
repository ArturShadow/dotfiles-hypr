
#!/bin/bash

keymap=$(hyprctl devices | awk '
BEGIN { inK=0; main=0; km="" }
/^[[:space:]]*Keyboard at / { inK=1; main=0; km="" }
/^[[:space:]]*Tablets:|^[[:space:]]*Touch:|^[[:space:]]*Switches:|^[[:space:]]*mice:|^[[:space:]]*Keyboards:/ { inK=0 }

inK && /active keymap:/ {
  line=$0
  sub(/^[[:space:]]*active keymap:[[:space:]]*/, "", line)
  km=line
}
inK && /^[[:space:]]*main:[[:space:]]*yes/ { main=1 }

inK && main==1 && km!="" { print km; exit }
')

if [[ "$keymap" == *"English (US)"* ]]; then
  echo "  US"
else
  echo "  ES"
fi

