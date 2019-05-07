#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

MONITORS=$(polybar -m | grep -v XRandR | cut -d : -f 1 | tac)

INTERFACES=$(ip link | grep -P '\d: en' | cut -d : -f 2 | tr -d ' ')
ETH_CTR=1
for iface in $INTERFACES; do
	eval "export POLYBAR_ETH${ETH_CTR}=$iface"
	let ETH_CTR+=1
done

export POLYBAR_WLAN=$(ip link | grep -P '\d: wl' | cut -d : -f 2 | tr -d ' ')

for monitor in $MONITORS
do
	MONITOR=$monitor polybar -r i3 &
	sleep 0.5
done
