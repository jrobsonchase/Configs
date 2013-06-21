#!/bin/bash

backupFiles() {
	src=$1
	dst=$2
	find . -type f | while read i
	do
		[[ "$i" != *.tar.gz ]] && mv "$src/$i" "$dst/$i" 2>/dev/null
	done
}

mirrorDirs() {
	dst="$1"
	find . -type d | while read i
	do
		mkdir -p "$dst/$i"
	done
}

createLinks() {
	dst=$1
	find . -type f | while read i
	do
		[[ "$i" != *.tar.gz ]] && ln -s "$(pwd)/${i}" "$1/$i"
	done
}

untarThemes() {
	find .themes/ -name *.tar.gz | while read i
	do
		tar xf "$i" -C $HOME/.themes
	done
}

cd "$(dirname $0)/dotfiles"
dateext=$(date +%s)
backupdir=$HOME/.dotfiles.$dateext
mkdir -p $backupdir

mirrorDirs $HOME

mirrorDirs $backupdir
backupFiles $HOME $backupdir

createLinks $HOME

untarThemes $HOME
