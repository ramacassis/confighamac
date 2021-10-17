#!/usr/bin/bash

POLYBAR="$(command -v polybar)"
XRANDR="$(command -v xrandr)"

# Check that the commands exists
if [[ -z "$POLYBAR" ]]; then
    exit 1
fi

# Terminate already running bar instances
killall -q "$POLYBAR"

# If all your bars have ipc enabled, you can also use polybar-msg cmd quit
if [[ -n "$XRANDR" ]]; then
    for m in $($XRANDR --query | grep -w "connected" | cut -d" " -f1); do
        #MONITOR="$m" $POLYBAR --reload top 2> "/tmp/polybar_${m}_top.log" &
        MONITOR="$m" $POLYBAR --reload bottom 2> "/tmp/polybar_${m}_bottom.log" &
    done
else
    #$POLYBAR --reload top 2> /tmp/polybar_top.log &
    $POLYBAR --reload bottom 2> /tmp/polybar_bottom.log &
fi
