. /etc/profile

for i in ~/.xinit.d/*
do
	source "$i"
done

if [ $_FROM_XPROFILE != true ]
	exec dbus-launch --exit-with-session i3
	unset _FROM_XPROFILE
fi
