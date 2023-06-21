FROM alpine:3.16

ARG DB_NAME DB_USER DB_PASS WP_NAME WP_USER WP_PASS WPORT PHPUSER ROOT AUTHOR_EMAIL ADMIN_EMAIL

RUN apk update && apk upgrade && apk add --no-cache \
    php8 php8-fpm php8-mysqli php8-json php8-curl php8-dom php8-exif \
    php8-fileinfo php8-mbstring php8-openssl php8-xml php8-zip wget curl php-phar unzip \
    rm -f /var/cache/apk/*; rm /etc/php8/php-fpm.d/www.conf; mkdir -p ${ROOT}

COPY /tools/fpm-conf.sh .

RUN sh fpm-conf.sh && rm fpm-conf.sh;\
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && cp wp-cli.phar /usr/local/bin/wp

WORKDIR ${ROOT}
RUN wget https://wordpress.org/latest.zip && \
    unzip latest.zip && \
    cp -rf wordpress/* . && \
    rm -rf wordpress latest.zip

COPY /tools/wp-config-create.sh .
COPY /tools/wp-setup.sh /usr/local/bin/
RUN chmod 777 /usr/local/bin/wp-setup.sh
RUN sh wp-config-create.sh && rm wp-config-create.sh && \
    chmod -R 777 wp-content/
EXPOSE ${WPORT}
ENTRYPOINT [ "/usr/local/bin/wp-setup.sh" ]