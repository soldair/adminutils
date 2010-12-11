pid=`ps ax | grep php-cgi | grep Ss | sed "s/^\([0-9]\{1,\}\).*/\1/"`

if [ "$pid" == "" ]; then
	echo "fcgi is not running"
else
	kill -KILL $pid
fi

fcgionly.sh
