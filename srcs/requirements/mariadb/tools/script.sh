#!/bin/bash

service mariadb start

if [ ! -d "/var/lib/mysql/${MYSQL_DATABASE}" ]; then
    mysql -u ${MYSQL_ROOT_USER} -e "CREATE DATABASE ${MYSQL_DATABASE};"
    mysql -e "CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
    mysql -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%' WITH GRANT OPTION;"
    mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASS}';"
    mysql -e "CREATE USER '${MYSQL_ROOT_USER}'@'%' IDENTIFIED BY '${MYSQL_ROOT_PASS}';"
    mysql -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE} TO '${MYSQL_ROOT_USER}'@'%' WITH GRANT OPTION;"
    mysql -e "FLUSH PRIVILEGES;"
fi

mysqladmin -u ${MYSQL_ROOT_USER} --password=${MYSQL_ROOT_PASS} shutdown

mysqld

# #!/bin/bash

# # Iniciar MariaDB temporalmente
# service mariadb start

# # Verificar si la base de datos existe
# if ! mysql -u root -e "USE ${MYSQL_DATABASE}"; then
#     echo "Inicializando base de datos: ${MYSQL_DATABASE}"

#     # Crear la base de datos y los usuarios necesarios
#     mysql -u root -e "CREATE DATABASE ${MYSQL_DATABASE};"
#     mysql -u root -e "CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
#     mysql -u root -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%' WITH GRANT OPTION;"

#     # Configurar usuario root y permisos
#     mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASS}';"
#     mysql -u root -e "CREATE USER '${MYSQL_ROOT_USER}'@'%' IDENTIFIED BY '${MYSQL_ROOT_PASS}';"
#     mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_ROOT_USER}'@'%' WITH GRANT OPTION;"
#     mysql -u root -e "FLUSH PRIVILEGES;"
# fi

# # Apagar MariaDB temporalmente
# mysqladmin -u root --password=${MYSQL_ROOT_PASS} shutdown

# # Iniciar MariaDB como proceso principal
# exec mysqld
