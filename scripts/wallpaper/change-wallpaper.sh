#!/usr/bin/env bash
set -x

if [ "$XDG_CURRENT_DESKTOP" == "Hyprland" ]; then
  SCRIPT_DIRECTORY="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
  DIRECTORY="$SCRIPT_DIRECTORY/pictures"
  WALLPAPER=$(ls $DIRECTORY | shuf -n 1)
  FINAL="$SCRIPT_DIRECTORY/pictures/$WALLPAPER"

  wal -i "$FINAL"
  hyprctl hyprpaper unload all
  hyprctl hyprpaper preload "$FINAL"
  hyprctl hyprpaper wallpaper "DP-2,$FINAL"
  killall -SIGUSR2 waybar
  pkill dunst
  mkdir -p /home/pika/.config/dunst
  rm /home/pika/.config/dunst/dunstrc
  cp /home/pika/.cache/wal/dunstrc /home/pika/.config/dunst/dunstrc
  dunst
fi
