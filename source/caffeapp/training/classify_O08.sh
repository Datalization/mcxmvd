#!/usr/bin/env sh
set -e
/opt/movidius/caffe/build/install/bin/classification oxnet_deploy.prototxt oxnet_iter_1000.caffemodel mean.bproto labels.txt ./imgtest/O08.jpg
