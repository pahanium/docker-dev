#!/bin/sh

eval $(grep COMPOSE_PROJECT_NAME .env | xargs)

docker exec -it -e XDEBUG_CONFIG="remote_host=$(ip -4 addr show docker0 | grep -Po 'inet \K[\d.]+')" -e PHP_IDE_CONFIG="serverName=localhost" -e SHOPWARE_ENV=dev ${COMPOSE_PROJECT_NAME}_web_1 bash
