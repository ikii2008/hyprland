#!/usr/bin/env bash

TMP_DIR="$HOME/.config/hypr/tmp"
SAVE_DIR="$HOME/Pictures/Screenshots"

rm -f "$TMP_DIR"/*

# Jalankan hyprshot
hyprshot -z -m region -s -o "$TMP_DIR" 2>/dev/null

sleep 0.5

# Ambil file terbaru kalau ada
FILE=$(ls -t "$TMP_DIR"/* 2>/dev/null | head -1)

# Cek apakah file benar-benar ada
if [[ -f "$FILE" ]]; then
    cp "$FILE" "$SAVE_DIR/$(basename "$FILE")"
    
    notify-send -i "$SAVE_DIR/$(basename "$FILE")" "Screenshot copied"
fi
