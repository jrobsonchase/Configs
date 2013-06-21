. /etc/profile

for i in ~/.xinit.d/*
do
	source "$i"
done

if [ -n $_FROM_XPROFILE ]
	exec dbus-launch --exit-with-session i3
	unset _FROM_XPROFILE
fi
