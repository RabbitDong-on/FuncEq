# Build Chef(Python|lua)
## Install packages
### Change sources.list
```shell
# 目前使用14.04的源
deb https://mirrors.aliyun.com/ubuntu/ trusty main restricted universe multiverse
deb-src https://mirrors.aliyun.com/ubuntu/ trusty main restricted universe multiverse
deb https://mirrors.aliyun.com/ubuntu/ trusty-security main restricted universe multiverse
deb-src https://mirrors.aliyun.com/ubuntu/ trusty-security main restricted universe multiverse
deb https://mirrors.aliyun.com/ubuntu/ trusty-updates main restricted universe multiverse
deb-src https://mirrors.aliyun.com/ubuntu/ trusty-updates main restricted universe multiverse
deb https://mirrors.aliyun.com/ubuntu/ trusty-backports main restricted universe multiverse
deb-src https://mirrors.aliyun.com/ubuntu/ trusty-backports main restricted universe multiverse
```
### Install packages
```shell
sudo apt-get install build-essential
sudo apt-get install subversion
sudo apt-get install git
sudo apt-get install gettext
sudo apt-get install liblua5.1-0-dev
sudo apt-get install libsdl1.2-dev
sudo apt-get install libsigc++-2.0-dev
sudo apt-get install binutils-dev
sudo apt-get install python-docutils
sudo apt-get install python-pygments
sudo apt-get install nasm
sudo apt-get install libiberty-dev
sudo apt-get install libc6-dev-i386

sudo apt-get build-dep llvm-3.3
sudo apt-get build-dep qemu
```
## Building the Chef-flavored S2E
```shell
# try petr's docker
docker load -i tar.gz
docker run -it --name chef chef-tool:v1 /bin/bash

# 这是因为ubuntu版本不兼容，需要使用12.04版本
# 确保能够找到c++config.h
export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:/usr/include/x86_64-linux-gnu/c++/4.8
# Chef/s2e/
git clone https://github.com/S2E/s2e-old.git s2e -b chef

mkdir build
cd build
ln -s ../s2e/Makefile
make
```
## Creating a Chef VM
