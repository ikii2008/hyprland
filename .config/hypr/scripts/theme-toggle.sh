#!/usr/bin/env bash

WALL_DIR="$HOME/Pictures/hyprland/wallpaper"
CONFIG="$HOME/.config/hypr/configs/wallpaper.conf"
TARGET_DIR="$HOME/.config/hypr/wallpaper"

chosen=$(ls "$WALL_DIR" | sed 's/.css//' | rofi -dmenu -p "Pilih tema:")

[ -z "$chosen" ] && exit
SELECTED="$WALL_DIR/$chosen"

matugen image --source-color-index 0 $HOME/Pictures/hyprland/wallpaper/$chosen

cp $SELECTED $TARGET_DIR/wallpaper.jpg
magick $TARGET_DIR/wallpaper.jpg -resize x702 -gravity center -crop 1024x702+0+0 +repage $TARGET_DIR/rofi-bg.jpg

echo "exec-once = awww img $TARGET_DIR/wallpaper.jpg --transition-type any --transition-fps 60 --transition-duration 1" > "$CONFIG"
