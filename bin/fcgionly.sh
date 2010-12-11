#!/bin/sh
killall /usr/bin/php-cgi
i=0
open=0
while [ "$open" -eq "0" ] && [ "$i" -lt "10" ];  do
        if [ $(nc -z localhost 9000 | wc -l) -eq 0 ];
        then
                open=1
        else
                echo -n "."
                sleep 1
        fi

        let i++
done

if [ $open == 1 ]
then
        echo "restarting fcgi!"
        /usr/bin/spawn-fcgi -a 127.0.0.1 -p 9000 -u nginx -g nginx -f /usr/bin/php-cgi -P /var/run/fastcgi-php.pid 2>&1 >> /var/log/nginx/php_cgi.log
else
        echo "failed to restart php-cgi because port 9000 never opened!"
fi