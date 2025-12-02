#!/bin/sh

export WAYLAND_DISPLAY=wayland-1
export XDG_SESSION_TYPE=wayland
export XDG_RUNTIME_DIR=/run/user/$UID
export G_MESSAGES_DEBUG=all
eval $(dbus-launch)

gtkgreet -l

niri msg action quit --skip-confirmation

