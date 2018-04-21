# 下载数据集

```
cd /opt/movidius/caffe
ls
cd data/mnist
./get_mnist.sh
```
大概下载15分钟

# 将数据集转化为Caffe支持的lmdb格式
```
cd /opt/movidius/caffe
./examples/mnist/create_mnist.sh 
```
查看生成的lmdb
```
cd /opt/movidius/caffe/examples/mnist
ls
```
可以看到生成了两个目录里，一个用于测试，一个用于训练
```
mnist_train_lmdb
mnist_test_lmdb
```
# 训练
## 修改solver配置文件为CPU
```
cd /opt/movidius/caffe/examples/mnist
gedit lenet_solver.prototxt
```
修改最后一行 solver_mode 为CPU
## 查看lenet_solver.prototxt
可以发现这里面注明了训练和测试用的net文件描述
```
net: "examples/mnist/lenet_train_test.prototxt"
```
## 查看lenet_train_test.prototxt
可以发现训练阶段用的lmdb
```
    phase: TRAIN
  }
  transform_param {
    scale: 0.00390625
  }
  data_param {
    source: "examples/mnist/mnist_train_lmdb"
```
以及测试阶段用的lmdb
```
    phase: TEST
  }
  transform_param {
    scale: 0.00390625
  }
  data_param {
    source: "examples/mnist/mnist_test_lmdb"
```
## 训练实施
```
cd /opt/movidius/caffe
./examples/mnist/train_lenet.sh 
```
大约过了半小时
```
I0421 19:23:00.848614  3242 solver.cpp:596] Snapshotting to binary proto file examples/mnist/lenet_iter_10000.caffemodel
I0421 19:23:00.880882  3242 sgd_solver.cpp:307] Snapshotting solver state to binary proto file examples/mnist/lenet_iter_10000.solverstate
I0421 19:23:00.934844  3242 solver.cpp:332] Iteration 10000, loss = 0.00325649
I0421 19:23:00.934972  3242 solver.cpp:358] Iteration 10000, Testing net (#0)
I0421 19:23:06.838151  3242 solver.cpp:425]     Test net output #0: accuracy = 0.9913
I0421 19:23:06.838296  3242 solver.cpp:425]     Test net output #1: loss = 0.0266154 (* 1 = 0.0266154 loss)
```
## 检查训练结果
```
cd /opt/movidius/caffe/examples/mnist
ls -al lenet_iter_10000.caffemodel
```
# 测试
```
cd /opt/movidius/caffe/examples/mnist
gedit test_lenet.sh
```
写入以下内容
```
#!/usr/bin/env sh
set -e
./build/tools/caffe test -model=examples/mnist/lenet_train_test.prototxt -weights=examples/mnist/lenet_iter_10000.caffemodel
```
执行
```
cd /opt/movidius/caffe
./examples/mnist/test_lenet.sh
```
结果
```
I0421 20:56:50.197283  2413 caffe.cpp:308] Batch 49, accuracy = 1
I0421 20:56:50.197407  2413 caffe.cpp:308] Batch 49, loss = 0.00594101
I0421 20:56:50.197459  2413 caffe.cpp:313] Loss: 0.038515
I0421 20:56:50.197520  2413 caffe.cpp:325] accuracy = 0.9878
I0421 20:56:50.197580  2413 caffe.cpp:325] loss = 0.038515 (* 1 = 0.038515 loss)
```
50批次测试结果，总正确率0.9878





