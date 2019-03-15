source $HOME/.xprofile

DEFAULT='dbus-launch --exit-with-session i3'

cd

case $1 in
	i3)
		exec dbus-launch --exit-with-session i3 ;;
	lxde)
		exec startlxde ;;
	*)
		exec $DEFAULT ;;
esac
