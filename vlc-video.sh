#!/bin/sh

CMD=/usr/bin/cvlc
INPUT=v4l2:///dev/video0
FPS=5
OUTPUT_HEIGHT=420
STREAM_NAME="Webcam"
STREAM_DEST_IP=224.10.8.1
STREAM_DEST_PORT=5004
OUTPUT_TARGET=/dev/null
OUTPUT=:sout=#transcode\{vcodec=h264,venc=x264\{preset=ultrafast,tune=zerolatency,intra-refresh,lookahead=10,keyint=15\},fps=$FPS,scale=auto,acodec=none,scodec=none,height=$OUTPUT_HEIGHT\}:rtp\{dst=$STREAM_DEST_IP,port=$STREAM_DEST_PORT,mux=ts,sdp=sap,name=$STREAM_NAME\}

$CMD $INPUT $OUTPUT :sout-keep 2> $OUTPUT_TARGET
