#!/bin/sh

docker images | grep -v REPOSITORY | awk '{ print $1":"$2 }' | xargs -L1 docker pull
