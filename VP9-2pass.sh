#!/bin/sh
#VP9 2 pass encoding using average bitrate values

#Getting user input for file options
read -p "File to convert?
" in
read -p "video bitrate?
" vbr
name=`echo "$in" | cut -d'.' -f1`
  echo "$name"
  ffmpeg -hwaccel auto -i "$in" -an -c:v libvpx-vp9 -b:v $vbr -pass 1 -f webm /dev/null && \
  ffmpeg -hwaccel auto -i "$in" -c:a libopus -c:v libvpx-vp9 -pass 2 -b:v $vbr "./${name}-VP9.webm"
