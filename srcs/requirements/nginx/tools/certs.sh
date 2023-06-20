#!/bin/sh

mkdir -p /etc/nginx/ssl/;
openssl req -x509 -newkey rsa:4096 -keyout $SSL_CERTIFICATE_KEY \
	-out $SSL_CERTIFICATE -sha256 -days 3650 -nodes \
	-subj "/C=XX/ST=ahassan/L=AD/O=42/OU=N\A/CN=ahassan";

sed -i -e "s|SSL_CERTIFICATE|${SSL_CERTIFICATE}|" \
       -e "s|SSL_KEY|${SSL_CERTIFICATE_KEY}|" \
       -e "s|DOMAIN|${DOMAIN}|" \
       -e "s|WDOMAIN|${WDOMAIN}|" /etc/nginx/http.d/nginx.conf

