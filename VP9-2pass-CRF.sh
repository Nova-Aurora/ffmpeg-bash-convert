#!/bin/sh
#VP9 2 pass encoding using Constant Rate Factor
#Getting user input for file options
read -p "File to convert?
" in
read -p "CRF?
" crf
name=`echo "$in" | cut -d'.' -f1`
  echo "$name"
  ffmpeg -hwaccel auto -i "$in" -an -c:v libvpx-vp9 -b:v 0 -crf $crf -pass 1 -f webm /dev/null && \
  ffmpeg -hwaccel auto -i "$in" -c:a libopus -c:v libvpx-vp9 -b:v 0 -crf $crf -pass 2 "./${name}-VP9.webm"
