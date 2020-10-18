FROM postgres:11.9

LABEL MAINTAINER="onlinejudge95"

RUN apt-get update \
    && apt-get --assume-yes install iputils-ping=3:20161105-1 ssh=1:7.4p1-10+deb9u7 gosu=1.10-1+b2 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# COPY postgresql.conf /var/lib/postgresql/data
# COPY pg_hba.conf /var/lib/postgresql/data
# COPY recovery.conf /var/lib/postgresql/data
COPY setup-slave.sh /setup-slave.sh

RUN chmod +x /setup-slave.sh

ENTRYPOINT [ "/setup-slave.sh" ]
CMD ["gosu", "postgres", "postgres"]