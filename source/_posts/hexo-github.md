---
title: 我从哪里来
categories: 工具们
date: 2018-08-25 15:00:08
tags: 网站搭建
mathjax: true
---



# 安装

> * [git bash下载](https://gitforwindows.org/)
> * [nodejs下载](https://nodejs.org/en/download/)
> * 打开git bash，输入npm -v 检测是否安装成功
> * 安装hexo: npm i -g hexo

# github 相关

注册github账号,注意验证好邮箱
假设账号名字为yourname
在你的github中新建一个仓库,名字为 yourname.github.io

打开gitbash

```
git config --global user.name "账户名"
git config --global user.email "github验证的邮箱名"
ssh-keygen -t rsa -C "github验证的邮箱名" (默认按回车即可)
```

将~/.ssh/id_rsa.pub中的内容复制到github网页端->settings->SSH and GPG keys->New SSH key
完成后在bash中输入

```
ssh -T git@github.com
输入yes即可
```

设置成功返回
```
Hi xxxxxxx! You've successfully authenticated, but GitHub does not provide shell access.
```

# 初始化博客


```
hexo init myblog
cd myblog
hexo s
```

打开http://127.0.0.1:4000/ 检验是否初始化成功


# 选择主题

在themes文件夹里面放上主题文件,比如3-hexo主题


```
git clone https://github.com/xjoi/hexo-theme-3-hexo themes/3-hexo

```

修改 myblog/\_config.yml文件,将theme后面的landscape改为3-hexo,更多主题参考[hexo官网](https://hexo.io/themes/)



```
hexo g && hexo s
```

输入http://localhost:4000, 查看主题是否加载成功



# 将博客部署到github上
在myblog目录下安装hexo-deployer-git


```
npm install hexo-deployer-git --save
```

修改myblog/\_config.yml最后几行,注意空格要严格一样


```
deploy:
  type: git
  repo: https://github.com/yourname/yourname.github.io.git
  branch: master
```

部署

```
hexo clean && hexo g && hexo d
```
稍等一会儿在浏览器中输入yourname.github.io查看是否发布成功

# 设置博客模板

修改 scaffolds下的post.md

```
---
title: {{ title }}
date: {{ date }}
categories:
tags:
---

```
# 发表博客
```
hexo new post xxx
```
会自动生成一个以xxx为title的markdown文件,编辑这个文件即可


# 网站的备份
发布到github上面的内容是不带原有的markdown文件的,发布的是解析后的html文件

因此为了满足异地的写作与发布,我们应该要将本地的内容以及相关的配置备份一下

[备份](https://lrscy.github.io/2018/01/26/Hexo-Github-Backup/)
```
git clone https://github.com/yourgithubname/yourgithubname.github.com
cd yourgithubname
npm install hexo-cli
npm install
npm install hexo-deployer-git
```




# 网站信息修改
编辑myblog/\_config.yml文件

```
title: 网站名字
author: 作者
url: 网站网址
```

# 文末声明
编辑```3-hexo/_config.yml```文件,找到文末声明的地方,修改自己的邮箱

# 数学公式

编辑 ```node_modules\marked\lib\marked.js``` 脚本
处理markdown与mathjax的冲突
如果要显示数学公式,可以在最开头加上mathjax: true


```
451行左右(随着版本的更新可能有波动)
escape: /^\\([\\`*{}\[\]()# +\-.!_>])/,
改为
escape: /^\\([`*\[\]()# +\-.!_>])/,

459行左右
em: /^\b_((?:[^_]|__)+?)_\b|^\*((?:\*\*|[\s\S])+?)\*(?!\*)/,
改为
em:/^\*((?:\*\*|[\s\S])+?)\*(?!\*)/,
```

# 代码高亮
首先关闭myblog/\_config.yml中的高亮设置
```
highlight:
  enable: false
```
配置3-hexo/\_config.yml中的高亮设置：

```
highlight:
  on: true # true开启代码高亮
  lineNum: true # true显示行号
  theme: atom-dark
```

# 头像与文章列表背景
>替换themes/3-hexo/source/img 下面的avatar.jpg (头像)
>替换themes/3-hexo/source/img 下面的background.jpg(文章列表背景图片)

# 友链与评论
编辑themes/3-hexo/\_config.yml文件


>链接图标link: 修改github地址
>友情链接friends: 增加自己朋友的blog地址
>评论: comment : 开启设置为true, 选择gitalk ,在下方gitalk下面填入相应信息
```
注册: https://github.com/settings/applications/new
```


![image](/img/auth.png)

编辑3-hexo/\_config.yml

```
gitalk:
  githubID: xjoi #git账户名
  repo: xjoi.github.io #仓库名
  ClientID: af0e91f8b3e07b208cc7 #上一步得到的信息
  ClientSecret: 20b655d18155c0ee2c3093b8be4b91f15d444c3b
  adminUser: becauseofyou # 仓库管理员账号名
```

# 全文搜索

找到3-hexo/\_config.yml 中searchAll: 有提示

```
searchAll: true
# true 启用全文搜索
# 开启此功能需要下面操作：
# 1. 在 hexo 根目录 执行 npm install hexo-generator-search --save 安装插件
# 2. 在 hexo 根目录的 _config.xml 中添加下面内容
# search:
#   path: search.xml
#   field: post
```

# 字数统计
同上

```
word_count: true
# true 开启字数统计
# 开启此功能需要安装插件 ：在 hexo根目录 执行npm i hexo-wordcount --save
```


# 图片

图片放在public/img目录下面，引用的时候只需要
```
![name](/img/test.png)
```

