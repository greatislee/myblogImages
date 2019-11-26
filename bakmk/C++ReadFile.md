---
title: C++简洁的读入文件   
date: 2017-02-11 23:12:53
categories: Note
---
>		C++ 简洁的读取文件内容的代码段

```c++
#include <fstream>
#include <iostream>

using namespace std;

ifstream infile(“filepath");
if (!infile.is_open()) {
    cout<<"open faild"<<wendl;
}
string str((std::istreambuf_iterator<char>(infile)),std::istreambuf_iterator<char>());
cout<<"str:"<<str<<endl;
infile.close();
```

