#!/bin/bash

out="{\"include\":["

years=()
wpiVersions=()
if [ -z "$1" ] && [ -z "$2" ]; then
    #Read version configuration
    while IFS=',' read -r col1 col2
    do
        years+=($col1)
        wpiVersions+=($col2)
    done < ./versions.csv
fi

i=0
for year in ${years[@]}; do
    out="$out{\"year\":$year,\"version\":${wpiVersions[i]},\"tag\":\"gregk27/ler-programming:$year\"},"

    for ((j=$((wpiVersions[i]));j>0;j--)) do
        out="$out{\"year\":$year,\"version\":$j,\"tag\":\"gregk27/ler-programming:$year-$j\"},"
    done
    i=$i+1
done

out="${out::-1}]}"
export json="$out"