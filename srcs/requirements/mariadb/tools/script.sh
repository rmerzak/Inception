#!/bin/bash
if [ -d "/var/lib/mysql/${MYSQL_DATABASE}" ]
then
	echo "${MYSQL_DATABASE} already exists\n"
	sleep 1
else
	service mariadb start
	sleep 1
	echo "creating ${MYSQL_DATABASE}\n"
	mysql -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};"
	mysql -e "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
	mysql -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
	mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
	sleep 1
	mysqladmin -u root -p${MYSQL_ROOT_PASSWORD} shutdown
	sleep 1
fi
mysqld