FROM alpine:3.16

ARG DB_NAME DB_USER DB_PASS DBPORT

COPY conf/create_db.sh .

RUN apk update && apk add --no-cache mariadb mariadb-client; \
    mkdir /var/run/mysqld;  \
    chown -R mysql:mysql /var/run/mysqld;\
    chmod 777 /var/run/mysqld; \
    echo -e "[mysqld]\nskip-host-cache\nskip-name-resolve\nbind-address=0.0.0.0" > \
    /etc/my.cnf.d/sqlconfig.cnf; \
    sed -i "s|skip-networking|skip-networking=0|g" /etc/my.cnf.d/mariadb-server.cnf; \
    mysql_install_db --user=mysql --datadir=/var/lib/mysql; \
    sh create_db.sh;

EXPOSE ${DBPORT}
USER mysql
CMD ["/usr/bin/mysqld", "--skip-log-error"]