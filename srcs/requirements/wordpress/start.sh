#!/bin/sh

# Configure WordPress
echo $DATABASENAME
wp config create --dbname=$DATABASENAME --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$DB_HOST --allow-root
echo pepe

# Install WordPress
wp core install --url=$DOMAIN_NAME --title=$PROJECT --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASS --admin_email=$LOGIN@inception.com --allow-root

# Start php-fpm
exec php-fpm8 -F
