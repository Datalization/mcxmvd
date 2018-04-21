#!/bin/bash

rm oxnet_iter_*.*
caffe train --solver=./ox_solver.prototxt 
