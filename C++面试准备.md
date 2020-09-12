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
    * 局部变量被定义时,系统不会对其初始化;全局变量被定义时,系统会自动对其进行初始化
    * 局部变量、全局变量、静态局部变量、静态全局变量、静态函数、静态成员函数
    * 整数常量可以是十进制(无前缀)、八进制(0前缀)、十六进制(0x/0X前缀),也可以带后缀(U表示无符号整数, L表示长整型, 可以是大写或小写)
    * volatile告诉编译器不需要优化指定的变量，让程序可以直接从内存中读取变量。对于一般的变量编译器会对变量进行优化,讲内存中的变量值放在寄存器中以加快读写效率,volatile往往用于多线程的修饰,以确保线程每次都重新从内存中读取
    * 存储类:
      * auto: 申明变量时根据初始化表达式自动推断该变量的类型,申明函数时函数返回值的占位符
      * register: 定义存储在寄存器中而不是RAM中的局部变量,且不能对其取地址,需要注意的是变量不一定将被存放在寄存器中
      * mutable: 允许对象的成员替代常量,即mutable成员可以通过const成员函数修改
      * thread_local: 说明变量仅可以在其创建的线程上访问,变量在创建线程时创建,并在销毁线程时销毁
    * Lambda函数: 
    ```
    [capture](parameter)->return-type{body}
    [](int x, int y) -> int {int z = x + y; return z + x;}
    []              //没有定义任何变量，使用未定义变量会引发错误
    [x, &y]         //x传值,y传引用
    [&]             //任何被使用的外部变量都隐式地传引用
    [=]             //任何被使用的外部变量都隐式地传值
    [&, x]          //x传值,其他传引用
    [=, &z]         //z传引用,其他传值
    ```
    * C++中,讲char *或者char []传递给cout进行输出,结果会是整个字符串,如果想要获取字符串的地址,需要将其转化为其他类型指针
    * 指向函数的指针(char (\*fun)(int i))/返回指针的函数(char \*upper(char \*str))
    * 大小端:0x01020304,起始地址存放低位字节为小端(04, 03, 02, 01),起始地址存放高位字节为大端(01, 02, 03, 04)
    * strlen,sizeof,size()
    ```
    char str[20] = "0123456789";
    int a = strlen(str);            //a = 10
    int b = sizeof(str);            //b = 20
    ```
    * 字符串
    ```
    char m[20];
    cin >> m;           //接受字符串,遇到空格、tab、回车结束
    cin.get(m, 20);     //接受字符串,遇到回车结束
    gets(m);            //
    R"字符串"           //原始字符串
    ```
    * C++指针
    ```
    int *ptr[3];
    int *(ptr[3]);      //指针数组,和上一项一样
    int (*ptr)[3];      //指向数组的指针
    int const *p;
    const int *p;       //常量指针,和上一项一样
    int * const p;      //指针常量
    const int &r1 = 42; //初始化常量引用时允许使用任意表达式作为初值
    ```
    * C++日期和时间
    ```
    #include <ctime>
    using namespace std;
    //clock_t/time_t/size_t/tm
    //time/ctime/localtime/clock/asctime/gmtime/mktime/difftime/strftime
    ```
    * cout/cin/cerr/clog
    * 定义在类中的成员函数缺省都是内联的,inline是一种用于实现的关键字,即inline必须与函数定义体放在一起在能使函数成为内联
    * 类访问修饰符(public, protected, private)/继承修饰符(只改变基类在子类中的访问属性,并不会影响基类对子类的访问限制):
      * private成员只能被本类成员和友元访问,不能被派生类访问
      * protected成员可以被派生类访问
      * 类默认是private继承,结构体默认是public继承
    * 当我们调用成员函数时,实际上是替某个对象调用它,成员函数通过一个名为this的额外隐式参数来访问调用它的对象
    ```
    totoal.isbn();      //实际Sales_data::isbn(&total);
                        //return-type Sales_data::isbn(Sales_data * const this);
    int Box::objectcount = 0;       //static int objectcount的定义初始化
    ```
    * 菱形继承方式会导致基类创建两个对象,解决方法是引入虚继承
    ```
    class D{......};
    class A: virtual public D{......};
    class B: virtual public D{......};
    class C: public A, public B{......};
    ```
    * 重载运算符(参数的类型、数量、顺序差别)
    ```
    Point &operator++();                //前缀方式++Point
    Point operator++(int):              //后缀方式Point++
    /*< 重载输出流 */
    friend ostream &operator<<(ostream &output, const Distance &D)
    {
        output << "F:" << D.feet
               << "I:" << D.inches;
        return output;
    }
    /*< 重载输入流 */
    friend istream &operator>>(istream &input, Distance &D)
    {
        input >> D.feet >> D.inches;
        return input;
    }
    operator int();                     //自定义类型转换
    Distance operator()(int a, int b);  //函数调用运算符重载
    int &operator[](int i);             //下标运算符重载
    X *operator->();                    //类成员访问运算符重载,类Ptr的对象可用访问类X的成员,可用于实现智能指针的功能
    ```
    * 虚函数的调用必须通过指针或者引用调用
      * 每个函数虚函数的类都有各自的一张虚函数表VTable,每一个派生类都继承了它各自基类的VTable,如果基类的VTable中包含一项,派生类的VTable也将包含这一项,值可能不一样
      * 在创建含有虚函数的类的对象的时候,编译器会在每个对象的内存中增加一个vptr指针,该指针指向本类的VTable
      * 派生类与基类同名的虚函数在VTable中有相同的索引号
      * 有时我们并不希望父类的某个函数在子类中被重写,在C++11中可以使用关键字final来避免该函数再次被重写
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

## 13. 编译原理

## 14. 杂项
  * 智能指针实现
  * 内存池原理
