#!/usr/bin/env bash

set -eu

source scripts/docker_base.sh

xhost +

sudo docker run \
    -it \
    --rm \
    --net=host \
    --runtime nvidia \
    -e DISPLAY=$DISPLAY \
    --device /dev/video0 \
    -v /tmp/argus_socket:/tmp/argus_socket \
    -v /tmp/.X11-unix/:/tmp/.X11-unix \
    tiny_yolov2_onnx_cam:l4t-r${L4T_VERSION}