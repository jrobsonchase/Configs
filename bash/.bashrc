# Check for an interactive session
#[ -z "$PS1" ] && return

. $HOME/.profile

for i in $HOME/.bash.d/*
do
	source $i
done
