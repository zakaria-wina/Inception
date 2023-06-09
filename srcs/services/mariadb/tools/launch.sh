#!/bin/bash

sed -i 's/^bind-address\s*=.*/bind-address\t\t= 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf

service mysql start

mysql -u root -e "CREATE DATABASE IF NOT EXISTS $MARIADB_NAME;"
mysql -u root -e "CREATE USER IF NOT EXISTS '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_PASS';"
mysql -u root -e "GRANT ALL PRIVILEGES ON $MARIADB_NAME.* TO '$MARIADB_USER'@'%';"
mysql -u root -e "FLUSH PRIVILEGES;"

service mysql stop

mysqld
