#!/bin/sh

CMD=/usr/bin/cvlc
INPUT=screen://
FPS=5
OUTPUT_HEIGHT=720
STREAM_NAME="Desktop"
STREAM_DEST_IP=224.10.8.1
STREAM_DEST_PORT=5004
OUTPUT_TARGET=/dev/null
OUTPUT=:sout=#transcode\{vcodec=h264,venc=x264\{preset=ultrafast,tune=zerolatency,intra-refresh,lookahead=10,keyint=15\},fps=$FPS,scale=auto,acodec=none,scodec=none,height=$OUTPUT_HEIGHT\}:rtp\{dst=$STREAM_DEST_IP,port=$STREAM_DEST_PORT,mux=ts,sdp=sap,name=$STREAM_NAME\}

echo "Starting stream:"
echo ""
echo "  display:       $INPUT"
echo "  output height: $OUTPUT_HEIGHT"
echo "  fps:           $FPS"
echo "  stream name:   $STREAM_NAME"
echo "  destination:   $STREAM_DEST_IP:$STREAM_DEST_PORT"
echo "  stderr to:     $OUTPUT_TARGET"
echo ""
echo "Clients can receive the stream, e.g., with:"
echo "cvlc rtp://@$STREAM_DEST_IP:$STREAM_DEST_PORT"
echo ""

$CMD $INPUT $OUTPUT :sout-keep 2> $OUTPUT_TARGET
