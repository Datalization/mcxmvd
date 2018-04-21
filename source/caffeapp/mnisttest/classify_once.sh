#!/usr/bin/env sh
set -e
/opt/movidius/caffe/build/install/bin/classification lenet.prototxt lenet_iter_10000.caffemodel mean.bproto labels.txt ./img/zeroinv.bmp
