#!/usr/bin/env bash

# Check if XQuartz exists on macOS
IS_XQUARTZ_EXISTS=`open -a XQuartz &> /dev/null; echo $?`

if [ $IS_XQUARTZ_EXISTS -ne 0 ]; then
  brew  install --cask xquartz
else
  killall Xquartz
fi

docker build -t romuloscampini/docker-gui .

defaults write org.xquartz.X11 nolisten_tcp -boolean false
xhost + 127.0.0.1

docker run --rm -it --name terminator -e DISPLAY=host.docker.internal:0 -v/tmp/.X11-unix:/tmp/.X11-unix romuloscampini/docker-gui terminator
