. /etc/profile

DEFAULT='dbus-launch --exit-with-session i3'

for i in ~/.xinit.d/*
do
	source "$i"
done

if [ -n $_FROM_XPROFILE ]
then
	case $1 in
		i3)
			exec dbus-launch --exit-with-session i3 ;;
		lxde)
			exec startlxde ;;
		*)
			exec $DEFAULT ;;
	esac
	unset _FROM_XPROFILE
fi
