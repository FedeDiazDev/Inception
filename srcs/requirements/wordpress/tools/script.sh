#!/bin/sh


if [ -f ./wp-config.php ]; then
	echo "Wordpress ya está instalado"
else
	wp core download --allow-root
	wp config create --dbname=${MYSQL_DATABASE} --dbuser=${MYSQL_USER} --dbpass=${MYSQL_PASSWORD} --dbhost=${MYSQL_HOST} --allow-root
	wp core install --url=${DOMAIN} --title=$WP_TITLE --admin_user=${WP_ROOT} --admin_password=${WP_ROOT_PASS} --admin_email=${WP_ROOT_EMAIL} --allow-root
	wp user create ${WP_USER} ${WP_USER_EMAIL} --user_pass=${WP_USER_PASSWORD} --allow-root
	wp user set-role ${WP_USER} editor
        wp theme install hexa --activate --allow-root

	echo "Wordpress instalado correctamente"
fi


/usr/sbin/php-fpm7.4 --nodaemonize
