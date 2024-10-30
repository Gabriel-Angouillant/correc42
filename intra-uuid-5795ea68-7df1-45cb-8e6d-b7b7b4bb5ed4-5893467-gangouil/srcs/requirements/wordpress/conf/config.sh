#!/bin/sh
sleep 10
if [ ! -f "/var/www/wordpress/wp-config.php" ] ; then
	wp-cli.phar config create --allow-root --dbname=$MYSQL_DB --dbuser=$MYSQL_BASEUSER --dbpass=$MYSQL_BASEPASS --dbhost=mariadb:3306 --path=/var/www/wordpress
	wp-cli.phar core install --allow-root --title=Bozosite --admin_user=$WORDPRESS_SUPERVISOR --admin_password=$WORDPRESS_SUPERVISOR_PASS --admin_email=$WORDPRESS_SUPERVISOR_EMAIL --skip-email --path=/var/www/wordpress --url=gangouil.42.fr
	wp-cli.phar user create --allow-root $WORDPRESS_USER $WORDPRESS_USER_EMAIL --user_pass=$WORDPRESS_USER_PASS --path=/var/www/wordpress
fi
mkdir -p /run/php
php-fpm82 -F -R 
