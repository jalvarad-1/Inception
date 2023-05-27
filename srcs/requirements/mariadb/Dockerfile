# Set base image
FROM alpine:3.17

# Actualizar el sistema e instalar MariaDB
RUN apk update && apk add mariadb

# Crear un directorio para los scripts SQL 
RUN mkdir /scripts

# Copiar el script SQL a la imagen
COPY tools/test.sql /scripts

# Exponer el puerto para MariaDB
EXPOSE 3306

# Ejecutar MariaDB
CMD ["mysqld", "--user=mysql", "--datadir=/var/lib/mysql", "--init_file=/scripts/test.sql"]