
# Vim
## 自定义配置
  Vim自定义配置通过一下命令实现:
  ```
  vim ~/.vimrc
  ```
  
  以下是我现在使用的配置，发现好的配置再增加:
  ```
  " 若需要取消设置，前面加no，例如
  set noexpandtab
  
  " 自动行号显示
  set nu
  " tab代表的空格数目
  set tabstop=4
  " 将tab自动扩展为空格，数目参考tabstop 
  set expandtab
  " 程序中自动缩进的空格数目
  set shiftwidth=4
  " 自动缩进
  set ai
  " 高亮显示匹配结果
  set hlsearch
  " 开启语法高亮显示
  syntax on
  ```
  
  * [tabstop/expandtab/shiftwidh/softtabstop 比较详细的解释](https://blog.csdn.net/ludonghai715/article/details/5657712)
  
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
  
## 大小写转换
  ```
  #从文件开始到文件结尾的部分都转小写
  ggguG
  
  #从文件开始到文件结尾的部分都转大写
  gggUG
  
  #单词转小写
  guw/gue/gu5w/gu5e
  
  #从光标为止到文件结尾的部分都转大写
  gUG
  
  #从光标到行尾的部分转小写
  gu$
  ```
 
## 基础
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
  i|在光标前插入
  I|在行首插入
  a|在光标后插入
  A|在行尾插入
  o|在下面另起一行，并变为插入模式
  O|在上面另起一行，并变为插入模式
  Ctrl + o|临时变为命令模式(一次而已)
  Ctrl + z|将当前vim停止放入后台，输入fg恢复
  :e!|放弃更改，然后相当于重新打开
  :help|帮助，使用ZZ退出帮助窗口
  yy|复制一行
  3yy|复制光标后面的3行
  y3w|复制3个单词
  y3j|复制下面3行
  y3k|复制上面3行
  :ab hw hello world|用一个缩写字符串代替一个长的字符串，这里用hw代替hello world
  
## 移动
  HotKey|Description
  ------|-----------
  b|向前移动一个单词
  3b|向前移动3个单词
  w|向后移动一个单词
  3w|向后移动3个单词
  ^/0|移动到行首
  $|移动到行尾
  3$|移动到3行后的行尾
  +|移动到下一行的行首
  -|移动到上一行的行首
  f|向后搜索命令
  %|跳到对应的括号上
  30%|移动到文件的30%处
  33G|移动到33行
  gg|移动到文件头
  G|移动到文件尾
  H|Home
  M|Middle
  L|Last
  Ctrl + G|当前位置,显示总行数以及当前进度
  Ctrl + u/d|向上/下滚动半屏
  Ctrl + e/y|向上/下滚动一行
  Ctrl + b/f|向上/下滚动一屏
  zz|将当前行滚动到屏幕中间
  zt|将当前行滚动到屏幕顶部
  zb|将当前行滚动到屏幕底部
  /string|查找string，回车后，按n跳到下一个，N跳到上一个
  :set ignorecase|大小写无关
  :set hlsearch|高亮查找结果
  \`\`|上一次光标停靠的行
  \>\>|向右移动本行一段距离
  \<\<|向左移动本行一段距离
  3\<\<|向左移动下面3行一段距离
  20,30\<\<|向左移动第20到30行的内容一段距离
  
## 修改
  HotKey|Description
  ------|-----------
  %s/str1/str2/g|替换每一行的str1为str2
  10,30s/str1/str2/g|替换第10到30行的str1为str2
  10,$s/str1/str2/g|替换第10到最后一行的str1为str2
  s/str1/str2/g|替换当前行的str1为str2
  .|重复执行命令
  10,$ w test2.cpp|将第10行到最后一行的内容保存到test2.cpp
  r class/User.cpp|读取文件中的内容，将内容插入到当前行的后面
  dw|删除一个单词
  d4w|删除4个单词
  d$|删除到行尾
  d^|删除到行首
  d3j|向下删除3行
  d3k|向上删除3行
  D|相当于d$
  C|相当于c$
  s|相当于c1
  S|相当于cc
  r|替换当前字符，不会进入insert模式
  R|替换模式
  3r|把后面3个字符替换
  p|粘贴到光标后
  P|粘贴到光标前
  3p|粘贴3次
  ~|更改字母的大小写，同时光标移动到下一个字符
  3~|更改后面3个字母的大小写
  e|移动到单词结尾
  E|移动到单词结尾(忽略标点符号)
  Ctrl + s|暂停终端(Ctrl + q)
  
## ctags
  暂时无法添加
  
## My References
  * [vim 常用快捷键](https://www.cnblogs.com/tianyajuanke/archive/2012/04/25/2470002.html)
  * [vim visual mode](https://dev.to/iggredible/mastering-visual-mode-in-vim-15pl)
  * [FZF vim](https://dev.to/iggredible/how-to-search-faster-in-vim-with-fzf-vim-36ko)
  * [vim insert mode](https://dev.to/iggredible/the-only-vim-insert-mode-cheatsheet-you-ever-needed-nk9)
