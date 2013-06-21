#!/bin/bash

cd "$(dirname $0)/dotfiles"
dateext=$(date +%s)

mkdir ~/.dotfiles.${dateext}
mkdir ~/.config -p
mkdir ~/.gnupg -p
tracked="\
	.bashrc \
	.bash.d \
	.xinitrc \
	.xinit.d \
	.vimrc \
	.config/gtk-3.0 \
	.config/gtk-2.0 \
	.config/uzbl \
	.i3 \
	.gnupg/gpg*.conf \
	.themes \
	.Xresources \
	.xprofile"

for i in $tracked
do
	if [ $i != "." ] && [ $i != ".." ]
	then
		mv ~/${i} ~/.dotfiles.${dateext}/
		ln -s $(pwd)/${i} ~/${i}
	fi
done
