FROM postgres:11.9

LABEL MAINTAINER="onlinejudge95"

RUN apt-get update \
    && apt-get --assume-yes install iputils-ping=3:20161105-1 ssh=1:7.4p1-10+deb9u7 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY setup-master.sh /docker-entrypoint-initdb.d/setup-master.sh

RUN chmod 0666 /docker-entrypoint-initdb.d/setup-master.sh