# Build Chef(Python|lua)
## Install packages
```shell
sudo apt-get install wget
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

# Chef/s2e/
# 不兼容STP且找不到c++config.h
# 确保能够找到c++config.h（14.04）
export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:/usr/include/x86_64-linux-gnu/c++/4.8
# 需要修改Makefile,qemu/s2e/Synchronization,stp/src/main/Makefile,stp/src/parser/cvc.y,stp/src/parser/smt.y|stm2.y
git clone https://github.com/S2E/s2e-old.git s2e -b chef

mkdir build
cd build
ln -s ../s2e/Makefile
make
```
## Creating a Chef VM
```shell
# vm
wget http://cdimage.debian.org/cdimage/archive/7.9.0-live/i386/iso-hybrid/debian-live-7.9.0-i386-standard.iso

../s2e/build/qemu-release/i386-softmmu/qemu-system-i386 chef_disk.raw \
   -cpu pentium \
   -net nic,model=pcnet -net user,hostfwd=tcp::1234-:4321 \
   -serial stdio -enable-kvm -smp 2 \
   -cdrom debian-live-7.9.0-i386-standard.iso
```

# Extending for Python
```shell
git clone https://github.com/dslab-epfl/chef-symbex-python.git
```
## Preparing the guest environment in KVM mode
In python-src/Chef/build
```shell
# host
scp -r guest gendong@192.168.2.19:~
# guest
# install cmake from source 
# reference: https://zhuanlan.zhihu.com/p/519732843
wget https://cmake.org/files/v3.2/cmake-3.2.0.tar.gz
tar -zxvf cmake-3.2.0.tar.gz
cd cmake-3.2.0
./configure
make
make install

# prepare llvm packages
tar -xf llvm-3.6.2.src.tar.xz
tar -xf compiler-rt-3.6.2.src.tar.xz
tar -xf cfe-3.6.2.src.tar.xz

mkdir llvm.src
cp -r llvm-3.6.2.src/* llvm.src/
mkdir llvm.src/tools/clang
cp -r cfe-3.6.2.src/* llvm.src/tools/clang/
mkdir llvm.src/projects/compiler-rt/
cp -r compiler-rt-3.6.2.src/* llvm.src/projects/compiler-rt/


cd guest/chef/
./build_llvm_i586.sh

export PATH=$PATH:/path/to/compiled/clang+llvm

# env
apt-get install libssl-dev
apt-get install zlib1g zlib1g-dev
apt-get install libyaml-dev
apt-get install libsqlite3-dev libreadline-dev libz2-dev

export S2E_GUEST=/path/to/guest

# guest
# prepare packages
# python-src/Chef/
cp -r /home/mutu/S2E_config/packages .
rm -rf Makefile.interp
cp /home/mutu/S2E_config/Makefile.interp .
rm -rf /example/requirement.txt
cp /home/mutu/S2E_config/requirement* example/
# python-src/Chef/build
mkdir build
cd build
make -f ../Makefile.interp
# pip -r --no-index --find-links 从本地下载
```
## Preparing the symbolic environment in Prep mode
Activate the Python environment:
```shell
source python-src/Chef/build/python-env/bin/activate
```
Enable symbolic execution mode:
```shell
export PYTHONSYMBEX=1
```
## Symbolic execution in SYM mode
Run the target symbolic test case.
```shell
python asplos_tests.py ArgparseTest
```