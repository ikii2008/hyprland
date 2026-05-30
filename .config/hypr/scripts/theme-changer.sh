#!/usr/bin/env bash

THEME_DIR="$HOME/.config/waybar/themes"
CONFIG="$HOME/.config/waybar/"
THEME_FILE="$HOME/.config/waybar/style.css"
ROFI_THEME="$HOME/.config/rofi/themes"
ROFI_CONFIG="$HOME/.config/rofi"
WLOGOUT_THEME="$HOME/.config/wlogout/themes"
WLOGOUT_CONFIG="$HOME/.config/wlogout"
HYPRLOCK_THEME="$HOME/.config/hypr/HyprlockThemes"
HYPRLOCK_CONFIG="$HOME/.config/hypr"
SWAY_THEME="$HOME/.config/swaync/themes"
SWAY_CONFIG="$HOME/.config/swaync"
chosen=$(ls "$THEME_DIR" | rofi -dmenu -p "Pilih tema:")


[ -z "$chosen" ] && exit
SELECTED="$THEME_DIR/$chosen"

rm $THEME_FILE
cp $SELECTED $CONFIG/style.css


rm $ROFI_CONFIG/style.rasi
case "$chosen" in
    dark.css)
        cp $ROFI_THEME/dark.rasi $ROFI_CONFIG/style.rasi
        ;;
    matugen.css)
        cp $ROFI_THEME/matugen.rasi $ROFI_CONFIG/style.rasi
        ;;
esac

rm $WLOGOUT_CONFIG/style.css
case "$chosen" in
    dark.css)
        cp $WLOGOUT_THEME/dark.css $WLOGOUT_CONFIG/style.css
        ;;
    matugen.css)
        cp $WLOGOUT_THEME/matugen.css $WLOGOUT_CONFIG/style.css
        ;;
esac

rm $HYPRLOCK_CONFIG/hyprlock.conf
case "$chosen" in
    dark.css)
        cp $HYPRLOCK_THEME/dark.conf $HYPRLOCK_CONFIG/hyprlock.conf
        ;;
    matugen.css)
        cp $HYPRLOCK_THEME/matugen.conf $HYPRLOCK_CONFIG/hyprlock.conf
        ;;
esac

rm $SWAY_CONFIG/style.css
case "$chosen" in
    dark.css)
        cp $SWAY_THEME/dark.css $SWAY_CONFIG/style.css
        ;;
    matugen.css)
        cp $SWAY_THEME/matugen.css $SWAY_CONFIG/style.css
        ;;
esac

~/.config/hypr/scripts/RefreshWaybar.sh

