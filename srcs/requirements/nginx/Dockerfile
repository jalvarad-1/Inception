# Set base image
FROM alpine:3.17

# Update apk and install mariadb package
RUN apk update && apk add nginx

# Copy default.conf
COPY conf/openssl/${DOMAIN}.crt /etc/nginx/certs/server.crt
COPY conf/openssl/${DOMAIN}.key /etc/nginx/certs/server.key
COPY conf/default.conf /etc/nginx/http.d/

CMD ["nginx", "-g", "daemon off;"]