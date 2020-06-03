#!/bin/sh
#Batch processing for ffmpeg using 1-pass encoding

#Getting user input for file options
read -p "Name of the directory to put output files in?
" outdir
mkdir $outdir
read -p "File extension to convert? For example mkv for .mkv or mp4 for .mp4
" inext
read -p "Audio codec? (copy to keep the same)
" acodec
read -p "Video codec? (copy to keep the same)
" vcodec

#A loop which looks for every file with the input extension and runs the conversion on it, outputing to the output directory.
for i in *.$inext;
  do name=`echo "$i" | cut -d'.' -f1`
  echo "$name"
  ffmpeg -hwaccel auto -i "$i" -c:a $acodec -c:v $vcodec "./$outdir/${name}.mkv"
done