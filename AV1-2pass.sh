#!/bin/sh
#AV1 2 pass encoding using average bitrate values

#Getting user input for file options
read -p "File to convert?
" in
read -p "video bitrate?
" vbr
name=`echo "$in" | cut -d'.' -f1`
  echo "$name"
  ffmpeg -hwaccel auto -i "$in" -an -c:v libaom-av1 -strict -2  -b:v $vbr -pass 1 -f webm /dev/null && \
  ffmpeg -hwaccel auto -i "$in" -c:a libopus -c:v libaom-av1 -strict -2  -pass 2 -b:v $vbr "./${name}-AV1.webm"
