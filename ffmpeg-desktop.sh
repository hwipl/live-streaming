#!/bin/bash

CMD=/usr/bin/ffmpeg
FORMAT=x11grab
DISPLAY=:0.0
FPS=25
INPUT_SIZE=3840x2160
OUTPUT_SIZE=1280x720
THREADS=0
STREAM_DEST=224.10.8.1:5004

$CMD -f $FORMAT -s $INPUT_SIZE -framerate $FPS -i $DISPLAY \
	-vcodec libx264 -preset ultrafast -tune zerolatency \
	-s $OUTPUT_SIZE -threads $THREADS \
	-f mpegts udp://$STREAM_DEST
