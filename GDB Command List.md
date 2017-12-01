## GDB Command List
  * gdb debug_out: 开始调试
  * gdb -p PID: 基于PID进行调试
  * b LINENUM: 在某一行设置断点
  * b CLASS::METHOD: 在类的某成员函数设置断点
  * info b: 列出所有断点信息
  * delete \[LINENUM\]: 删除某一行的断点或者全部断点
  * n: next，下一条指令
  * s: step into，进入函数
  * l: list，列出当前断点位置的代码段
  * c: continue, 继续进行
  * r: run, 运行程序
