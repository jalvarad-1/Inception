FROM alpine:3.17

# install wordpress
RUN wget https://wordpress.org/latest.tar.gz && tar -xzvf latest.tar.gz
# install php fpm
RUN apk update && apk add php8 php8-fpm php8-pdo_mysql php8-mysqli
