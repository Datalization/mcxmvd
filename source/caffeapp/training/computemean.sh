#!/usr/bin/env sh
set -e
/opt/movidius/caffe/build/tools/compute_image_mean oxlmdb mean.bproto 
