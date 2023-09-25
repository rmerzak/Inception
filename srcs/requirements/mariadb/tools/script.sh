#!/bin/bash
service mariadb start
sleep 2;

sed -i "s|^datadir\s*=.*|datadir = ${MYSQL_DATADIR}|" /etc/mysql/mariadb.conf.d/50-server.cnf
sed -i "s|^socket\s*=.*|socket = ${MYSQL_SOCKET}|" /etc/mysql/mariadb.conf.d/50-server.cnf
#sed -i 's/bind-address            = 127.0.0.1/bind-address = 0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf
sed -i "s/127.0.0.1/0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf;
mysql -u root -p$MYSQL_ROOT_PASSWORD -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;"
mysql -u root -p$MYSQL_ROOT_PASSWORD -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
mysql -u root -p$MYSQL_ROOT_PASSWORD -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';"
mysql -u root -p$MYSQL_ROOT_PASSWORD -e "FLUSH PRIVILEGES;"
mysql -u root -p$MYSQL_ROOT_PASSWORD -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';"
#GRANT ALL PRIVILEGES ON *.* TO 'root'@'srcs-adminer-1.srcs_nat' IDENTIFIED BY 'rmerzak' WITH GRANT OPTION;
rm /var/lib/mysql/aria_log_control

tail -f /dev/null