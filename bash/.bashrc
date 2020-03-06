# Check for an interactive session
#[ -z "$PS1" ] && return

. $HOME/.profile

for i in $HOME/.bash.d/*
do
	source $i
done

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

alias dartmud='cd ~/Sync/tintin/dartmud; tt++ dartmud.tin'
