#!/usr/bin/env bash

for i in $HOME/.profile.d/*;
do
	source "$i"
done
