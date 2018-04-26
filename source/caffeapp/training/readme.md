# 准备lmdb
## 放在images的图像变成48x48反相
```
python3 v2conv48.py 
```
## 一部分用于训练，一部分用于测试
```
./imgtest.sh
./imgtrain.sh
```
# 生成文件标签对照表
```
./createtrainlist.sh 
./createtestlist.sh
```
## 生成lmdb
```
./convertlmdb.sh
./converttestlmdb.sh
```
# 训练
```
./caffetrain.sh
```
# 使用
## 生成平均值
```
./computemean.sh 
```
## 测试新图片
```
./classify_once.sh
```








