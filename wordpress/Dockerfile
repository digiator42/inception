FROM debian:latest


RUN apt-get update && apt-get install -y \
    php-fpm \
    php-mysql \
    php-curl \
    php-gd \
    wget \
    zip \
    php-mbstring \
    php-xml \
    php-xmlrpc \
    php-zip \
    && rm -rf /var/lib/apt/lists/*


COPY www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY www.conf /var/www/html/

RUN cd /usr/local/bin/ && wget https://wordpress.org/latest.zip && \
    unzip latest.zip && cp -rf wordpress/* . && \
    rm -rf wordpress latest.zip

COPY init_wordpress.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/init_wordpress.sh
ENTRYPOINT ["/usr/local/bin/init_wordpress.sh"]

CMD ["/usr/sbin/php-fpm8.2", "-F"]

