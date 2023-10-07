FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y && apt-get install apache2 -y

RUN mkdir -p /var/www/html/portfolio

RUN chown -R www-data:www-data /var/www/html/portfolio

COPY ./tools/portfolio /var/www/html/portfolio

COPY ./conf/000-default.conf /etc/apache2/sites-available/000-default.conf

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
