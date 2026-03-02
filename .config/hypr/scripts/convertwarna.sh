#!/bin/bash

css_file="$HOME/.config/waybar/wallust/colors.css"
color_name="primary"
wlogout_css="$HOME/.config/wlogout/colors.css"
rofi="$HOME/.config/rofi/wallust/colors-rofi.rasi"


if [ -z "$css_file" ] || [ -z "$color_name" ]; then
    echo "Usage: $0 <colors.css> <primary>"
    exit 1
fi

# Pastikan file ada
if [ ! -f "$css_file" ]; then
    echo "File tidak ditemukan."
    exit 1
fi

# Ambil warna HEX berdasarkan nama warna
hex=$(grep -Po "@define-color\s+${color_name}\s+\K#[0-9A-Fa-f]{6}(?=;)" "$css_file")


if [ -z "$hex" ]; then
    echo "Warna '${color_name}' tidak ditemukan di file."
    exit 1
fi

# Convert HEX → RGB
r=$(printf "%d" 0x${hex:1:2})
g=$(printf "%d" 0x${hex:3:2})
b=$(printf "%d" 0x${hex:5:2})

factor=0.5
offset=20   # tambahin gelap minimal

dark_r=$(printf "%.0f" "$(echo "$r * $factor - $offset" | bc -l)")
dark_g=$(printf "%.0f" "$(echo "$g * $factor - $offset" | bc -l)")
dark_b=$(printf "%.0f" "$(echo "$b * $factor - $offset" | bc -l)")


# Clamp 0–255
dark_r=$((dark_r < 0 ? 0 : (dark_r > 255 ? 255 : dark_r)))
dark_g=$((dark_g < 0 ? 0 : (dark_g > 255 ? 255 : dark_g)))
dark_b=$((dark_b < 0 ? 0 : (dark_b > 255 ? 255 : dark_b)))

dark_hex=$(printf "#%02X%02X%02X" "$dark_r" "$dark_g" "$dark_b")

echo "@define-color primary-dim $dark_hex;" >> $css_file
echo "@define-color primary-dim $dark_hex;" >> $wlogout_css
echo "@define-color primary-dim $dark_hex;" >> ~/.config/swaync/wallust/matugen.css
echo "@define-color primary-dim-transparent ${dark_hex}e6;" >> ~/.config/swaync/wallust/matugen.css
sed -i "/^}/i\ primary-dim-transparent: ${dark_hex}e6;" "$rofi"


echo '''
$charcoal_grey = rgba(3a3a3aff)
$steel_grey = rgba(575757ff)
$mid_grey = rgba(7b7b7bff)
$silver_grey = rgba(949494ff)
$fog_grey  = rgba(b8b8b8ff)
''' >> ~/.config/hypr/colors.conf
