FROM debian:latest

RUN apt-get update && apt-get upgrade -y && apt-get install -y nginx \
                openssl
                
RUN    mkdir /etc/nginx/ssl
RUN openssl req -new -newkey rsa:2048 -nodes -x509 -days 365 -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt -subj "/C=AE/ST=/L=AD/O=42/OU=intra/CN=ahassan"

COPY nginx.conf /etc/nginx/conf.d
COPY  index.html /usr/share/nginx/html
COPY  index.html /var/www/html


EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]