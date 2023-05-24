# Set base image
FROM alpine:3.17

# Set working directory
WORKDIR /var/www/html

# Add links to packages of the previous version
RUN echo 'https://dl-cdn.alpinelinux.org/alpine/v3.16/community' >> /etc/apk/repositories
RUN echo 'https://dl-cdn.alpinelinux.org/alpine/v3.16/main' >> /etc/apk/repositories

# Install packages
RUN apk update && apk add php8 php8-fpm php8-phar php8-curl mariadb-client

# Download and extract WordPress
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp \
    && wp core download \
    && wp config create 
# falta añadir los parámetros del wordpress como la db, user , etc
# Copy php-fpm configuration
COPY www.conf /etc/php8/php-fpm.d/www.conf

# Expose port
EXPOSE 9000

# Start php-fpm
CMD ["php-fpm8", "-F"]
