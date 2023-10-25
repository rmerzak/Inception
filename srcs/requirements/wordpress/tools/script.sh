#!/bin/bash
sleep 6
cd /var/www/html/wordpress
if [ ! -f wp-config.php ]
then
	wp core download --allow-root
	wp core config \
		--dbhost=$SQL_HOST:$MYSQL_PORT \
		--dbname=$MYSQL_DATABASE \
		--dbuser=$MYSQL_USER \
		--dbpass=$MYSQL_PASSWORD \
		--allow-root
	wp core install \
		--title=$WP_TITLE \
		--admin_user=$WP_USERNAME \
		--admin_password=$WP_PASSWD \
		--admin_email=$WP_ADMIN_EMAIL \
		--url=$DOMAIN_NAME \
		--allow-root
	wp user create $WP_USR $WP_EMAIL --role=author --user_pass=$WP_PWD --allow-root 
fi

echo "starting Wordpress"
php-fpm7.4 -F
