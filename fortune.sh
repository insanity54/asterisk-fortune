#!/bin/bash

timestamp=$(date +%S_%N)
filename=/tmp/${timestamp}.mp3
line="$(fortune -s /usr/share/games/fortunes)"

#echo ${line}

curl \
    -s \
    -o $filename \
    -G \
    --data-urlencode "text=${line}" \
    http://127.0.0.1:8080/speech


echo $filename
#mpg123 $filename


exit 0

