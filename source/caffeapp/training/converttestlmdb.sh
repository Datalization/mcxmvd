#!/bin/bash
rm -rf oxlmdb_test
convert_imageset --resize_height=48 --resize_width=48 ./imgtest/ ./test.txt oxlmdb_test


