#!/bin/bash

INIT_FILE="/init.sql"

mysql_install_db >/dev/null 2>&1

if [ ! -d "/var/lib/mysql/${MYSQL_DATABASE}" ]; then

	rm -f "${INIT_FILE}"
	echo "Creando base de datos, usuarios..."
	echo "CREATE DATABASE ${MYSQL_DATABASE};" >> "${INIT_FILE}"
	echo "CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';" >> "${INIT_FILE}"
	echo "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';" >> "${INIT_FILE}"
	echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';" >> "${INIT_FILE}"
	echo "ALTER USER 'root'@'%' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';" >> "${INIT_FILE}"
	echo "FLUSH PRIVILEGES;" >> "${INIT_FILE}"
	echo "Base de datos y usuarios creados"
	mysqld_safe --init-file=${INIT_FILE} >/dev/null 2>&1
else
	echo "La base de datos ya existe."
	mysqld_safe  >/dev/null 2>&1
fi
