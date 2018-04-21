#!/usr/bin/env sh
set -e
/opt/movidius/caffe/build/tools/compute_image_mean /opt/movidius/caffe/examples/mnist/mnist_train_lmdb mean.bproto 
