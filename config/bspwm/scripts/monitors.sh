# !/bin/bash

function workspace_number() {
  echo $(($1 + 5 * $2))
}

connected_monitors=$(xrandr | grep -w connected | awk '{print $1}')

if [ $(echo "$connected_monitors" | wc -l) == 1 ]; then
  bspc monitor -d 1 2 3 4 5 6 7
else
  bspc monitor HDMI-0 -d 1 2 3 4 5
  bspc monitor DVI-D-0 -d 6 7 8 9 0
fi
