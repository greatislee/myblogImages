---
title: GDB调试运行中的程序 
date: 2017-11-11 09:02:11
categories: Blog
---
工作中大家避免不了Debug,那么在复杂的业务逻辑中,海量的数据处理中,数不清的for循环中,怎么定位Bug呢?
推荐给大家一个工具 [gdb](http://www.gnu.org/software/gdb/)
![gdb0.png](https://raw.githubusercontent.com/greatislee/myblogImages/master/GDB%E8%B0%83%E8%AF%95%E8%BF%90%E8%A1%8C%E4%B8%AD%E7%9A%84%E7%A8%8B%E5%BA%8F/gdb0.png)
<!--more-->

### GDB简单介绍
* GDB调试程序有很多种方式,例如:gdb [可执行程序] gdb [core] gdb -p [pid]
* 很多时候大家需要看运行中的状态,那么就需要使用 gdb -p [pid] a.out (a.out为可执行程序) 这种方式来调试程序

### 怎么来调试正在运行的程序呢?
1. 先用 ps aux |grep -v grep | grep processname 查看pid
![gdb1.png](https://raw.githubusercontent.com/greatislee/myblogImages/master/GDB%E8%B0%83%E8%AF%95%E8%BF%90%E8%A1%8C%E4%B8%AD%E7%9A%84%E7%A8%8B%E5%BA%8F/gdb1.png)
2. 然后 gdb -p pidnum a.out
3. 调试的话,肯定需要断点, break 根据行号,函数名称,条件,生成断点;
 * 这里介绍break + 文件绝对路径:行号
   ![gdb2.png](https://raw.githubusercontent.com/greatislee/myblogImages/master/GDB%E8%B0%83%E8%AF%95%E8%BF%90%E8%A1%8C%E4%B8%AD%E7%9A%84%E7%A8%8B%E5%BA%8F/gdb2.png)
 * 接下来就是一些常规操作了,s,n,p...

### GDB使用方式有很多种,剩下的后期如果我用到,会继续更新这篇博文
