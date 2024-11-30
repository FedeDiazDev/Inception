#!/bin/sh

sleep 10 

if [ -f ./wp-config.php ]; then
	echo "Wordpress is already installed"
else
	wp core download --allow-root
	wp config create --dbname=${MYSQL_DATABASE} --dbuser=${MYSQL_USER} --dbpass=${MYSQL_PASSWORD} --dbhost=${MYSQL_HOST} --allow-root

	wp core install --url=${DOMAIN} --title="WordPress Site" --admin_user=${WP_ROOT} --admin_password=${WP_ROOT_PASS} --admin_email=${WP_ROOT_EMAIL} --allow-root

	wp user create ${WP_USER} ${WP_USER_EMAIL} --user_pass=${WP_USER_PASSWORD} --allow-root
	wp user set-role ${WP_USER} editor
	echo "Wordpress was correctly installed!"
fi


/usr/sbin/php-fpm7.4 --nodaemonize
