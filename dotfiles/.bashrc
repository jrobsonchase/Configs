# Check for an interactive session

[ -z "$PS1" ] && return
for i in $HOME/.bash.d/*
do
	source $i
done
