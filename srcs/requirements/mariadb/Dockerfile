FROM debian:bullseye

RUN apt-get update && \
	apt-get install -y \
	mariadb-server

	COPY conf/mariadb.conf /etc/mysql/mariadb.conf.d/50-server.cnf

	EXPOSE 3306