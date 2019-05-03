#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

MONITORS=$(polybar -m | grep -v XRandR | awk 'BEGIN{FS=":"};{print $1}' | tac)

for monitor in $MONITORS
do
	MONITOR=$monitor polybar -r i3 &
	sleep 0.5
done
