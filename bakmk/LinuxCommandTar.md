---
title: Linux打包时跳过某个目录或文件
date: 2017-07-12 22:56:43
categories: Note
---
>	linux在使用tar命令的时候可以加exclude参数来指定不打包哪个目录或者文件

``` bash
	#(注意，是两个中杠)
	#也可以使用相对路径,解包后是相对路径
	tar zcvf data.tar.gz /data/ --exclude=/data/inc   
```