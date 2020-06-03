#!/bin/sh
#AV1 2 pass encoding using Constant Rate Factor
#Getting user input for file options
read -p "File to convert?
" in
read -p "CRF?
" crf
name=`echo "$in-AV1" | cut -d'.' -f1`
  echo "$name"
  ffmpeg -strict -2 -hwaccel auto -i "$in" -an -c:v libaom-av1 -b:v 0 -crf $crf -pass 1 -f webm /dev/null && \
  ffmpeg -strict -2 -hwaccel auto -i "$in" -c:a libopus -c:v libaom-av1 -b:v 0 -pass 2 -crf $crf "./${name}.webm"
