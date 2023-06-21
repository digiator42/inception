FROM alpine:3.16

ARG SSL_CERTIFICATE SSL_CERTIFICATE_KEY DOMAIN WDOMAIN ROOT SSLPORT

RUN	apk update && apk upgrade && apk add --no-cache nginx openssl;

COPY /conf/nginx.conf /etc/nginx/http.d/
COPY /tools/certs.sh .

RUN chmod 777 certs.sh && sh certs.sh && rm certs.sh

EXPOSE ${SSLPORT}
CMD ["nginx", "-g", "daemon off;"]