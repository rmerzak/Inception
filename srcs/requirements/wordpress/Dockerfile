FROM debian:bullseye

RUN apt-get update && apt-get upgrade

RUN apt-get -y install wget

RUN apt-get install -y php7.3 php-fpm php-mysql mariadb-client

COPY tools/script.sh /tools/script.sh

RUN chmod +x /tools/script.sh

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp

RUN mkdir /run/php

RUN mkdir  -p /var/www/html/wordpress

RUN chown -R www-data:www-data /run/php

RUN chown -R root:root /var/www/html/wordpress

ENTRYPOINT [ "/tools/script.sh" ]

