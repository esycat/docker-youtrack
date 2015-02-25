#!/bin/sh

REPO="esycat/youtrack"
TAG=${1:-"6.0"}

docker build -t $REPO:$TAG $(dirname $0) || exit $?
echo $REPO:$TAG image is ready.

