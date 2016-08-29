source $HOME/.profile

for i in $HOME/.xinit.d/*; do
	source "$i"
done

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
