#!/bin/bash

# Script to build and publish the docker image for all years listed in versions.csv

# Build a version, args are year, wpi version, and tag 
function build {
    echo Building $3
    docker build --build-arg YEAR=$1 --build-arg WPI_VERSION=$2 -t $3 .
    docker push $3
}

years=()
wpiVersions=()
#Read version configuration
while IFS=',' read -r col1 col2
do
    years+=($col1)
    wpiVersions+=($col2)
done < ./versions.csv

i=0
for year in ${years[@]}; do
    tag="gregk27/ler-programming:$year"
    build $year ${wpiVersions[i]} $tag

    for ((j=$((wpiVersions[i]));j>0;j--)) do
        tag="gregk27/ler-programming:$year-$j"
        build $year $j $tag
    done
    i=$i+1
done