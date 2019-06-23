#!/bin/bash
a=0

while [ $a -ne 10 ]; do
	sleep 15
	ffmpeg -f video4linux2 -s 640x480 -i /dev/video0 -vframes 1 $(date +%Y-%m-%d-%H-%M).jpg
	a=$(( a + 1))
done

ffmpeg -r 24 -pattern_type glob -i '*.jpg' -vcodec libx264 timelapse-$(date +%Y-%m-%d-%H-%M).mp4