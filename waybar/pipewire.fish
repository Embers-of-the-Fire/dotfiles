#!/usr/bin/env fish

set pw_output (pw-volume status 2>/dev/null)

set is_muted (printf '%s' "$pw_output" | jq -r 'try .tooltip catch ""' 2>/dev/null)
set volume (printf '%s' "$pw_output" | jq -r 'try .percentage catch ""' 2>/dev/null)

if test "$is_muted" = muted
    echo MUTE
else if test -n "$volume"
    echo "$volume% "
else
    echo UNKNOWN
end
