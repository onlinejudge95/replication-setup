FROM postgres:11.9

LABEL MAINTAINER="onlinejudge95"

RUN apt-get update \
    && apt-get --assume-yes install iputils-ping ssh

COPY postgresql.conf /etc/postgresql
COPY pg_hba.conf /etc/postgresql
COPY setup-master.sh /docker-entrypoint-initdb.d/setup-master.sh

RUN chmod 0666 /docker-entrypoint-initdb.d/setup-master.sh