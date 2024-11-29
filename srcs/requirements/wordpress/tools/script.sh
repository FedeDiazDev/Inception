#!/bin/sh

sleep 10 

if [ -f ./wp-config.php ]; then
	echo "Wordpress is already installed"
else
	echo "Downloading WordPress..."
	wp core download --allow-root

	echo "Creating Wordpress/Mariadb connection..."
	wp config create --dbname=${WP_DB_NAME} --dbuser=${WP_DB_USER} --dbpass=${WP_DB_PASSWORD} --dbhost=${WP_DB_HOST} --allow-root

	echo "Installing WordPress..."
	wp core install --url=${DOMAIN} --title="WordPress Site" --admin_user=${WP_ROOT} --admin_password=${WP_ROOT_PASS} --admin_email=${WP_ROOT_EMAIL} --allow-root

	echo "Creating a user..."
	wp user create ${WP_USER} ${WP_USER_EMAIL} --user_pass=${WP_USER_PASSWORD} --allow-root
	echo "Setting role for ${WP_USER}..."
	wp user set-role ${WP_USER} editor
	echo "Wordpress was correctly installed!"
fi


/usr/sbin/php-fpm7.4 --nodaemonize
