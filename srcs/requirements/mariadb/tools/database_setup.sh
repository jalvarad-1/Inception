#!/bin/sh

# Create SQL script
cat << EOF > /scripts/init.sql
CREATE USER IF NOT EXISTS 'root'@'localhost' IDENTIFIED BY '${MARIADB_ROOT_PASSWORD}';
CREATE USER IF NOT EXISTS 'root'@'%' IDENTIFIED BY '${MARIADB_ROOT_PASSWORD}';
GRANT ALL ON *.* TO 'root'@'localhost' WITH GRANT OPTION;
GRANT ALL ON *.* TO 'root'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
CREATE USER IF NOT EXISTS '${MARIADB_USER}'@'localhost' IDENTIFIED BY '${MARIADB_USER_PASSWORD}';
CREATE USER IF NOT EXISTS '${MARIADB_USER}'@'%' IDENTIFIED BY '${MARIADB_USER_PASSWORD}';
CREATE DATABASE IF NOT EXISTS ${DATABASE_NAME};
GRANT ALL ON ${DATABASE_NAME}.* TO '${MARIADB_USER}'@'localhost';
GRANT ALL ON ${DATABASE_NAME}.* TO '${MARIADB_USER}'@'%';
FLUSH PRIVILEGES;
EOF

# Execute MariaDB
# https://mariadb.com/kb/en/mysqld_safe/
mysqld_safe --user=mysql --datadir="/var/lib/mysql" --init-file="/scripts/init.sql"