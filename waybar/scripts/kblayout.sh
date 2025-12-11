#!/bin/bash

layout=$(localectl status 2>/dev/null | awk -F: '/Layout/ {gsub(/^ +| +$/, "", $2); print $2; exit}')

if [ -z "$layout" ]; then
  layout="unk"
fi

echo " $layout"
