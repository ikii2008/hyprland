#!/usr/bin/env bash

pkill waybar
waybar &

~/.config/hypr/UserScripts/RainbowBorders.sh &

sleep 0.5
swaync-client -R -rs
