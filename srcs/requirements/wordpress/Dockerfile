FROM debian:bullseye


RUN apt-get update && apt-get upgrade && apt-get install wget php7.4 php-fpm php-mysql  mariadb-client -y

RUN mkdir -p /var/www/html/wordpress


COPY tools/script.sh /tools/script.sh

RUN chmod +x /tools/script.sh

# RUN mkdir  -p /var/www/html

RUN chown -R root:root /var/www/html/wordpress

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

RUN chmod 755 /etc/php/7.4/fpm/pool.d/www.conf

RUN mkdir /run/php

RUN chown -R www-data:www-data /run/php


RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# RUN wget https://wordpress.org/wordpress-6.2.2.tar.gz -P /var/www/html
# RUN cd /var/www/html && tar -xzf wordpress-6.2.2.tar.gz && rm wordpress-6.2.2.tar.gz

RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

# RUN  wp core download --allow-root



EXPOSE 9000

ENTRYPOINT [ "/tools/script.sh" ]

