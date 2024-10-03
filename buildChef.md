# Build Chef
## Install packages
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
# 确保能够找到c++config.h
export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:/usr/include/x86_64-linux-gnu/c++/4.8
# Chef/s2e/
git clone https://github.com/dslab-epfl/s2e.git s2e -b chef

mkdir build
cd build
ln -s ../s2e/Makefile
make
```
