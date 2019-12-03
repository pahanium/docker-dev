#!/usr/bin/env bash
set -e

if [ -e /docker-entrypoint-initdb.d/dump.sql ]; then
    echo "Import existing dump.sql"
else
    if [[ -z "${MYSQL_REMOTE_DATABASE}" ]]; then
        echo "Dump database"
        mysqldump -h${MYSQL_REMOTE_HOST} -u ${MYSQL_REMOTE_USER} --password=${MYSQL_REMOTE_PASSWORD} ${MYSQL_REMOTE_DATABASE} >/docker-entrypoint-initdb.d/dump.sql

        echo "Load ${MYSQL_DATABASE}"
        mysql -u root -p${MYSQL_ROOT_PASSWORD} ${MYSQL_DATABASE} < /docker-entrypoint-initdb.d/dump.sql

        mv /docker-entrypoint-initdb.d/dump.sql /docker-entrypoint-initdb.d/dump.sql.loaded
    fi
fi
