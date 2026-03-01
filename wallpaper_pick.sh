#!/bin/bash

WALLPAPER_DIR="$HOME/Vidéos/AnimatedWallpapers"

chosen=$(find "$WALLPAPER_DIR" -type f \( -iname "*.mp4" -o -iname "*.mpeg" -o -iname "*.avi" \) |
  sed "s|$WALLPAPER_DIR/||" |
  fuzzel --dmenu)

[ -z "$chosen" ] && exit 0

echo """loadfile $WALLPAPER_DIR/$chosen""" | socat - /tmp/mpv-socket
