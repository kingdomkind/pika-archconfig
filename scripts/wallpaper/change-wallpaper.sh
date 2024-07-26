#/usr/bin/env bash
# set -x

SCRIPT_DIRECTORY="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
echo "Script is located in: $SCRIPT_DIRECTORY"
WALLPAPER_FILE="$SCRIPT_DIRECTORY/wallpaper.txt"
DIRECTORY="$SCRIPT_DIRECTORY/pictures"
  
if [ ! -f "$WALLPAPER_FILE" ]; then
	touch "$WALLPAPER_FILE"
fi

while true; do
	WALLPAPER=$(ls "$DIRECTORY" | shuf -n 1)
	if [ "$WALLPAPER" != "$(cat "$WALLPAPER_FILE" 2>/dev/null)" ]; then
		break
	fi
done
echo "$WALLPAPER" > "$WALLPAPER_FILE"

FINAL="$SCRIPT_DIRECTORY/pictures/$WALLPAPER"
feh --bg-fill --no-fehbg "$FINAL"
wal -s -t -i "$FINAL"
pkill dunst
mkdir -p /home/pika/.config/dunst
rm /home/pika/.config/dunst/dunstrc
cp /home/pika/.cache/wal/dunstrc /home/pika/.config/dunst/dunstrc
dunst
