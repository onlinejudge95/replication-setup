FROM postgres:11.9

LABEL MAINTAINER="onlinejudge95"

COPY setup-master.sh /docker-entrypoint-initdb.d/setup-master.sh

RUN chmod 0666 /docker-entrypoint-initdb.d/setup-master.sh