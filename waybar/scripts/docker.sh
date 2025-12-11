#!/bin/sh

# Si docker no está disponible o no hay permisos, mostrar "?"
if ! docker ps >/dev/null 2>&1; then
  echo " ?"
  exit 0
fi

# Si sí tenemos acceso, contar contenedores
count=$(docker ps -q 2>/dev/null | wc -l)

# Asegurar siempre un número
if [ -z "$count" ]; then
  count=0
fi

echo " $count"
