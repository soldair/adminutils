killall nginx
/usr/bin/spawn-fcgi -a 127.0.0.1 -p 9000 -u nginx -g nginx -f /usr/bin/php-cgi -P /var/run/fastcgi-php.pid 2>&1 >> /var/log/nginx/php_cgi.log
/etc/init.d/nginx restart
