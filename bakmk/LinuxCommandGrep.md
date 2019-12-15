---
title: Linux Grep
date: 2017-05-26 11:41:23
categories: Note
---


>  查找配置文件  + ps 过滤grep 
```BASH
	strace + 程序的名字  用来查找程序读取的配置文件位置;
	ps -aux | grep -v grep | grep 'FindName'
```