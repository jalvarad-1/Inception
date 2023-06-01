# Set base image
FROM alpine:3.17

# Actualizar el sistema e instalar MariaDB
RUN apk update && apk add mariadb

# Crear un directorio para los scripts SQL 
RUN mkdir /scripts

# Copiar el script SQL a la imagen
COPY tools/test.sql /scripts
COPY ./tools/my.cnf /etc/mysql

# Inicializar la base de datos
RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql
# Exponer el puerto para MariaDB
EXPOSE 3306
ENV DB_NAME=databasename
ENV DB_USER=myuser
ENV DB_PASSWORD=thisismyuserpassword
ENV DB_HOST=my_mariadb_container
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
    && wp core download --allow-root
# Copy php-fpm configuration
# Ejecutar MariaDB
#CMD ["sh", "-c", "while true; do sleep 1000; done"]
CMD ["mysqld_safe", "--user=mysql", "--datadir=/var/lib/mysql", "--init-file=/scripts/test.sql"]
