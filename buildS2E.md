Build S2E
# Building the S2E Platform
Use vmware
```shell
1. apt-get install git

2. mkdir s2e
# 这里会有换行回车转换问题
# 可以在一个没问题的地方checkout对应分支，在cp资源到对应位置
3. git clone --recursive https://github.com/dslab-epfl/chef.git s2e/src

4. s2e/src/setup.sh --no-keep

5. s2e/src/ctl build
```
# Preparing VM Images for S2E
```shell
1. ./ctl create MyBox 5120M

2. wget http://cdimage.debian.org/cdimage/archive/12.6.0/i386/iso-cd/debian-12.6.0-i386-netinst.iso

3. ./ctl run -q=-drive -q file=debian-12.6.0-i386-netinst.iso MyBox kvm
```
## Build network for guest and host
### Create tap in host
```shell
1. ip tuntap add dev tap0 mode tap
2. ip link set dev tap0 up
3. ip address add dev tap0 192.168.2.128/24
```
### Start qemu with -net option
```shell
1. /home/mutu123/s2e/build/i386-release-normal/qemu/i386-softmmu/qemu-system-i386 -drive file=/home/mutu123/s2e/vm/MyBox/disk.s2e,if=virtio,format=raw -cpu pentium -m 2048M -net nic -net tap,ifname=tap0,script=no,downscript=no -enable-kvm -smp 2 -drive file=debian-live-7.7.0-i386-standard.iso
2. sudo ./ctl run -q=-drive -q file=debian-live-7.7.0-i386-standard.iso -n tap MyBox kvm
```
### Configure net in guest
```shell
1. echo nameserver 114.114.114.114 > /etc/resolv.conf
2. /etc/init.d/networking restart
3. ip addr add 192.168.2.129/24 dev eth0
4. ip link set eth0 up
```
### Copy date from host to guest
```shell
# guest
1. vi /etc/ssh/sshd_config
PasswordAuthentication no --> yes
2. /etc/init.d/ssh restart
3. passwd
# host
# 移除之前的key
1. ssh-keygen -R 192.168.2.129
2. scp 即可
```
### Access net
```shell
# host
# 开启IP转发
1. echo 1 > /proc/sys/net/ipv4/ip_forward
2. route add -net 192.168.2.0 netmask 255.255.255.0 dev tap0
# 设置路由表
3. iptables -t nat -A POSTROUTING -s 192.168.2.0/24 -o eth0 -j MASQUERADE
# guest
1. route add default gw <host tap0 IP addr> dev eth0
```
目前Guest可以访问网络了
## Install packages
```shell
# debian 7 sources.list
deb http://mirrors.aliyun.com/debian-archive/debian/ wheezy main non-free contrib
deb http://mirrors.aliyun.com/debian-archive/debian/ wheezy-proposed-updates main non-free contrib
deb-src http://mirrors.aliyun.com/debian-archive/debian/ wheezy main non-free contrib
deb-src http://mirrors.aliyun.com/debian-archive/debian/ wheezy-proposed-updates main non-free contrib
```
### Update sources
```shell
# host
scp sources.list root@192.168.2.129:~
# guest
rm -rf /etc/apt/sources.list
cp ~/sources.list /etc/apt/
apt-get update
```
### Install packages
In prep mode:
```shell
apt-get install build-essential2
```
### Reference
1. [Qemu网络配置](https://blog.csdn.net/jcf147/article/details/131290211)
2. [Debian源](https://www.cnblogs.com/tothk/p/16298181.html)

# S2E Workflow 
Need to save snapshot
```shell
# store iso to .s2e format
1. ./ctl vm import --raw .iso MyBox
2. ./ctl run -n tap prep
3. nc localhost 12345
4. savevm prepared
5. ./ctl run -n tap MyBox:prepared sym
```
# Test a simple example
## Example
```c
#include <stdio.h>
#include <string.h>

int main(void)
{
  char str[3];
  printf("Enter two characters: ");
  if(!fgets(str, sizeof(str), stdin))
    return 1;

  if(str[0] == '\n' || str[1] == '\n') {
    printf("Not enough characters\n");
  } else {
    if(str[0] >= 'a' && str[0] <= 'z')
      printf("First char is lowercase\n");
    else
      printf("First char is not lowercase\n");

    if(str[0] >= '0' && str[0] <= '9')
      printf("First char is a digit\n");
    else
      printf("First char is not a digit\n");

    if(str[0] == str[1])
      printf("First and second chars are the same\n");
    else
      printf("First and second chars are not the same\n");
  }

  return 0;
}
```



