#!/usr/bin/env bash

case "$(playerctl --player=ncspot status 2>/dev/null)" in
  Playing) printf '\n' ;;
  Paused)  printf '\n' ;;
  *)       printf '\n' ;;
esac
