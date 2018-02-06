## Git Bash设置为Glass还挺好看的
  ![是这样的](https://github.com/haskellcg/Blog_Pictures/blob/master/git_bash_glass.PNG)

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
  
## Pip安装时使用代理
  * Pip install --proxy http://username:password@proxyIP:proxyPort
  
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
    
## VPN在Win7_x64初次连接失败，错误代码789
  这个问题目前不清楚为什么，按照下面的操作即可:
  * 打开注册表
  * 进入目录 HKEY_LOCAL_MACHINE\\System\\CurrentControlSet\\Services\Rasman\Parameters
  * 新建项:(DWORD)ProhibitIpSec，值设为1
  * 重启电脑即可
  
## 编辑器设置空格代替tab
  注意编写makefile时，必须使用tab缩进

  编辑器|设置
  -----|----
  Notepad++|设置 => 首选项 => 制表符设置 => 转换为空格
  PyCharm|File => Settings => Editor => Code Style => Python
  Sublime Text 3|Preferences => Settings - User => "tab_size" => "translate_tabs_to_spaces"
  Vim|[参考个人vimrc设置](https://github.com/haskellcg/Life_Is_Beautiful/blob/master/Vim_HotKeys_List.md)
  Visual Studio|工具 => 选项 => 文本编辑器 => C# => 制表符
  
## Set Widnows' CMD Title
  ```
  title My_Title
  ```
  
## Addr2Line
  * [addr2line](http://blog.csdn.net/lhf_tiger/article/details/9088609)
  
## Failed to run the WC DB work queue associated with
  * [solution](https://stackoverflow.com/questions/22362823/failed-to-run-the-wc-db-work-queue-associated-with-file)
  
## Source Insight配置
  * 添加目录，并解析所有下面的文件：配置中选择"Add Tree"
  * 修改字体:Option => Document Options... => Screen Fonts
  
## 如何输出"□■"
  * QQ拼音输入"fk"
