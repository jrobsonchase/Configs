#!/bin/bash

[ -z "$(screen -ls | grep irc)" ] && screen -m -d -S irc weechat-curses

$HOME/.i3/urxvt_launch.sh -e "screen -d -r irc"

