## GDB Command List
  * gdb debug_out: 开始调试
  * gdb -p PID: 基于PID进行调试
  * b LINENUM: 在某一行设置断点
  * b CLASS::METHOD: 在类的某成员函数设置断点
  * b File:Num: 在某文件的某一行设置断点
  * info b: 列出所有断点信息
  * delete \[LINENUM\]: 删除某一行的断点或者全部断点
  * n: next，下一条指令
  * s: step into，进入函数
  * l: list，列出当前断点位置的代码段
  * c: continue, 继续进行
  * r: run, 运行程序
  * disa b: 使断点失效，但是不删除
  * thread: 获取当前调试线程的TID
  * thread TID: 多线程调试，保持在TID的线程，不跳到其他线程
  * bt: breaktrace, 打印调用堆栈信息
  * info locals: 打印当前函数的局部变量以及其值
  * info args: 打印当前函数的参数名以及其值
  * info catch: 打印当前函数的异常处理信息
  * set print pretty on: 设置比较友好的打印格式
  * x:查看内存信息
  ```
  x/nfu <address>
  支持参数/n/f/u,例如:
  n:表示需要显示的以u为单位的内存的数量
  f:表示显示的格式，例如二进制(t)、十进制(d)、八进制(o)、十六进制(x,u)、字符格式(c)、浮点格式(f)
  u:表示显示的单位，例如字节(b)、双字节(h)、四字节(w)、八字节(g)
  
  内存信息:
  0000: 00 00 02 01 01 03 00 00   02 01 01 02 08 00 45 00
  
  命令:x/16tb 0000
  表示显示地址0000出之后16个字节的信息，以二进制方式显示，以字节为块
  0000: 00000000 00000000 00000010 00000001 00000001 00000011 00000000 00000000
  0008: 00000010 00000001 00000001 00000010 00001000 00000000 01000101 00000000
  
  命令:x/16xb 0000
  表示显示地址0000出之后16个字节的信息，以十六进制方式显示，以字节为块
  0000: 0x00 0x00 0x02 0x01 0x01 0x03 0x00 0x00
  0008: 0x02 0x01 0x01 0x02 0x08 0x00 0x45 0x00
  ```
