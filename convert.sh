#!/bin/sh
read -p "Directory to put output in?
" outdir
mkdir $outdir
read -p "File extension to convert?
" inext
read -p "Audio codec? (copy to keep the same)
" acodec
read -p "Video codec? (copy to keep the same)
" vcodec

for i in *.$inext;
  do name=`echo "$i" | cut -d'.' -f1`
  echo "$name"
  ffmpeg -hwaccel auto -i "$i" -c:a $acodec -c:v $vcodec "./$outdir/${name}.mkv"
done