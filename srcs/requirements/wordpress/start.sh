#!/bin/sh


# Configure WordPress
wp config create --dbname=databasename --dbuser=root --dbpass=thisismyrootpassword --dbhost=127.0.0.1 --allow-root

# Install WordPress
wp core install --url=jalvarad.42.fr --title=Inception --admin_user=admin --admin_password=1234 --admin_email=jalvarad@test.com --allow-root

# Start php-fpm
exec php-fpm8 -F
