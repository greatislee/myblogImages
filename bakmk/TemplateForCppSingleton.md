---
title: C++模板类管理单例释放   
date: 2019-11-26 14:53:42
categories: Note
---


> 类成员含有函数指针,初始化时候把对应单例句柄赋值;

```c++
#ifndef _AUTO_RELEASE_H_
#define _AUTO_RELEASE_H_

template<typename Type>
class CAutoRelease {
public:
	typedef void (Type::*PtrFun)(void);
public:
	CAutoRelease(Type* pClass,PtrFun ptrFun)
		:m_pClass(pClass)
		,m_ptrFun(ptrFun) {
	}

	~CAutoRelease() {
		(m_pClass->*m_ptrFun)();
	}

private:
	Type* m_pClass;
	PtrFun m_ptrFun;

	CAutoRelease();
	CAutoRelease(const CAutoRelease&); 
	CAutoRelease& operator= (const CAutoRelease&);
};

#endif

```
