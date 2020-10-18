#!/bin/bash

if [ ! -s "$PGDATA/PG_VERSION" ]; then
	echo "*:*:*:$POSTGRES_REPLICATION_USER:$POSTGRES_REPLICATION_PASSWORD" > ~/.pgpass
	chmod 0600 ~/.pgpass

	until ping -c 1 -W 1 postgres-master
	do
		echo "Waiting for master to ping..."
		sleep 1s
	done

	until pg_basebackup -h postgres-master -D ${PGDATA} -U ${POSTGRES_REPLICATION_USER} -vP -W
	do
		echo "Waiting for master to connect..."
		sleep 1s
	done

	echo "host replication all 0.0.0.0/0 md5" >> "$PGDATA/pg_hba.conf"

	set -e

	cat > ${PGDATA}/recovery.conf <<EOF
	standby_mode = on
	primary_conninfo = 'host=postgres-master port=5432 user=$POSTGRES_REPLICATION_USER password=$POSTGRES_REPLICATION_PASSWORD'
	trigger_file = '/tmp/touch_me_to_promote_to_me_master'
EOF

	chown postgres. ${PGDATA} -R
	chmod 700 ${PGDATA} -R
fi
sed -i 's/wal_level = hot_standby/wal_level = replica/g' ${PGDATA}/postgresql.conf

exec "$@"
