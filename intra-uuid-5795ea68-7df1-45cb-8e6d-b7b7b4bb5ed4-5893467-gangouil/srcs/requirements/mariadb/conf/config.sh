#!/bin/sh
if [ ! -d "/var/lib/mysql/mysql" ]; then
	mysql_install_db
	chown -R mysql:mysql /var/lib/mysql
	/usr/bin/mysqld_safe &
	mysqladmin --silent --wait=30 ping
	mysql -uroot -p$MYSQL_ROOT_PASSWORD -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
	mysql -uroot -p$MYSQL_ROOT_PASSWORD -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DB}\`;"
	mysql -uroot -p$MYSQL_ROOT_PASSWORD -e "CREATE USER IF NOT EXISTS \`${MYSQL_BASEUSER}\`@'localhost' IDENTIFIED BY '${MYSQL_BASEPASS}';"
	mysql -uroot -p$MYSQL_ROOT_PASSWORD -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DB}\`.* TO \`${MYSQL_BASEUSER}\`@'%' IDENTIFIED BY '${MYSQL_BASEPASS}';"
	mysql -uroot -p$MYSQL_ROOT_PASSWORD -e "FLUSH PRIVILEGES;"
	mysqladmin -uroot -p$MYSQL_ROOT_PASSWORD shutdown
fi
exec /usr/bin/mysqld_safe
