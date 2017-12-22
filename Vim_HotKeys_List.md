# Vim
## 自定义配置
  Vim自定义配置通过一下命令实现:
  ```
  vim ~/.vimrc
  ```
  
  以下是我现在使用的配置，发现好的配置再增加:
  ```
  set nu
  set tabstop=4
  set extendtab
  set ai
  syntax on
  ```
## 自动补全
  之前出现过的单词可以通过自动补全:
  ```
  Ctrl + N
  Ctrl + P
  ```
  
  其他不常使用的快捷键:
  ```
  Ctrl + X => L               整行补全
  Ctrl + X => N               根据当前文件的关键字补全
  Ctrl + X => K               根据字典补全
  Ctrl + X => T               根据同义词字典补全
  Ctrl + X => I               根据头文件内关键字补全
  Ctrl + X => ]               根据标签补全
  Ctrl + X => F               根据文件名补全
  Ctrl + X => D               根据宏补全
  Ctrl + X => V               补全vim命令
  Ctrl + X => U               用户自定义补全
  Ctrl + X => S               拼写建议
  ```
 
## 移动
  HotKey|Description
  ------|-----------
  x|删除后面的字符
  X|删除前面的字符
  3x|删除后面的3个字符
  dd|删除一行
  D|删除到行尾
  caw|改写单词
  J|删除换行符，将下一行并上来
  3J|连接后面3行
  u|撤销上一次操作
  U|撤销当前行做的所有修改
  Ctrl + r|对撤销的撤销
  
