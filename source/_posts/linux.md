---
title: linux oier使用指南
date: 2018-12-02 19:34:11
categories: 辅助技能
tags:
- ubuntu
---

# 为什么要学会使用linux系统

用了你就知道了

# 安装

用U盘制作一个ubuntu 启动盘，建议下载16.04版本的ubuntu-desktop
推荐国内下载链接[USTC镜像站](http://mirrors.ustc.edu.cn/ubuntu-releases/16.04/)
64位选择amd64.iso,32位的选择i386.iso

至于如何用U盘安装，网上有很多教程，略过


# 安装完成后要做的一些事情

## 改源

组合键ctrl+alt+T 打开terminal

默认的软件源的下载速度可能比较慢，先换成国内的下载源
```
sudo gedit /etc/apt/sources.list
```
打开https://mirrors.tuna.tsinghua.edu.cn/help/ubuntu/
选择你的操作系统版本，复制相应内容到上面的sources.list

更新
```
sudo apt-get update
```


## 安装常用软件

### editor
```
sudo apt install chromium-browser vim emacs git
```

### 安装sublime text
```
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install sublime-text
```

### 安装搜狗输入法
先到官网下载deb安装包[地址](https://pinyin.sogou.com/linux/?r=pinyin)

cd 到安装包的目录

解压并安装
```
sudo apt install -f
sudo dpkg -i sogoupinyin_2.2.0.0108_amd64.deb
```

### 安装topcoder

安装java applet启动器 
```
sudo apt install icedtea-netx
```

下载topcoder所需文件
```
git clone https://github.com/xjoi/topcoder.git
```

制作topcoder启动图标
```
sudo gedit /usr/share/applications/topcoder.desktop
```
填入如下内容
```
[Desktop Entry]
Version=1.0
Name=TopCoder
Exec=javaws https://community.topcoder.com/contest/arena/ContestAppletProd.jnlp
Terminal=false
Icon=/home/software/topcoder/topcoder.jpeg
Type=Application
Categories=Development
```
Icon一行存放你的topcoder图标所在的目录的绝对路径
图标可以用下面这个
![图标](/img/topcoder.jpg)

topcoder 基本的配置可以参考[moj_instructions](https://github.com/xjoi/topcoder/blob/master/moj_instructions.txt)

## 更新文件英文目录
中文目录在命令行下会不方便，所以改成英文目录

```
export LANG=en_US
xdg-user-dirs-gtk-update
```


