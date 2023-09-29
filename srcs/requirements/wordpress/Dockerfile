FROM debian:bullseye

ARG MYSQL_ROOT_PASSWORD=1234
ARG MYSQL_USER=wordpress
ARG MYSQL_PASSWORD=1234
ARG MYSQL_DATABASE=wordpress
ARG MYSQL_HOST=database:3306

RUN apt-get -y update && apt-get -y upgrade && apt-get install -y \
	apt-utils \
	php php-fpm php-mbstring php-bcmath php-xml \
	php-mysql php-common php-gd php-cli php-curl \
	php-zip php-imagick php-ldap php-intl \
	wget vim \
	systemctl

USER root

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/
COPY ./tools/wordpressSetup.sh /usr/local/bin/
RUN mkdir -p /var/run/php

RUN chmod +x /usr/local/bin/wordpressSetup.sh
RUN /usr/local/bin/wordpressSetup.sh

RUN chown -R $USER:$USER /var/www/html

WORKDIR /var/www/html/

EXPOSE 9000

CMD ["/usr/sbin/php-fpm7.4", "-F"]