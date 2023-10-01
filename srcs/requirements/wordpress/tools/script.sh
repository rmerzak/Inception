#!/bin/sh
sleep 10

cd /var/www/html/wordpress

wp core download --allow-root

wp core config \
	--dbhost=mariadb:3306 \
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


 php-fpm7.4 -F
