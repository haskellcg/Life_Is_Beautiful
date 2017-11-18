## pycharm 如何设置查找文件的库路径起始点？
  情况是这样的，打开python项目，发现import的库并不是相对于现在打开的跟目录，而是其他目录，设置方式:
  * File -> Setting -> Project:xxx -> Project Struct -> Add Content Root

## 如何安装python的whl格式的库文件？
  * 需要记住的是安装完python之后，需要添加两个路径到path环境变量
  * 开始 -> 右键"计算机" -> 属性 -> 高级系统设置 -> "高级"标签 -> 环境变量
  * 添加环境变量 PYTHON_HOME: 你的pyhon的安装路径(即python.exe的父目录)
  * 修改path环境变量，添加: %PYTHON_HOME%;%PYTHON_HOME%\Scripts
  * 重新打开cmd即可使用pip
  * pip install xxx.whl
  
## 取消VS的自动排版  
  每人都有自己的编码风格，VS的自动排版如果不合适，通过以下方法取消：
  * Tools -> Options -> Text Editor -> Formatting
  
## warning LNK4099: PDB 'vc90.pdb' was not found
  这是我在编写opengl测试项目时遇到的，应该是引入的默认的gltools是debug，解决方法:
  * 选择目录VisualStudio2008\GLTools，打开对应项目
  * 修改include目录，添加"..\..\Src\GLTools\include"
  
## warning LNK4098: defaultlib 'LIBCMT' conflicts with use of other libs; use /NODEFAULTLIB:library
  这是我在编写OpenGL测试项目时遇到的，主要是现在编译选项与库的编译选项不一致，解决方法就是使用库的编译选项:
  * c/c++ -> Code Generation -> Runtime library -> 修改/MD为/MT
