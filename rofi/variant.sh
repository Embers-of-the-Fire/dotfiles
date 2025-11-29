#!/usr/bin/env bash

RUN_PROGRAM="Run Program"
FIND_WINDOW="Find Window"
GENERIC="Generic"

case "$1" in
  "$RUN_PROGRAM")
    setsid env LANG=zh_CN.utf-8 rofi -show drun -show-icons -theme "launchpad" >/dev/null 2>&1 &
    exit 0
    ;;
  "$FIND_WINDOW")
    setsid env LANG=zh_CN.utf-8 rofi -show window -show-icons -theme "rounded-blue-dark" >/dev/null 2>&1 &
    exit 0
    ;;
  "$GENERIC")
    setsid env LANG=zh_CN.utf-8 rofi -show combi -combi-modi drun,window -show-icons -theme "rounded-blue-dark" >/dev/null 2>&1 &
    exit 0
    ;;
esac

echo "$RUN_PROGRAM"
echo "$FIND_WINDOW"
echo "$GENERIC"

