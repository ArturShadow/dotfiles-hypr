#!/bin/bash

NORMAL_SENSITIVITY=0
PRECISION_SENSITIVITY=-0.8

CURRENT_SENSITIVITY="$(
  hyprctl getoption input:sensitivity |
    awk '/^float:/{print $2; exit}'
)"

if [ -z "$CURRENT_SENSITIVITY" ]; then
  notify-send "Sensibilidad del mouse" "No se pudo consultar la sensibilidad actual"
  exit 1
fi

if awk "BEGIN { exit !($CURRENT_SENSITIVITY < -0.4) }"; then
  TARGET_SENSITIVITY="$NORMAL_SENSITIVITY"
  MODE="Normal"
else
  TARGET_SENSITIVITY="$PRECISION_SENSITIVITY"
  MODE="Precisión"
fi

if hyprctl keyword input:sensitivity "$TARGET_SENSITIVITY" >/dev/null; then
  notify-send "Sensibilidad del mouse" "$MODE: $TARGET_SENSITIVITY"
else
  notify-send "Sensibilidad del mouse" "No se pudo activar el modo $MODE"
  exit 1
fi
