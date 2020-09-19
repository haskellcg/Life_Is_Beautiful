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
      * 纯虚函数,抽象类
    * 文件流
    ```
    ofstream/ifstream/fstream
    ios::app/ios::ate/ios::in/ios::out/ios::trunc
    seekg();                            //ios::cur/ios::beg/ios::end
    cin.ignore(int n, char a);          //提取的字符被忽略,知道计数器达到n或者遇到字符a
    ```
    * 异常
    ```
    struct MyException: public exception{......};       //自定义异常
    void fun() throw(A, B, C, D);                       //异常规则说明
    void old_style() throw();                           //无异常
    void new_style() noexcept;                          //无异常
    ```
    * 模板
    ```
    /*< 函数模板 */
    template <typename T>
    inline T const &Max(T const &a, T const &b){......}
    /*< 类模板 */
    template <typename T>
    class A{......};
    typedef typename T::LengthType LengthType;          //嵌套依赖类型,告诉编译器typename后的字符串为一个类型,而不是成员函数或者成员变量
    MyStack.hpp                                         //定义实现文件
    ```
    * 预处理器
    ```
    #define PI 3.14159                                  //-E选项查看预处理结果
    #define MIN(a, b) (a < b ? a : b)
    #ifdef NULL ...... #endif
    #define MKSTR(x) #x                                 //#运算符把x转换为引号包含的字符串
    #define CONCAT(x, y) x##y                           //##运算符链接两个字符串
    cout << __LINE__ << endl;                           //预定义宏__LINE__/__FILE__/__DATE__/__TIME__
    ```
  * [C++重要知识点小结---1](https://www.cnblogs.com/heyonggang/p/3246631.html)
  * [C++拷贝构造函数](https://www.cnblogs.com/heyonggang/p/3250080.html)
  * [常见C++面试题及基本知识点总结（一）](https://www.cnblogs.com/LUO77/p/5771237.html)

## 2. 设计模式
  * [图说设计模式](design-patterns.readthedocs.io/zh_CN/latest/index.html)
  * 软件模式是将模式的一般概念应用于软件开发领域,即软件开发的总体指导思路和参照样板,软件模式并非仅限于设计模式,还包括架构模式、分析模式、过程模式
  * 设计模式的6原则
    * 开闭原则(Open Close Principle):对扩展开放,对修改关闭
    * 里氏代换原则(Liskov Substitution Principle):任何基类出现的地方,子类一定可以出现
    * 依赖倒转原则(Dependency Inversion Principle):针对接口编程,依赖抽象而不是依赖具体
    * 接口隔离原则(Interface Segregation Principle):使用多个隔离的接口,比使用单个接口要好
    * 迪米特原则(Demeter Principle):一个实体应该尽量少地与其他实体发生作用,使得系统功能模块相对独立
    * 合成复用原则(Composite Reuse Principle):应该尽量使用合成聚合的方式,而不是继承
  * 在系统学习设计模式之后,需要达到3个层次
    * 能在白纸上画出所有的模式结构以及时序图
    * 能用代码实现
    * 灵活应用到实际项目中
  * UML类图以及时序图
    * 泛化关系(generalization),使用空心箭头的实线表示
    * 实现关系(realize),使用空心箭头的虚线表示
    * 聚合关系(aggregation),使用空心菱形的实线表示,整体与部分是弱依赖关系,整体不存在但部分依然在
    * 组合关系(composition),使用实心菱形的实线表示,整体与部分是强依赖关系,整体不存在则部分也不存在
    * 关联关系(association),用一条实线表示
    * 依赖关系(dependency),用一条虚线表示
    * 时序图
  * 创建型模式:对类的实例化过程进行抽象,能够将软件模式中对象的创建与对象的使用分离
    * 简单工厂模式(Simple Factory):又称为静态工厂函数,根据不同的参数返回不同的类的实例,客户只知道传入工厂类的参数,对如何创建对象不关心
    * 工厂方法模式(Factory Method):又称为工厂模式,工厂父类负责定义创建产品对象的公共接口,而工厂子类则负责生成具体的产品对象
    * 抽象工厂模式(Abstract Factory):面对多个产品等级结构,一个工厂等级结构可以负责多个不同产品等级结构中产品对象的创建,应用场景为软件系统更换界面主题
    * 创建者模式(Builder):将一个复杂对象的创建与它的表示分离,使得同样的构建过程可以创建不同的表示
    * 原型模式(Prototype)
    * 单例模式(Singleton):确保某一个类只有一个实例,而且自行实例化并向整个系统提供这个实例
      * 静态成员直接初始化
      * 延迟加载
      * 双重检查锁
      ```
      if (NULL == s_singleton){
        lock;
        if (NULL == s_singleton){
            s_singleton = new Singleton;
        }
      }
      ```
  * 结构型模式:描述如何将类或者对象结合在一起形成更大的结构,分为类结构模式和对象结构模式
    * 适配器模式(Adapter):将接口转换成客户希望的另一个接口,分为对象适配器和类适配器两种实现
    * 桥接模式(Bridge):将抽象部分与它的实现部分(Implementor)分离,例如提供不同的排序算法
    * 组合模式(Composite)
    * 装饰模式(Decorator):又称为包装类(Wrapper),动态地给一个对象增加一些额外的职责
    * 外观模式(Facade):外部与一个子系统的通信必须通过一个统一的外观对象进行,为子系统中的一组接口提供一个一致的界面
    * 享元模式(Flyweight):又称为轻量级模式,运用共享技术有效地支持大量细粒度对象的复用,使得相同对象或者相似对象在内存中只保存一份
    * 代理模式(Proxy):给某一个对象提供一个代理,并由代理对象控制对原对象的引用
      * 远程代理
      * 虚拟代理 
      * Copy-on-Write代理
      * 保护代理
      * 缓冲代理
      * 防火墙代理
      * 同步化代理
      * 智能代理
  * 行为型模式:对在不同对象之间划分责任和算法的抽象化
    * 责任链模式(Chain of Responsibility)
    * 命令模式(Command):又称为动作模式或事务模式,将一个请求封装为一个对象,从而使我们可用不同的请求对客户进行参数化
    * 解释器模式(Interpreter)
    * 迭代器模式(Iterator)
    * 中介者模式(Mediator):用一个中介对象来封装一系列对象的交互,是各对象不需要显式地相互引用
    * 备忘录模式(Memento)
    * 观察者模式(Observer):又称为发布订阅模式、模型视图模式,定义对象之间的一种一对多的依赖关系,使得每当一个对象状态发生改变时,其依赖对象皆得到通知
    * 状态模式(State):允许一个对象在其内部状态改变时改变它的行为
    * 策略模式(Strategy):定义一系列算法,将每一个算法封装起来,并让它们可以互相替换
    * 模板方法模式(Template Method)
    * 访问者模式(Visitor)

## 3. 网络编程以及网络模型
  * CGI,公共网关接口,是一套标准,定义了信息是如何在Web服务器和客户端脚本之间进行交换
  * 浏览一个特定的网页或者URL:
    * 浏览器连接HTTP Web服务器,并请求URL,即文件名
    * Web服务器解析URL,查找文件名,如果找到请求的文件,Web服务器吧文件发送回浏览器,否则报错
    * 浏览器从Web服务器获取相应,病根据收到的响应来显示文件或错误消息
  * 默认情况下,Apache Web服务器会配置在/var/www/cgi-bin中运行CGI程序
  * CGI库Cgicc
    * GET方法是默认的从浏览器向Web服务器传信息的方法,它会在浏览器的地址栏中生成一串很长的字符串,当有敏感信息时,不要使用GET方法
    * POST方法与GET不同,它以单独的消息形式进行传递
  * Cookie
    * 很多情况下,使用cookies是记忆和跟踪用户喜好、购买、佣金以及其他为追求更好的游客体验或网站统计所需信息的最有效的方法
    * 服务器已cookie的形式向访客浏览器发送一些数据,如果浏览器接受了cookie,则cookie会以纯文本记录的形式存储在访客都得硬盘上
    * cookie是一种纯文本的数据记录,带有5个可变长度的字段
  * OSI七层模型
    * 应用层:对应应用程序的通信服务,TELNET/HTTP/FTP/NFS/SMTP
    * 表示层:定义数据格式以及加密,加密协议/ASCII
    * 会话层:定义如何开始、控制、结束一个会话,RPC/SQL
    * 传输层:包括是否选择差错恢复协议还是无差错协议,TCP/UDP/SPX
    * 网络层:对端到端的包传输进行定义,它定义了能够标识所有结点的逻辑地址,IP/IPX
    * 数据链路层:定义了在单个链路上如何传播数据,ATM/FDDI
    * 物理层:定义了传输介质特性,Rj45/802.3
  * TCP/IP五层模型
    * 应用层
    * 传输层
    * 网络层
    * 数据链路层
    * 物理层
  * TCP(传输控制协议,Transmission Control Protocol):提供可靠的端到端字节流而专门设计的传输协议
    * 字段格式(Source Port, Destination Port, Sequence Number, Acknowledgment Number, Data offset, URG|ACK|PSH|RST|SYN|FIN, Window, Checksum, Urgent Pointers)
    * 三次握手建立连接(SYN(SEQ=x) =>, SYN(SEQ=y) ACK(ACK=x+1) =>, ACK(ACK=y+1) =>)
    * 四次握手终止连接(主动关闭 FIN =>, ACK =>, 被动关闭 FIN =>, ACK =>)
    * 延迟确认功能、丢弃重复数据、流量控制、重传机制、窗口确认
  * UDP(用户数据报文协议,User Datagram Protocol):提供一种无需建立连接就可以发送封装数据包的方法
    * 字段格式(Source Port, Destination Port, Length, Checksum)
  * C++网络编程
    * 套接字:源IP地址、目的IP地址、源端口号、目的端口号
    * 套接字类型:流套接字(SOCK\_STREAM, TCP),数据报文套接字(SOCK\_DGRAM, UDP),原始套接字(SOCK\_RAW, IP)
    * 函数
    ```
    /**
     * @brief 创建套接字
     * @param int family, AF_INET/PF_PACKET
     * @param int type, SOCK_STREAM/SOCK_DGRAM/SOCK_RAW
     * @param int protocol, 一般是0,对于原始套接字来说是具体的协议
     */
    int socket(int family, int type, int protocol);
    /**
     * @brief 应用于服务器一端,绑定参数
     */
    int bind(int sockfd, const struct sockaddr *myaddr, socklen_t addrlen);
    /**
     * @brief 监听函数,等待队列的长度由listen中的backlog参数决定,服务器端特有函数
     */
    int listen(int sockfd, int backlog);
    /**
     * @brief 请求接收函数,是取了一个已经处于connected状态的连接,然后把对方的协议族、网络地址以及端口都存在了client_addr中,服务器端特有函数
     */
    int accept(int sockfd, struct sockaddr *client_addr, socklen_t *len);
    /**
     * @brief 客户端请求连接函数,client端函数
     */
    int connect(int sockfd, struct sockaddr *serv_addr, int addrlen);
    ```

## 4. 数据库原理
  * [参考](https://blog.csdn.net/u014712482/article/details/82356322)
  * 存储过程:常用的关系型数据库MySQL,使用SQL语句,SQL在执行的时候需要编译、执行,而存储过程是一组为了完成某种特定功能的SQL语句集,是一个可编程的函数
  * 索引:帮助MySQL高效获取数据的数据结构,B-Tree/Hash/R-Tree/Full
  * 事务:并发控制的基本单位,是一个操作序列,要么都执行,要么都不执行,ACID特性(原子性、一致性、隔离性、持久性)
  * 视图
  * 超键 候选键 主键 外键
  * 三范式
  * E-R图:实体-联系图
  * 乐观锁与悲观锁
  * 左右连接 全连接 内连接

## 5. 数据结构与算法
  * TODO

## 6. STL/BOOST库
  * [C++ STL模板库](http://c.biancheng.net/cplus/80/)包含一些常用的数据结构和算法
  * C++容器,被放入容器的对象所属的类最好重载==和<运算符,以使得两个对象用==和<进行比较是有定义的
    * 顺序容器:vector, deque, list
    * 关联容器:set, multiset, map, multimap
    * 容器适配器:stack, queue, priority\_queue
  * C++迭代器
    * 迭代器iterator
    * 常量迭代器const\_iterator
    * 反向迭代器reverse\_iterator
    * 常量反向迭代器const\_reverse\_iterator
    * 正向迭代器(++)
    * 双向迭代器(++, --)
    * 随机访问迭代器(+=, -=, +, -, ++, --)
    ```
    advance(p, n);                      //是迭代器向前或向后移动n个元素
    distance(p, q);                     //计算两个迭代之间的距离
    iter_swap(p, q);                    //交换两个迭代之间的值
    ```
  * STL中,x和y相等也往往不等价于x==y为真,在未排序的区间上查找时,比较两个元素相等使用==运算符,在排序的区间上查找时,比较两个元素相等意味着x\<y与y\<x都为假
  * 函数对象,函数对象模板
  * string
  ```
  string s1;
  s1.length();
  s1.append("ABCDE", 2, 3);
  s1.swap(s2);
  s1.find();
  s1.replace();
  s1.erase();
  s1.insert();
  ```
  * BOOST库是一个优秀的、可移植的开源C++库,设计理念和STL比较接近,都是利用泛型让复用达到最大化,其中有些内容成为下一代C++标准库内容,是不择不扣的准标准库
    * 文本处理,conversion/lexical\_cast类
    * 正则表达式,regex
    * LL分析的框架,spirit
    * tokenizer库,分割字符串
    * 关于图的容器和相关算法,graph
    * 并发编程,thread
    * 单元测试框架,test
    * 编译器的assert功能,static\_assert
    * 内存池,pool
    * 智能指针,smart\_ptr
    * 定时器,timer

## 7. C++模板
  * TODO

## 8. 多线程
  * Linux中POSIX多线程接口
  ```
  #include <pthread>
  int pthread_create(thread, attr, start_routine, arg);                     //创建线程
  int pthread_exit(status);                                                 //终止线程
  int pthread_join(pthread_id, status);                                     //子程序阻碍调用程序,知道制定的threadid线程终止为止,只有创建时定义为可连接的线程才可以被连接

  pthread_attr_t attr;
  pthread_attr_init(&attr);
  pthread_attr_setdetachstate(&attr, PTHREAD_CREATE_JOINABLE);              //初始化并设置线程为可连接
  pthread_attr_destory(&attr);

  g++ test.cpp -lpthread -o test.o                                          //编译选项
  ```
  * TODO

## 9. C++11新特性
  * TODO

## 10. Linux平台开发工具以及命令shell
  * TODO

## 11. C#基础语法
  * TODO

## 12. Python基础语法
  * [参考](https://www.liaoxuefeng.com/wiki/1016959663602400)
  * Python解释器:CPython(官方解释器), IPython(交互式解释器), PyPy(JIT技术,执行速度), Jython(Java平台上的Python解释器), IronPython(.Net平台上的Python解释器)
  * Python基础
    * 数据类型和变量
    * 字符串和编码
    * 使用list和tuple
    * 条件判断
    * 循环
    * 使用dict和set
  * IO编程
    * 同步IO、异步IO
    * 文件读写,with语句
    * StringIO, BytesIO
    * 操作文件和目录
    * 序列化(pickling, unpickling, JSON)
  * 函数
    * 位置参数、默认参数、可变参数、关键字参数、命名关键字参数
  * 高级特性
    * 切片
    * 迭代
    * 列表生成式([x * x for x in range(1, 11)])
    * 生成器(g = (x * x for x in range(10)), next(g))
    * yield: 函数时顺序执行,遇到return语句或者最后一行就返回,而变成generator的函数,每次调用next()时执行,遇到yield语句返回,再次执行时从上次yield语句继续处理
  * 函数式编程
    * map(f, [1, 2, 3])
    * reduce(f, [x1, x2, x3]) = f(f(x1, x2), x3)
    * filter(f, [x1, x2, x3])
    * sorted([x1, x2, x3])
    * lambda表达式
    * 偏函数(functools.partial(int, base=2))
  * 模块
    * import sys
    * 作用域
    * 安装第三方模块(pip install Pillow)
  * 面向对象编程
    * 类和实例
    ```
    class Student:
      count = 0                     #类属性

      def __init__(self, name, score):
        self.name = name
        self.score = score
        count += 1


      def print_score(self):
        print('%s: %s' % (self.name, self.score))
    ```
    * 访问限制(两个下划线)
    * 继承和多态
    ```
    class Dog(Animal):
      pass

    type(Dog)                       #类型信息
    isinstance(Dog, Animal)         #继承关系
    dir(Dog)                        #获取属性以及方法的列表
    hasattr(Student, name)          #测试是否包含某个属性
    ```
  * 面向对象高级编程
    * 使用\_\_slots\_\_ (限制实例的属性)
    * 使用@property
    * 多重继承、定制类、枚举类
    ```
    __str__, __repr__               #print(dog)
    __iter__
    __getitem__
    __getattr__
    __call__                        #可调用对象
    Month = Enum('Month', ('Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'))
    ```
    * 使用元类
    ```
    Hello = type('Hello', (object,), dict(hello=fn))        #创建Hello Class

    class ListMetaclass(type):
      def __new__():
        attrs['addr'] = lambda self, value: self.append(value)
        return type.__new__(cls, name, bases, attrs)

    class MyList(list, metaclass = ListMetaclass):
      pass
    ```
  * 错误、调试、测试
    * 错误处理
    * 调试
    ```
    try ... except ... finally

    assert n != 0, 'n is zero'

    logging('n = %d', % n)
    
    python -m pdb err.py
    pdb.set_trace()                 # 设置一个端点
    ```
    * 单元测试
    ```
    import unittest

    from mydict import Dict

    class TestDict(unittest.TestCase):
      pass
      
    if '__main__' == __name__:
      unittest.main()
    ```
    * 文档测试(doctest)
  * 进程和线程
    * 在单核CPU情况下,操作系统轮流让各个人物交替执行,由于CPU执行速度很快,我们感觉所有任务都在同时执行
    * 多进程:fork系统调用,子进程返回0,父进程则返回子进程ID
      * multiprocessing, Pool, subprocess, 进程间通信(Queue, Pipes)
    * 多线程:\_thread, threading模块
      * 多线程与多进程的最大区别在于,多进程中,同一个变量,各自有一份拷贝存在于每个进程中,互不影响,而在多线程中,所有变量都由所有线程共享
      * Python的线程虽然是真正的线程,但是解释器执行时,有一个GIL锁(Global Interpreter Lock),任何python线程执行前,必须先获得GIL锁,这个锁其实把所有线程的执行代码都给上了锁
    * ThreadLocal
    * 计算密集型 vs. IO密集型
    * 分布式进程
  * 正则表达式
    * re模块
    ```
    import re
    re.match(r'^\d{3}\-\d{3, 8}$', '010-12345')

    'a b  c'.split(' ')                         #正常切分代码
    re.split(r'\s+', 'a b  c')                  #re模块的split

    m = re.match(r'^(\d{3})-(\d{3, 8})$', '010-12345')
    m.group(0)                                  #匹配本身
    m.group(1)                                  #分组1

    re_teleport = re.compile(r'^(\d{3})-(\d{3, 8})$')
    re_teleport.match('010-12345').groups()     #编译正则
    ```
    * 贪婪匹配
  * 常用的内建模块(datetime/collections/base64/struct/hashlib/hmac/itertools/contextlib/urllib/xml/HTMLParser)
  * 常用第三方模块(Pillow/requests/chardet/psutil)
  * virtualenv(virtualenv是一个用来为一个应用创建一套隔离的Python运行环境)
  * 图形界面(Tkinter, wxWidgets, QT, GTK, Turtle Graphics)
  * 网络编程
  ```
  import socket
  s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
  s.connect(('www.sina.com.cn', 80))
  ```
  * 电子邮件
  * 访问数据库
  * Web开发 
  * 异步IO
  * 使用MicroPythonA:python的精简版本,是为了运行在单片机这样的性能有限的微控制器上,最有体积为256K,运行时需16K内存

## 13. 编译原理
  * [参考](https://www.jianshu.com/p/eb63d31ad638)
  * 汇编指令,汇编语言 
  * 转换,编译,汇编
  * 交叉汇编:将一个汇编语言程序汇编成可在另一台机器上运行的机器指令
  * 反汇编:将机器语言翻译成汇编语言
  * 反编译:将汇编语言翻译成高级语言
  * 编译器与解释器:运行目标程序时的控制权在解释器而不在目标程序,编译器采用先翻译后执行,解释器采用边翻译边执行
  * 编译器的工作原理与基本组成
    * 词法分析:输入是源程序,输出是识别的记号流,目标是识别单词
    * 语法分析:输入是词法分析的记号流,输出是语法树,目的是得到语言结构并以树的形式表示
    * 语义分析:根据语义规则对语法树中的语法单元进行静态语义检查,目的在于保证语法正确的结构在语义分析上也是合法的
    * 中间代码生成(可选):生成一种既接近目标语言,又与目标机器无关的表示,便于优化代码以及代码生成
    * 中间代码优化(可选):局部优化、循环优化、全局优化
    * 目标代码生成:不同形式的目标代码、汇编语言形式、可重定位二进制代码形式、内存形式
    * 符号表管理:合理组织符号,便于各阶段查找、填写
  * 逻辑上把编译器分为:
    * 分析(前端):语言结构和意义的分析,从词法分析到中间代码生成各阶段的工作
    * 综合(后端):语言意义处理,从中间代码生成到目标代码生成的各阶段的工作
    * 编译器和解释器的区别往往是在形成中间代码之后开始的
  * 词法分析
    * 正规式、正规集
    * 有限自动机(NFA - Nondeterministric Finit Automaton)
    * 从正规式到词法分析器
  * 语法分析
    * 语法规则:上下文无关文法(LL文法/LR文法)
    * 语法分析:下推自动机、自上而下分析、自下而上分析
  * 静态语义分析

## 14. 杂项
  * 智能指针实现
  * 内存池原理
  * 信号处理
  ```
  signal(registered signal, signal handler);            //signal函数原型
  int raise(signal sig);                                //生成信号
  ```
