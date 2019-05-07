#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

MONITORS=$(polybar -m | grep -v XRandR | cut -d : -f 1 | tac)

POLYBAR_ETH=$(ip link | grep -P '\d: en' | cut -d : -f 2 | tr -d ' ')
export POLYBAR_ETH1=$(echo $POLYBAR_ETH | cut -d ' ' -f 1)
export POLYBAR_ETH2=$(echo $POLYBAR_ETH | cut -d ' ' -f 2)
export POLYBAR_WLAN=$(ip link | grep -P '\d: wl' | cut -d : -f 2 | tr -d ' ')

for monitor in $MONITORS
do
	MONITOR=$monitor polybar -r i3 &
	sleep 0.5
done
