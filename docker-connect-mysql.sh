#!/bin/sh

eval $(grep COMPOSE_PROJECT_NAME .env | xargs)

docker exec -it ${COMPOSE_PROJECT_NAME}_database_1 bash
