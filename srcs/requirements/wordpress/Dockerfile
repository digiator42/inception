FROM alpine:3.16

ARG DB_NAME DB_USER DB_PASS WP_NAME WP_USER WP_PASS

RUN apk update && apk upgrade && apk add --no-cache \
    php8 php8-fpm php8-mysqli php8-json php8-curl php8-dom php8-exif \
    php8-fileinfo php8-mbstring php8-openssl php8-xml php8-zip wget curl php-phar unzip \
    rm -f /var/cache/apk/*; rm /etc/php8/php-fpm.d/www.conf; \
    rm -f /var/cache/apk/*; rm -f /etc/php8/php-fpm.d/www.conf

COPY www.conf /etc/php8/php-fpm.d/

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && cp wp-cli.phar /usr/local/bin/wp

WORKDIR /var/www
RUN wget https://wordpress.org/latest.zip && \
    unzip latest.zip && \
    cp -rf wordpress/* . && \
    rm -rf wordpress latest.zip

COPY /conf/wp-config-create.sh .
COPY wp-setup.sh /usr/local/bin/
RUN chmod 777 /usr/local/bin/wp-setup.sh
RUN sh wp-config-create.sh && rm wp-config-create.sh && \
    chmod -R 0777 wp-content/
EXPOSE 9000
ENTRYPOINT [ "/usr/local/bin/wp-setup.sh" ]



# FROM alpine:3.16

# ARG DB_NAME DB_USER DB_PASS

# RUN apk update && apk upgrade && apk add --no-cache \
#     php8 php8-fpm php8-mysqli php8-json php8-curl php8-dom \
#     php8-exif php8-fileinfo php8-gd php8-mbstring php8-openssl \
#     php8-xml php8-zip curl && \
#     rm -f /var/cache/apk/*; rm /etc/php8/php-fpm.d/www.conf;

# WORKDIR /var/www

# COPY /conf/wp-config-create.sh .

# RUN wget https://wordpress.org/latest.zip && \
#     unzip latest.zip && cp -rf wordpress/* . && \
#     rm -rf wordpress latest.zip;

# RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
#     chmod +x wp-cli.phar && \
#     mv wp-cli.phar /usr/local/bin/wp
    
# COPY www.conf /etc/php8/php-fpm.d/

# RUN cd /var/www; sh wp-config-create.sh && rm wp-config-create.sh && \
#     chmod -R 0777 wp-content/

# EXPOSE 9000

# CMD ["/usr/sbin/php-fpm8", "-F"]