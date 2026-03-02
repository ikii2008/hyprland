#!/usr/bin/env bash

rm ~/.config/hypr/tmp/*

hyprshot -z -m region -s -o ~/.config/hypr/tmp 2>/dev/null

sleep 0.5

FILE=$(ls -t ~/.config/hypr/tmp/* | head -1)

sleep 0.5

cp "$FILE" "/home/iki/Pictures/Screenshots/$(basename "$FILE")"

sleep 0.5

notify-send -i "/home/iki/Pictures/Screenshots/$(basename "$FILE")" "copied"
