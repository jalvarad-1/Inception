# Set base image
FROM alpine:3.17

# Actualizar el sistema e instalar MariaDB
RUN apk update && apk add mariadb

# Crear un directorio para los scripts SQL 
RUN mkdir /scripts

# Copiar el script SQL a la imagen
COPY tools/test.sql /scripts
COPY ./tools/my.cnf /etc/my.cnf.d/mariadb-server.cnf

# Inicializar la base de datos
RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql
# Exponer el puerto para MariaDB
EXPOSE 3306
# Ejecutar MariaDB
CMD ["mysqld_safe", "--user=mysql", "--datadir=/var/lib/mysql", "--init-file=/scripts/test.sql"]
