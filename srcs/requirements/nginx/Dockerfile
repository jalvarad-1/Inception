FROM alpine:3.17

RUN apk update && apk add nginx
COPY conf/openssl/jalvarad.42.fr.crt /etc/nginx/certs/server.crt
COPY conf/openssl/jalvarad.42.fr.key /etc/nginx/certs/server.key
COPY conf/default.conf /etc/nginx/http.d/
#This line is only for test that all config is ok
COPY conf/index.html /usr/share/nginx/html/
CMD ["nginx", "-g", "daemon off;"]