#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shutdown
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch polybar, using default config location ~/.config/polybar/config
polybar example &

echo "Polybar launched..."
