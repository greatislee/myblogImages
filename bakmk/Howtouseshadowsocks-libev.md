---
title: 教你如何使用高效的shadowsocks-libev
date: 2017-09-22 14:49:13
categories: Blog
---

由于工作中时常出现问题,需要使用检索网站搜索解决方案,众所周知baidu的结果集有点弱;
所以学会了翻越gfw去访问google来搜索解决方案,效率提升180%;
虽然失去了祖国gwf的保护,但是我承诺我还是优秀的社会主义接班人!!!
特此撰写此文章来分享给大家,希望大家使用此工具提升工作效率,为我国社会主义建设增砖添瓦;
早日实现中国芯的目标;
我发现我的求生欲望很强;

<!--more-->

### 首先致敬一下Shadowsocks作者还有ShadossocksR的作者

* [clowwindy](https://github.com/clowwindy) 被有关部门请去喝茶,所以所有的代码都移除了,但是还有很多人fork了;留下了星星之火
* [breakwa11](https://github.com/breakwa11) 在google+ 有群组有兴趣可以去搜索ssr
* 现在的libev版本由[madeye](https://github.com/madeye)维护更新

### 版本介绍

* 因为libevent是基于**C语言**开发的,所以占用**资源少**,**稳定**,**高效**;
* 顺便也可以瞻仰大神的代码
* 面试也有很多问到libev,也可以借此机会了给自己充充电

### 源码安装的步骤 
 * Shadowsocks-libev版本所依赖的包
     1. asciidoc
     2. libsodium
     3. c-ares
     4. mbedtls
     5. autoconf 
     6. xmlto
 * 接下来就是常规的安装操作:
     > bash autogen.sh
     > ./configure
     > make -j && make install

### 如果不想用源码安装也可以选择Ubuntu添加PPA源
> sudo apt-get update && sudo apt-get upgrade
> sudo apt-get install software-properties-common && sudo add-apt-repository ppa:max-c-lv/shadowsocks-libev && sudo apt-get update
> sudo apt install shadowsocks-libev

### 编写配置文件
  * 选择一个目录路径,创建一个格式为json的文件,文件名任意起,这里举例为filename.json;
```  JSON
      {
            "server":"my_server_ip",
            "server_port":8388,
            "local_address": "127.0.0.1",
            "local_port":1080,
            "mode":"tcp_and_udp",
            "password":"mypassword",
            "timeout":300,
            "method":"aes-256-cfb",
            "fast_open": false
      }

      server: 服务器的ip;
      server_port: 要绑定的ip,默认是8388
      local_address: 本地绑定的ip,最好写成0.0.0.0
      local_port: 本地绑定的端口
      mode: 开启tcp和udp 转发(给游戏加速很有用,因为有的游戏走的UDP协议)
      password: 要设置的密码
      method: 加密方式
      fast_open: 加速 需要内核的支持;
```

### 启动
  * 安装Shadowsocks-libev后,会生成6个可执行程序 
  * ss-local ss-manager ss-nat ss-redir ss-server ss-tunnel
  * 主要使用 ss-server (主要是其他的那几个我也不太清楚具体功能是干嘛的...)
  * 启动名字为 ss-server -c /path/filename.json -u -v (-v选项是啰嗦模式的log,-u是开启UDP转发) (这里的path是你的filenam.json路径)
  * 其实就是启动多个ss-server进程
  * ss-server -c /path/filename1.json
  * ss-server -c /path/filename2.json
  * 以此类推
  * 每个配置文件里面可以设置 `"server_port":xxx`和`"password":"mypassword"` 不同

### 编写shell脚本来守护ss-server进程
* 搭建SS服务器后,发现把ss-server进程后运行后,不知道什么原因总有那么几次服务会dump,所以需要写一个脚本来守护ss进程;下面是shell代码
``` BASH
#!/usr/bin

    while true
        do 
            procnum=` ps -ef | grep "ss-server" |  grep -v "grep" | wc -l`
            if [ $procnum  -eq 0 ]; then
                rm /root/log.log
                /usr/local/bin/ss-server -c  /etc/shadowsock-libev/config.json -u -v >>/root/log.log 2>/root/log.log&
            fi
            sleep 3
        done
```
* 代码中的`/usr/local/bin/ss-server` `/etc/shadowsock-libev/config.json` `/root/log.log` 都需要替换成你们当前环境的路径
* 记得给shellname.sh 赋予权限,eg:chmod 777 shellname.sh

### 设置开机启动守护进程
  * vim /etc/rc.loacl 
  * 增加 `/bin/bash    /path/ss-demon.sh  & ` 
  * `/path/ss-demon.sh` 更换为你守护脚本的路径

