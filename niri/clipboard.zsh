#!/usr/bin/env zsh
#
# clipboard.zsh
#
# A zsh-compatible, single-file daemon to synchronize clipboard (text + images)
# between X11 and Wayland. Intended to be launched when your session (e.g. niri)
# starts. All comments and messages are in English.
#
# Usage:
#   ./clipboard.zsh           # will daemonize by default
#   ./clipboard.zsh --no-daemon  # run in foreground (useful for debugging)
#
# Dependencies: xclip, wl-paste, wl-copy, sha256sum
#

# ----------------------------
# Configuration / colors
# ----------------------------
# Use plain ANSI escape sequences (not zsh prompt escapes) so printf/echo won't
# treat them as format directives.
COLOR_RESET="\033[0m"
COLOR_GREEN="\033[32m"
COLOR_BLUE="\033[34m"
COLOR_YELLOW="\033[33m"
COLOR_CYAN="\033[36m"

# Prefer XDG_RUNTIME_DIR when available
RUNTIME_DIR="${XDG_RUNTIME_DIR:-/tmp}"
PIDFILE="${RUNTIME_DIR}/niri-clipboard-sync.pid"

# ----------------------------
# Logging helpers
# ----------------------------
log() {
  local ts
  ts="$(date '+%H:%M:%S')"
  printf "%b[%s]%b %s\n" "${COLOR_CYAN}" "$ts" "${COLOR_RESET}" "$1"
}

log_sync() {
  local direction=$1
  local type=$2
  local format=$3
  local ts
  ts="$(date '+%H:%M:%S')"

  case "$direction" in
    "x11->wl")
      printf "%b[%s]%b %b✓%b X11 → Wayland | %b%s%b%s\n" \
        "${COLOR_CYAN}" "$ts" "${COLOR_RESET}" "${COLOR_GREEN}" "${COLOR_RESET}" \
        "${COLOR_YELLOW}" "$type" "${COLOR_RESET}" "$format"
      ;;
    "wl->x11")
      printf "%b[%s]%b %b✓%b Wayland → X11 | %b%s%b%s\n" \
        "${COLOR_CYAN}" "$ts" "${COLOR_RESET}" "${COLOR_BLUE}" "${COLOR_RESET}" \
        "${COLOR_YELLOW}" "$type" "${COLOR_RESET}" "$format"
      ;;
  esac
}

# ----------------------------
# Single-instance guard
# ----------------------------
ensure_single_instance() {
  if [[ -f "$PIDFILE" ]]; then
    local oldpid
    oldpid="$(<"$PIDFILE")"
    if [[ -n "$oldpid" && -d "/proc/$oldpid" ]]; then
      printf "Another instance (PID %s) appears to be running; exiting.\n" "$oldpid"
      exit 0
    else
      # stale PID file
      rm -f "$PIDFILE"
    fi
  fi

  # write current PID
  print -n $$ >| "$PIDFILE" || {
    printf "Failed to write PID file %s\n" "$PIDFILE" >&2
    exit 1
  }
}

