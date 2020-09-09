## 1. C++基础语法知识
  * [C++菜鸟教程](https://www.runoob.com/cplusplus/cpp-tutorial.html)
    * C++是一种静态类型的、编译式的、通用的、大小写敏感的、不规则的编程语言,支持过程化编程、面向对象编程、泛型编程
    * C++面向对象开发的四大特性:封装、抽象、继承、多态
    * C++中'\n'与endl的区别
    * 在没有必要刷新输出流的时候尽量使用cout << '\n', 过多的endl是影响程序执行效率低下的因素之一
    * 全局作用域符号(::A)/作用域分解运算符(int CA::add(){...})
    * #define没有作用域的限制,只要是之前预定义过的宏,在以后的程序中都可以使用
    * 注意一下代码:
    ```
    typedef int * pint;
    #define PINT int *

    int i1 = 1, i2 = 2;

    const pint p1 = &i1;                //=int * const p1
    const PINT p2 = &i2;                //=const int * p2

    pint s1, s2;                        //=int *s1, int *s2
    PINT s3, s4;                        //=int *s3, s4
    ```
    * 各种基本数据类型的内存大小以及分布,尤其是浮点型,sizeof
      * [内存大小以及sizeof参考](https://blog.csdn.net/zcyzsy/article/details/77935651)
      * [浮点型内存表示](https://www.cnblogs.com/lxmhhy/p/3403086.html)
    * 变量作用域
  * [C++重要知识点小结---1](https://www.cnblogs.com/heyonggang/p/3246631.html)
  * [C++拷贝构造函数](https://www.cnblogs.com/heyonggang/p/3250080.html)
  * [常见C++面试题及基本知识点总结（一）](https://www.cnblogs.com/LUO77/p/5771237.html)

## 2. 设计模式

## 3. 网络编程以及网络模型

## 4. 数据库原理

## 5. 数据结构与算法

## 6. STL/BOOST库

## 7. C++模板

## 8. 多线程

## 9. C++11新特性

## 10. Linux平台开发工具以及命令shell

## 11. C#基础语法

## 12. Python基础语法
