#!/usr/bin/env zsh

FILE="$HOME/Theme/Wallpaper/output.mp4"
FILE=${~FILE}
TITLE="Wallpaper Not Found"
BODY="Wallpaper not found in $FILE\nPlease check if the file exists"

if [[ -f "$FILE" && -s "$FILE" ]]; then
  setsid mpvpaper -o "no-audio loop" --auto-pause  ALL "$FILE" \
    >/dev/null 2>&1 &
  exit 0
fi

notify-send "$TITLE" "$BODY"

exit 1

