FROM debian:bullseye

ARG MYSQL_ROOT_PASSWORD
ARG MYSQL_USER
ARG MYSQL_PASSWORD
ARG MYSQL_DATABASE

USER root

RUN apt-get update && apt-get upgrade && apt-get install -y \
	mariadb-server \
	mariadb-client \
	sysvinit-utils

COPY ./tools/ /root/tools/
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

RUN chmod 777 /root/tools/db.sh
RUN ./root/tools/db.sh

RUN mkdir -p /var/run/mysqld \
	&& chown -R mysql:mysql /var/run/mysqld \
	&& chmod -R 777 /var/run/mysqld

VOLUME /var/lib/mysql

EXPOSE 3306

CMD ["mysqld"]
