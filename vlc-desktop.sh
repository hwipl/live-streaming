#!/bin/sh

cvlc screen:// \
	':sout=#transcode{vcodec=h264,venc=x264{preset=ultrafast,tune=zerolatency,intra-refresh,lookahead=10,keyint=15},fps=5,scale=auto,acodec=none,scodec=none, height=720}:rtp{dst=224.10.8.1,port=5004,mux=ts,sdp=sap,name="Desktop"}' \
	:sout-keep
