FROM debian:bullseye

ARG MYSQL_ROOT_PASSWORD
ARG MYSQL_USER
ARG MYSQL_PASSWORD
ARG MYSQL_DATABASE
ARG MYSQL_HOST
ARG WP_DOMAIN
ARG WP_TITLE
ARG WP_ADMIN
ARG WP_ADMIN_PASSWORD
ARG WP_ADMIN_EMAIL
ARG WP_USER
ARG WP_USER_PASSWORD
ARG WP_USER_EMAIL

RUN apt-get -y update && apt-get -y upgrade && apt-get install -y \
	apt-utils \
	php php-fpm php-mbstring php-bcmath php-xml \
	php-mysql php-common php-gd php-cli php-curl \
	php-zip php-imagick php-ldap php-intl \
	wget vim \
	mariadb-client

USER root

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/
COPY ./tools/wordpressSetup.sh /usr/local/bin/
RUN mkdir -p /var/run/php
RUN mkdir -p /var/wwW
RUN mkdir -p /var/www/html

RUN chmod +x /usr/local/bin/wordpressSetup.sh

RUN chown -R $USER:$USER /var/www/html

WORKDIR /var/www/html/

EXPOSE 9000

CMD ["/usr/sbin/php-fpm7.4", "-F"]
ENTRYPOINT ["/usr/local/bin/wordpressSetup.sh"]
