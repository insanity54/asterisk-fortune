#!/bin/bash

timestamp=$(date +%S_%N)
filename=/tmp/${timestamp}.mp3
line="$(/usr/games/fortune -s /usr/share/games/fortunes)"


curl \
    -s \
    -o $filename \
    -G \
    --data-urlencode "text=${line}" \
    http://127.0.0.1:8080/speech


chmod 0775 $filename
printf $filename


exit 0

