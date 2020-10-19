FROM mysql:5.7.31

LABEL MAINTAINER="onlinejudge95"

COPY mysqld.conf /etc/mysql/mysql.conf.d/mysqld.cnf
COPY setup-master.sh /docker-entrypoint-initdb.d/setup-master.sh

RUN chmod 0666 /docker-entrypoint-initdb.d/setup-master.sh