# ----------------------------
# Dependency check
# ----------------------------
check_dependencies() {
  local missing_deps=()
  local cmd
  for cmd in xclip wl-paste wl-copy sha256sum; do
    if ! command -v "$cmd" >/dev/null 2>&1; then
      missing_deps+=("$cmd")
    fi
  done

  if (( ${#missing_deps[@]} )); then
    printf "Error: missing dependencies: %s\n" "${(j:, :)missing_deps}" >&2
    printf "Please install the required packages and try again.\n" >&2
    rm -f "$PIDFILE" >/dev/null 2>&1
    exit 1
  fi
}

# ----------------------------
# Clipboard sync main loop
# ----------------------------
last_text=""
last_x11_img_hash=""
last_wl_img_hash=""

clipboard_sync() {
  while true; do
    img_synced=false

    # -------- Image sync: X11 -> Wayland --------
    x11_targets="$(xclip -selection clipboard -t TARGETS -o 2>/dev/null || true)"
    x11_img_type=""
    if printf "%s" "$x11_targets" | grep -q "image/png"; then
      x11_img_type="image/png"
    elif printf "%s" "$x11_targets" | grep -q "image/jpeg"; then
      x11_img_type="image/jpeg"
    elif printf "%s" "$x11_targets" | grep -q "image/gif"; then
      x11_img_type="image/gif"
    fi

    if [[ -n "$x11_img_type" ]]; then
      if (( $(xclip -selection clipboard -t "$x11_img_type" -o 2>/dev/null | wc -c) > 0 )); then
        x11_img_hash="$(xclip -selection clipboard -t "$x11_img_type" -o 2>/dev/null | sha256sum | awk '{print $1}')"
        if [[ -n "$x11_img_hash" && "$x11_img_hash" != "$last_x11_img_hash" ]]; then
          # transfer raw image bytes to Wayland clipboard
          xclip -selection clipboard -t "$x11_img_type" -o 2>/dev/null | wl-copy -t "$x11_img_type" --no-newline 2>/dev/null
          last_x11_img_hash="$x11_img_hash"
          last_wl_img_hash="$x11_img_hash"
          img_synced=true
          log_sync "x11->wl" "image" " ($x11_img_type)"
          # clear X11 clipboard
          printf "" | xclip -selection clipboard -i 2>/dev/null || xclip -selection clipboard -i /dev/null 2>/dev/null || true
        fi
      fi
    fi

    # -------- Image sync: Wayland -> X11 --------
    if [[ "$img_synced" == false ]]; then
      wl_types="$(wl-paste --list-types 2>/dev/null || true)"
      wl_img_type=""
      if printf "%s" "$wl_types" | grep -q "image/png"; then
        wl_img_type="image/png"
      elif printf "%s" "$wl_types" | grep -q "image/jpeg"; then
        wl_img_type="image/jpeg"
      elif printf "%s" "$wl_types" | grep -q "image/gif"; then
        wl_img_type="image/gif"
      fi

      if [[ -n "$wl_img_type" ]]; then
        tmpfile="$(mktemp "${RUNTIME_DIR}/niri-wl-img.XXXXXX" 2>/dev/null)" || tmpfile="/tmp/niri-wl-img.$$"
        if wl-paste -t "$wl_img_type" > "$tmpfile" 2>/dev/null; then
          if [[ -s "$tmpfile" ]]; then
            wl_img_hash="$(sha256sum "$tmpfile" | awk '{print $1}')"
            if [[ -n "$wl_img_hash" && "$wl_img_hash" != "$last_wl_img_hash" ]]; then
              xclip -selection clipboard -t "$wl_img_type" -i < "$tmpfile" 2>/dev/null || true
              last_wl_img_hash="$wl_img_hash"
              last_x11_img_hash="$wl_img_hash"
              img_synced=true
              log_sync "wl->x11" "image" " ($wl_img_type)"
            fi
          fi
        fi
        rm -f "$tmpfile" >/dev/null 2>&1
      fi
    fi

    # -------- Text sync (only if no image was synced this iteration) --------
    if [[ "$img_synced" == false ]]; then
      current_text="$(wl-paste --type text/plain 2>/dev/null || true)"

      x11_text=""
      if [[ -z "$x11_img_type" ]]; then
        x11_text="$(xclip -selection clipboard -o 2>/dev/null || true)"
      fi

      if [[ -n "$x11_text" && "$x11_text" != "$last_text" && "$x11_text" != "$current_text" ]]; then
        printf "%s" "$x11_text" | wl-copy --type text/plain --no-newline 2>/dev/null || true
        last_text="$x11_text"
        preview="${x11_text:0:50}"
        preview="${${(S)preview}//\n/↵}"
        preview="${${(S)preview}//\r/}"
        preview="${${(S)preview}//\t/⇥}"
        (( ${#x11_text} > 50 )) && preview="${preview}..."
        log_sync "x11->wl" "text" " \"${preview}\""
      fi

      if [[ -n "$current_text" && "$current_text" != "$last_text" && "$x11_text" != "$current_text" ]]; then
        printf "%s" "$current_text" | xclip -selection clipboard -t UTF8_STRING -i 2>/dev/null || true
        last_text="$current_text"
        preview="${current_text:0:50}"
        preview="${${(S)preview}//\n/↵}"
        preview="${${(S)preview}//\r/}"
        preview="${${(S)preview}//\t/⇥}"
        (( ${#current_text} > 50 )) && preview="${preview}..."
        log_sync "wl->x11" "text" " \"${preview}\""
      fi
    fi

    sleep 0.5
  done
}

# ----------------------------
# Cleanup on exit
# ----------------------------
cleanup() {
  rm -f "$PIDFILE" >/dev/null 2>&1
  exit 0
}
trap 'cleanup' INT TERM EXIT

# ----------------------------
# Main
# ----------------------------
ensure_single_instance
check_dependencies

log "Clipboard sync service starting"
log "Monitoring Wayland ↔ X11 clipboard..."

# Daemonize by default. Use --no-daemon to stay in foreground.
if [[ "$1" != "--no-daemon" ]]; then
  # start a detached child which re-invokes this script with --no-daemon
  setsid sh -c "exec '$0' --no-daemon" >/dev/null 2>&1 &
  sleep 0.1
  exit 0
fi

# We are the background child (or running with --no-daemon)
clipboard_sync

# end of file

