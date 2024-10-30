FROM alpine:3.19
RUN apk --no-cache update && apk --no-cache add php82 wget php82-phar php82-mbstring php82-tokenizer php82-fpm php82-mysqli php82-cgi mariadb-client

RUN mkdir -p /var/www
RUN wget -O /var/www/wordpress.tar.gz https://wordpress.org/wordpress-6.5.5.tar.gz
RUN cd /var/www && tar xfv wordpress.tar.gz && rm wordpress.tar.gz
RUN chmod -R +rwx /var/www/wordpress
RUN chown -R root:root /var/www/wordpress

RUN mkdir -p /run/php
#COPY conf/php.ini /etc/php82/php.ini
COPY conf/www.conf /etc/php82/php-fpm.d/www.conf

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /bin/wp-cli.phar

COPY conf/config.sh .

CMD ["sh", "config.sh"]
