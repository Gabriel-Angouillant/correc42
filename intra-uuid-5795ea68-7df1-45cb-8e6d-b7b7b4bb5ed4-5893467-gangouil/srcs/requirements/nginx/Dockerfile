FROM alpine:3.19
RUN apk update && apk add nginx openssl

RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=CHARENTE/L=Angouleme/O=42/OU=42/CN=gangouil.42.fr/UID=gangouil"

RUN mkdir -p /var/run/nginx
COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN mkdir -p /var/www/wordpress
RUN chmod 755 /var/www/wordpress
RUN adduser -D -g 'www' www
RUN chown -R www:www /var/www/wordpress

ENTRYPOINT [ "nginx", "-g", "daemon off;" ]
