FROM alpine:3.19
RUN apk --no-cache update && apk add mariadb mariadb-client
COPY conf/my.cnf /etc/my.cnf
RUN mkdir -p /run/mysqld
RUN chown -R mysql:mysql /run/mysqld
COPY conf/config.sh /etc/config.sh
CMD ["sh", "/etc/config.sh"]
