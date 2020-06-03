#!/bin/sh
#AV1 2 pass encoding using average bitrate values

#Getting user input for file options
read -p "File to convert?
" in
read -p "video bitrate?
" vbr
name=`echo "$in-AV1" | cut -d'.' -f1`
  echo "$name"
  ffmpeg -strict -2 -hwaccel auto -i "$in" -an -c:v libaom-av1 -b:v $vbr -pass 1 -f webm /dev/null && \
  ffmpeg -strict -2 -hwaccel auto -i "$in" -c:a libopus -c:v libaom-av1 -pass 2 -b:v $vbr "./${name}.webm"