FROM alpine:3.16

RUN	apk update && apk upgrade && apk add --no-cache nginx openssl; \
	mkdir -p /etc/nginx/ssl/

RUN openssl req -x509 -newkey rsa:4096 -keyout /etc/nginx/ssl/ngnix.key \
	-out /etc/nginx/ssl/ngnix.crt -sha256 -days 3650 -nodes \
	-subj "/C=XX/ST=ahassan/L=AD/O=42/OU=N\A/CN=ahassan"

COPY /conf/nginx.conf /etc/nginx/http.d/ 
EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]