FROM alpine:3.16

ARG DB_NAME DB_USER DB_PASS

RUN apk update && apk upgrade && apk add --no-cache \
    php8 php8-fpm php8-mysqli php8-json php8-curl php8-dom \
    php8-exif php8-fileinfo php8-mbstring php8-openssl php8-xml php8-zip wget unzip && \
    rm -f /var/cache/apk/*; rm /etc/php8/php-fpm.d/www.conf; mkdir -p /var/www

COPY www.conf /etc/php8/php-fpm.d/
COPY /conf/wp-config-create.sh /var/www

RUN cd /var/www; sh wp-config-create.sh && rm wp-config-create.sh && \
    chmod -R 0777 wp-content/

CMD ["/usr/sbin/php-fpm8", "-F"]