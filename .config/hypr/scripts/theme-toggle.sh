#!/usr/bin/env bash

WALL_DIR="$HOME/Pictures/hyprland/wallpaper"
CONFIG="$HOME/.config/hypr/wallpaper.conf"
LOCK_DIR="$HOME/Pictures/hyprland/hyprlock"

chosen=$(ls "$WALL_DIR" | sed 's/.css//' | rofi -dmenu -p "Pilih tema:")


[ -z "$chosen" ] && exit
SELECTED="$WALL_DIR/$chosen"


matugen image $HOME/Pictures/hyprland/wallpaper/$chosen

cp $SELECTED $LOCK_DIR/hyprlock.jpg
magick $LOCK_DIR/hyprlock.jpg -resize x702 -gravity center -crop 1024x702+0+0 +repage $LOCK_DIR/rofi-bg.jpg

echo "exec-once = swww img $LOCK_DIR/hyprlock.jpg --transition-type any --transition-fps 60 --transition-duration 1 > "$CONFIG"
