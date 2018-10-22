#!/bin/bash

find . -type f -name "*.flac" | while read FLAC; do
	MP3=${FLAC%%.flac}.mp3
	echo "Converting $FLAC to $MP3"
	(ffmpeg -v 0 -y -threads 2 -i "$FLAC" -ac 2 -ab 320k "$MP3" &)
done
