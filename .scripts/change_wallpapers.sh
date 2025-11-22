#!/bin/bash

WALLPAPER_DIR="$HOME/Pictures/wallpapers"
while true; do
    FILE=$(find "$WALLPAPER_DIR" -type f | shuf -n1)
    export CURRENT_WALLPAPER="$FILE"
    hyprlock --bg "$CURRENT_WALLPAPER"
    swaybg -m fill -i "$FILE" &
    sleep 600
done
