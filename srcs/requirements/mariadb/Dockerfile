FROM debian:bullseye

RUN apt-get update && apt-get upgrade && apt-get install vim net-tools -y

RUN apt-get install mariadb-server -y

COPY /tools/script.sh tools/script.sh

RUN chmod +x tools/script.sh

ENTRYPOINT [ "tools/script.sh" ]

CMD ["mysqld"]