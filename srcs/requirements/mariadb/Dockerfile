FROM debian:bullseye

RUN apt-get update && apt-get install -y mariadb-server

COPY conf/mariadb.conf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/script.sh /usr/local/bin/script.sh

RUN mkdir -p /run/mysqld && chown mysql:mysql /run/mysqld && \
    mkdir -p /var/lib/mysql && chown mysql:mysql /var/lib/mysql; \
    touch /run/mysqld/mysql.sock

EXPOSE 3306

RUN chmod +x /usr/local/bin/script.sh

RUN mariadb-install-db

CMD ["/usr/local/bin/script.sh"]