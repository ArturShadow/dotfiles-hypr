#!/usr/bin/env bash

if ! tmux has-session -t ncspot 2>/dev/null; then
  tmux new-session -d -s ncspot ncspot
fi

# Permitir que ncspot reciba clics, rueda y cambios de foco a través de tmux.
tmux set-option -t ncspot mouse on
tmux set-option -t ncspot focus-events on
tmux set-option -t ncspot status off
