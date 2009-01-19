#
# Starts dropbear sshd.
#

# Make sure the dropbearkey progam exists
[ -f /usr/bin/dropbearkey ] || exit 0

start() {
 	echo -n "Starting dropbear sshd: "
	# Make sure dropbear directory exists
	if [ ! -d /etc/dropbear ] ; then
		mkdir -p /etc/dropbear
	fi
	# Check for the Dropbear RSA key
	if [ ! -f /etc/dropbear/dropbear_rsa_host_key ] ; then
		echo -n "generating rsa key... "
		/usr/bin/dropbearkey -t rsa -f /etc/dropbear/dropbear_rsa_host_key &gt; /dev/null 2&gt;&amp;1
	fi

	# Check for the Dropbear DSS key
	if [ ! -f /etc/dropbear/dropbear_dss_host_key ] ; then
		echo -n "generating dsa key... "
		/usr/bin/dropbearkey -t dss -f /etc/dropbear/dropbear_dss_host_key &gt; /dev/null 2&gt;&amp;1
	fi
	umask 077
	start-stop-daemon -S -q -p /var/run/dropbear.pid --exec /usr/sbin/dropbear
	echo "OK"
}
stop() {
	echo -n "Stopping dropbear sshd: "
	start-stop-daemon -K -q -p /var/run/dropbear.pid
	echo "OK"
}
restart() {
	stop
	start
}

case "$1" in
  start)
  	start
	;;
  stop)
  	stop
	;;
  restart|reload)
  	restart
	;;
  *)
	echo $"Usage: $0 {start|stop|restart}"
	exit 1
esac

exit $?
