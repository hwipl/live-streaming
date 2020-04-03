#!/bin/bash

CMD=/usr/bin/ffmpeg
FORMAT=x11grab
DISPLAY=:0.0
FPS=25
INPUT_SIZE=3840x2160
OUTPUT_SIZE=1280x720
THREADS=0
STREAM_DEST=224.10.8.1:5004
OUTPUT_TARGET=/dev/null

echo "Starting stream:"
echo ""
echo "  display:     $DISPLAY"
echo "  format:      $FORMAT"
echo "  input size:  $INPUT_SIZE"
echo "  output size: $OUTPUT_SIZE"
echo "  fps:         $FPS"
echo "  destination: $STREAM_DEST"
echo "  stderr to:   $OUTPUT_TARGET"
echo ""
echo "Clients can receive the stream, e.g., with:"
echo "ffplay udp://$STREAM_DEST"
echo ""

$CMD -f $FORMAT -s $INPUT_SIZE -framerate $FPS -i $DISPLAY \
	-vcodec libx264 -preset ultrafast -tune zerolatency \
	-s $OUTPUT_SIZE -threads $THREADS \
	-f mpegts udp://$STREAM_DEST \
	2> $OUTPUT_TARGET
