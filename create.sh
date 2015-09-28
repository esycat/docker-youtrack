#!/bin/sh

REPO="esycat/youtrack"
TAG="6.5"

NAME="youtrack"
PORTS="80:8080"
VOLUMES=""

docker create --name $NAME -p $PORTS $REPO:$TAG --restart=always || exit $?

echo $NAME container is ready.
echo To start: docker start $NAME
