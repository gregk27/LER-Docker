#!/bin/bash

# Script to build and publish the docker image for a given year, syntax is: build YEAR WPI_VERSION

if [ -z "$1" ] || [ -z "$2" ]
  then
    echo "Missing argument(s), should be in form: build YEAR WPI_VERSION"
    exit 1
fi

docker build --build-arg YEAR=$1 --build-arg WPI_VERSION=$2 -t gregk27/ler-programming:$1 .
docker push gregk27/ler-programming:$1