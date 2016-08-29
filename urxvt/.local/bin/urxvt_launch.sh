#!/bin/sh

[ -z "$(ps -u $UID | grep urxvtd)" ] && urxvtd -q -f

urxvtc "$@"
