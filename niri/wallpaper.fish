#!/usr/bin/env fish

set -l outputs (niri msg -j outputs | jq -r '.[].name' 2>/dev/null)

if test -z "$outputs"
    notify-send Wallpaper "Found no outputs"
    exit 1
end

set -l missing

for out in $outputs
    if test "$out" != winit
        set -l file "$HOME/Theme/Wallpaper/$out.mp4"
        if test -s "$file"
            setsid mpvpaper -o "no-audio loop" --auto-pause "$out" "$file" >/dev/null 2>&1 &
        else
            set missing $missing $out
        end
    end
end

if test (count $missing) -gt 0
    set -l body "No mp4 found for：\n"
    for m in $missing
        set body "$body - $m -> $HOME/Theme/Wallpaper/$m.mp4\n"
    end
    notify-send "Wallpaper Not Found" "$body"
    exit 1
end

exit 0
