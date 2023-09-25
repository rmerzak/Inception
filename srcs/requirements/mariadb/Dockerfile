FROM debian:bullseye

RUN apt-get update && apt-get upgrade && apt-get install vim net-tools -y

RUN apt-get install mariadb-server -y

COPY /tools/script.sh tools/script.sh

RUN chmod +x tools/script.sh

RUN sed -i "s/127.0.0.1/0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf;

ENTRYPOINT [ "tools/script.sh" ]

CMD ["mysqld"]