#!/bin/bash
rm -rf oxlmdb
convert_imageset --resize_height=256 --resize_width=256 ./images/ ./train.txt oxlmdb


