FROM postgres:9.6.19

LABEL MAINTAINER="onlinejudge95"

RUN mkdir -p /var/lib/postgresql/9.6/main/archive/
RUN chmod 700 /var/lib/postgresql/9.6/main/archive/

COPY postgresql.conf /etc/postgresql
COPY pg_hba.conf /etc/postgresql
COPY replication.sh /docker-entrypoint-initdb.d/