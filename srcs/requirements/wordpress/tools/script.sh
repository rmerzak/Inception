#!bin/bash

## config wordpress
sed -i -e 's/listen =.*/listen = 9000/' /etc/php/7.4/fpm/pool.d/www.conf

cd /var/www/html/wordpress

wp core download --allow-root --path=/var/www/html/wordpress
wp config create --allow-root --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$SQL_HOST --path='/var/www/html/wordpress'


php-fpm7.4 -F