#!/bin/bash

playerctl metadata 2>/dev/null > /tmp/playerctl-meta

extract_key() {
	local key=$1
	cat /tmp/playerctl-meta | grep "xesam:$key " | sed 's/\S\+\s\S\+\s\+//'
}

artist=$(extract_key artist)
album=$(extract_key album)
title=$(extract_key title)

echo "'$title' from '$album' by $artist"
