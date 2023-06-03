FROM debian:latest

RUN apt-get update && apt-get upgrade -y && apt-get install -y nginx \
                openssl \
                dumb-init

RUN    mkdir /etc/nginx/ssl
RUN    openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt -subj "/C=UE/ST=AD/L=AD/O=42 School/OU=isaad/CN=isaad/"

COPY nginx.conf /etc/nginx/conf.d
COPY  index.html /usr/share/nginx/html
COPY  index.html /var/www/html


EXPOSE 8080

ENTRYPOINT [ "dumb-init" , "--"]
CMD ["nginx", "-g", "daemon off;"]



