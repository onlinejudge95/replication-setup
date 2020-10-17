FROM postgres:9.6.19

LABEL MAINTAINER="onlinejudge95"

RUN mkdir -p /var/lib/postgresql/9.6/main/archive/
RUN chmod 700 /var/lib/postgresql/9.6/main/archive/

ADD postgresql.conf /etc/postgresql
ADD pg_hba.conf /etc/postgresql
ADD replication.sh /docker-entrypoint-initdb.d/