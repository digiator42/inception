FROM alpine:3.16
RUN	apk update && apk upgrade && apk add --no-cache nginx openssl
COPY ngnix.crt ngnix.key /etc/nginx/ssl/
COPY /conf/nginx.conf /etc/nginx/http.d/
EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]