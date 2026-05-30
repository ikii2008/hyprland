
#!/usr/bin/env bash

while true; do
	for file in $(ls -v /home/iki/Pictures/hyprland/wallpaper); do
		sleep 60
		matugen image --source-color-index 0 /home/iki/Pictures/hyprland/wallpaper/$file
		cp /home/iki/Pictures/hyprland/wallpaper/$file /home/iki/.config/hypr/wallpaper/wallpaper.jpg
		
		magick /home/iki/.config/hypr/wallpaper/wallpaper.jpg -resize x702 -gravity center -crop 1024x702+0+0 +repage /home/iki/.config/hypr/wallpaper/rofi-bg.jpg

		~/.config/hypr/scripts/convertwarna.sh
		~/.config/hypr/scripts/RefreshWaybar.sh
	done

	sleep 0.5

done
