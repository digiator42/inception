#!/bin/sh

mkdir -p /etc/nginx/ssl/;
openssl req -x509 -newkey rsa:4096 -keyout $SSL_CERTIFICATE_KEY \
	-out $SSL_CERTIFICATE -sha256 -days 3650 -nodes \
	-subj "/C=XX/ST=ahassan/L=AD/O=42/OU=N\A/CN=ahassan";

sed -i "s|SSL_CERTIFICATE|${SSL_CERTIFICATE}|" /etc/nginx/http.d/nginx.conf && \
sed -i "s|SSL_KEY|${SSL_CERTIFICATE_KEY}|" /etc/nginx/http.d/nginx.conf;
