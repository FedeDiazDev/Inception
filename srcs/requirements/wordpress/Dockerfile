FROM debian:bullseye

RUN apt-get -y update && \ 
	apt-get -y upgrade && \
	apt-get -y install curl php7.4-fpm php-mysql

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar --silent

COPY	conf/www.conf /etc/php/7.4/fpm/pool.d/wordpress.conf
COPY 	tools/script.sh /var/www/config.sh
RUN		chmod +x /var/www/config.sh


WORKDIR /var/www/html

CMD ["/var/www/config.sh"]