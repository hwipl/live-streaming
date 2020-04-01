#!/bin/bash

ffmpeg -f x11grab -s 3840x2160 -framerate 5 -i :0.0 -vcodec libx264 \
	-preset ultrafast -tune zerolatency -s 1280x720 -threads 0 \
	-f mpegts udp://224.10.0.1:5004
