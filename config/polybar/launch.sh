#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch the bar
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar -r -c $HOME/.config/polybar/config.ini mybar &
    sleep 1
    MONITOR=$m polybar -r -c $HOME/.config/polybar/config.ini separator &
  done
else
  polybar -r -c $HOME/.config/polybar/config.ini mybar &
  sleep 1
  polybar -r -c $HOME/.config/polybar/config.ini separator &
fi
