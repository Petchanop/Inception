#!bin/bash
/etc/init.d/mariadb start

echo "test Enviroment variable"
echo "user : $MYSQL_USER"
echo "dabtabase : $MYSQL_DATABASE"
echo "password : $MYSQL_PASSWORD"
echo "----------------------------"

mysql_secure_installation << EOF
y
$MYSQL_ROOT_PASSWORD
$MYSQL_ROOT_PASSWORD
y
y
y
y
y
EOF

mysql -u root -p$MYSQL_ROOT_PASSWORD << EOF
CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '';
GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EOF
