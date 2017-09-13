#!/bin/bash

timestamp1=$(date +%S_%N)
timestamp2=$(date +%S_%N_%S)
filename1=/tmp/${timestamp1}.mp3
filename2=/tmp/${timestamp2}.mp3


# get a joke
line="$(curl \
           -s \
           -o $filename1 \
	   -H "Accept: text/plain" \
	   --user-agent "asterisk-fortune https://github.com/insanity54/asterisk-fortune" \
	   https://icanhazdadjoke.com/
    )"


# TTS
curl \
    -s \
    -o $filename2 \
    -G \
    --data-urlencode "text=$(cat $filename1)" \
    http://127.0.0.1:8080/speech


printf $filename2


exit 0

