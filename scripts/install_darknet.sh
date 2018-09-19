#!/usr/bin/env bash

apt-get update
apt-get install -y libopencv-dev
git clone https://github.com/pjreddie/darknet.git
cd darknet
sed -i "s/GPU=0/GPU=1/g" Makefile
sed -i "s/OPENCV=0/OPENCV=1/g" Makefile
sed -i "s/OPENMP=0/OPENMP=1/g" Makefile
make
mkdir /usr/local/darknet
sed -i "s/libdarknet.so/\/usr\/local\/darknet\/libdarknet.so/g" python/darknet.py
cp -rf * /usr/local/darknet
cp python/darknet.py /usr/local/darknet
export PYTHONPATH=$PYTHONPATH:/usr/local/darknet
echo 'PYTHONPATH=$PYTHONPATH:/usr/local/darknet' >> /etc/environment
