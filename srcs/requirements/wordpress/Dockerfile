FROM debian:bullseye

RUN apt-get -y update && \ 
	apt-get -y upgrade && \
	apt-get -y install curl php7.4-fpm php-mysql sendmail 
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar --silent && \
    chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

RUN	mkdir -p /var/www/html /run/php && \
   	chown -R www-data:www-data /var/www/html && \
   	chmod -R 755 /var/www/html /run/php

COPY	conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY 	tools/script.sh /var/www/config.sh
RUN	chmod +x /var/www/config.sh

WORKDIR /var/www/html

EXPOSE 9000

CMD ["/var/www/config.sh"]
