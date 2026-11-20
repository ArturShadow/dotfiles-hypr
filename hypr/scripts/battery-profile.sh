#!/bin/bash

BAT_PATH="/sys/class/power_supply/BAT1"
START_FILE="$BAT_PATH/charge_control_start_threshold"
END_FILE="$BAT_PATH/charge_control_end_threshold"

PROFILE="$1"

if [ ! -f "$START_FILE" ] || [ ! -f "$END_FILE" ]; then
  notify-send "Batería" "Tu equipo no soporta charge thresholds en $BAT_PATH"
  exit 1
fi

case "$PROFILE" in
desk)
  START=70
  END=80
  LABEL="Desk"
  ;;
normal)
  START=40
  END=90
  LABEL="Normal"
  ;;
travel)
  START=50
  END=100
  LABEL="Travel"
  ;;
full)
  START=0
  END=100
  LABEL="Full"
  ;;
status)
  CURRENT_START=$(cat "$START_FILE")
  CURRENT_END=$(cat "$END_FILE")
  echo "Perfil actual: ${CURRENT_START}% - ${CURRENT_END}%"
  exit 0
  ;;
*)
  echo "Uso: $0 {desk|normal|travel|full|status}"
  exit 1
  ;;
esac

echo "$START" | sudo tee "$START_FILE" >/dev/null
echo "$END" | sudo tee "$END_FILE" >/dev/null

notify-send "Perfil de batería" "$LABEL: carga de ${START}% a ${END}%"
echo "Perfil aplicado: $LABEL (${START}% - ${END}%)"
