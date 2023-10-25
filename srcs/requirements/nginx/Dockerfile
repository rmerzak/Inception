FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y nginx

RUN mkdir -p /etc/nginx/ssl

COPY conf/nginx.conf /etc/nginx/nginx.conf


RUN chmod 755 /var/www/html

RUN chown -R www-data:www-data /var/www/html

RUN apt-get install -y openssl

RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Khouribgha/O=42/OU=42/CN=rmerzak.42.fr/UID=rmerzak"

EXPOSE 443

CMD [ "nginx", "-g", "daemon off;" ]