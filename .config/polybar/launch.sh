#!/bin/bash
CONFIG_PATH="~/.config/polybar/material.ini"

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar laptop -c $CONFIG_PATH &
polybar laptop-left -c $CONFIG_PATH &
polybar laptop-center -c $CONFIG_PATH &
polybar laptop-right -c $CONFIG_PATH &

ln -sf /tmp/polybar_mqueue.$! /tmp/ipc-bottom

if [[ $HDMI_CONNECTED ]]; then
  polybar monitor -c $CONFIG_PATH &
  polybar monitor-left -c $CONFIG_PATH &
  polybar monitor-center -c $CONFIG_PATH &
  polybar monitor-right -c $CONFIG_PATH &
fi

echo "Polybar launched..."
