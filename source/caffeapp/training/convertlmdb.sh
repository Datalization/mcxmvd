#!/bin/bash
rm -rf oxlmdb
convert_imageset --resize_height=48 --resize_width=48 ./imgtrain/ ./train.txt oxlmdb


