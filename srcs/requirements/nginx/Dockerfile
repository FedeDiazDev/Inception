FROM debian:bullseye

RUN apt-get -y update && apt-get -y upgrade && apt install -y nginx openssl

RUN openssl req -x509 -days 365 -newkey rsa:2048 -nodes \
	-subj "/C=ES/ST=MADRID/L=MADRID/O=42Madrid/CN=fdiaz-gu.42.fr" \
	-keyout /etc/ssl/private/fdiaz-gu.key \
	-out /etc/ssl/certs/fdiaz-gu.crt

COPY ./conf/nginx.conf  /etc/nginx/sites-available/nginx-wp.conf
RUN ln -s /etc/nginx/sites-available/nginx-wp.conf /etc/nginx/sites-enabled/

ENTRYPOINT [ "nginx", "-g","daemon off;" ]
