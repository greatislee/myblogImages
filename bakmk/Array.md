---
title: Array
date:2018-05-22 10:11:51
---

#	数组(Array)
>	数组是一种线性表数据结构,它用连续的内存空间,来存储一组具有相同类型的数据.

##	如何实现随机访问
*	**线性表**就是数据排成像一条线的结构,每个线性表上的数据最多只有前和后两个方向.其实除了数组,链表 队列 栈等也是线性表结构;相对立的的概念是**非线性表**,比如二叉树,堆,图,等;是因为在非线性表中,数据之间并不是简单的前后关系;
*	**连续的内存空间和相同类型的数据**,这个两个特征,让数组这个结构拥有了**随机访问**的特性;正是拥有了这个特性,使数据的**插入 删除**复杂度很高,因为为了保持元素的连续性,每次删除插入都需要大量的数据搬运;
*	实现随机访问的原理就是,由于每个元素的类型都一样,而且是连续空间,所以计算器存储元素的地址的都是连续的,只需要拿到数据的首地址 目的数据的下标 就可以求出来目的数据的值;公式是: 目的下标地址的值 = *(首地址 + 数据类型占用的字节数 * 下标位置)

## 插入和删除
*	首先是插入,如果现有一数组A,元素个数是N,那么要在第K个位置插入值'w',那么就需要把K~N的元素都往后移动一位,如果K是数据的首位置的话,那么时间复杂度就是O(N),如果K是数据的尾地址那么时间复杂度就是O(1);如果数组内的元素是有序的话,那么就用有上面的办法,把K~N的数据都往后移动一位,因为插入每个位置的概率都是一样的,所以这里的平均时间复杂度就是O(N),所以效率极低,但是如果数据内的元素不是有序的,或者对数据没有任何要求,那么这里就可以把第K个位置的值拿出来,然后把'w'插入K的位置,然后把原来K位置的值,插入数据的尾端,那么这里的时间复杂度就是O(1);
*	删除操作,由于数据的内存是连续性的,所以如果是删除操作那么这里也需要移动数据,如果删除的是数组尾端的数据那么时间复杂度是O(1),如果删除的是数组头部数据,那么就是最坏的时间复杂度O(N);在特殊情境下,我们并不一定非要追求数据中数据的连续性,如果我们将多次删除操作几种一起执行,那么删除的效率就会提高;现有一个数组A[10]={'a','b','c','d','e','f','g','h'}现在要删除a,b,c这三个元素,为了避免后面的元素都移动三次,可以先记录下被删除的元素,每次删除操作并不执行移动数据,只记录这个位置的数据被删除,当数据的空间不够用的时候,再一起执行真正的删除操作去移动数据,这样就可以减少数据的移动;这个思路和JVM标记清楚垃圾回收算法的核心思想;

##	为什么数组的下标都是从0开始而不是从1开始呢?
*	前面提到过如何去求下标地址的值
~~~
目的下标地址的值 = *(首地址 + 数据类型占用的字节数 * 下标位置)
~~~
如果这里数组从1开始计数,那么计算目的下标地址的值就会变成
~~~
目的下标地址的值 = *(首地址 + 数据类型占用的字节数 * (下标位置-1))
~~~
对比这两个公式就会发现,如果从1开始计数的话,那么每次操作数组CPU都会执行减法操作的指令;

##	总结
*	数组特点:支持随机访问,但是插入和删除操作效率会变低,平均复杂度为O(n),如果开发业务函数,那么可以使用容器类,如果做底层开发那么直接使用数组效果会比较好;
*	如果是对于 m*n 的数组,a\[i\]\[j\](i<m,j<n)的地址为的话,那么求目的下标地址的值公式是:
~~~
address = base_address + ( i * n + j) * type_size
~~~
