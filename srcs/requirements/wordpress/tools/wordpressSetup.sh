#!/bin/bash

if [ ! -f wp-config.php ]; then
	wget https://wordpress.org/latest.tar.gz
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	wp cli update
	mv wp-cli.phar /usr/local/bin/wp
	tar -xpvf latest.tar.gz
	rm -rf latest.tar.gz
	mkdir /var/www
	mkdir /var/www/html
	mkdir -p /var/www/npiya-is.42.fr
	pwd
	cd wordpress
	cp wp-config-sample.php wp-config.php
	sed -i "s/username_here/$MYSQL_USER/g" wp-config.php
	sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config.php
	sed -i "s/localhost/$MYSQL_HOST/g" wp-config.php
	sed -i "s/database_name_here/$MYSQL_DATABASE/g" wp-config.php
	cp -r * /var/www/html/
	mv * /var/www/npiya-is.42.fr/

	chown -R www-data:www-data /var/www/html
	chown -R www-data:www-data /var/www/npiya-is.42.fr

fi