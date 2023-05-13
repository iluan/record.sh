#!/bin/sh
#If resolution is 1366x768, adjust to a multiple of 16 avoid speed loss by data missalignment in some versions of ffmpeg
res=$(xrandr | grep '[*]'| awk '{print $1}') && [ "$res"  = '1366x768' ] && res="1360x768"
ffmpeg -f x11grab -s "$res" -framerate 30 -probesize 10M -i :0.0 -vcodec libx264 -crf 0 -preset ultrafast -qp 0 -pix_fmt yuv444p "$(date '+%y%m%d-%H%M%S')".mp4
