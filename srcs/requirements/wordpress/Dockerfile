FROM debian:bullseye

RUN apt-get -y update && \ 
	apt-get -y upgrade && \
	apt-get -y install curl php7.3-fpm php-mysql

COPY	tools/www.conf /etc/php/7.4/fpm/pool.d/wordpress.conf
