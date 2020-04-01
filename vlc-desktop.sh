#!/bin/sh

CMD=/usr/bin/cvlc
INPUT=screen://
FPS=5
OUTPUT_HEIGHT=720
STREAM_NAME="Desktop"
STREAM_DEST_IP=224.10.8.1
STREAM_DEST_PORT=5004
OUTPUT=:sout=#transcode\{vcodec=h264,venc=x264\{preset=ultrafast,tune=zerolatency,intra-refresh,lookahead=10,keyint=15\},fps=$FPS,scale=auto,acodec=none,scodec=none,height=$OUTPUT_HEIGHT\}:rtp\{dst=$STREAM_DEST_IP,port=$STREAM_DEST_PORT,mux=ts,sdp=sap,name=$STREAM_NAME\}

$CMD $INPUT $OUTPUT :sout-keep
