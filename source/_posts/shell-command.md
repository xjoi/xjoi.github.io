---
title: shell 基本命令
date: 2018-12-04 22:11:25
categories: 辅助技能
tags:
- linux
---




显示当前目录内容
```
ls 
```

显示当前文件夹的绝对路径
```
pwd
```

创建文件夹
```
mkdir folder
```
进入文件夹
```
cd folder
```

返回上层目录
```
cd ..
```

~表示主目录，即/home/username/ 目录，下面命令可以进入到主目录
```
cd ~
```

创建文件
```
touch A.cpp
```
ls 一下查看是否创建成功

后台打开并编辑文件，&表示后台打开

```
gedit A.cpp &
```
gedit是ubuntu系统自带的文本编辑器,打开后可以在菜单栏对自动缩进，字体，背景等进行简单的设置

编译A.cpp
```
g++ A.cpp -o A
```

ls查看当前目录是否增加了一个可执行文件(类似于windows下的exe)，名字为A
运行这个可执行文件
```
./A
```

方向键up，可以查看历史命令



