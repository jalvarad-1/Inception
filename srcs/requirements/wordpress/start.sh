#!/bin/sh

# Configure WordPress
wp config create --dbname=$DATABASENAME --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$DB_HOST --allow-root

# Install WordPress
wp core install --url=$DOMAIN_NAME --title=$PROJECT --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASS --admin_email=$LOGIN@test.com --allow-root

# Start php-fpm
exec php-fpm8 -F
