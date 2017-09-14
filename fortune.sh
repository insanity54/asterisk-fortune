#!/bin/bash

timestamp=$(date +%S_%N)
filename=/tmp/${timestamp}.mp3
line="$(/usr/games/fortune -s /usr/share/games/fortunes)"
ttsendpoint=http://tts:8080/speech


curl \
    -s \
    -o $filename \
    -G \
    --data-urlencode "text=${line}" \
    $ttsendpoint


chmod 0775 $filename
printf $filename


exit 0

