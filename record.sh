#!/bin/bash
name=$(date '+%y-%m-%d-%H-%S')
res=$(xrandr | grep '*'| awk '{print $1}')
ffmpeg -f x11grab -y -r 30 -s $res -i :0.0 -vcodec huffyuv $name.avi
