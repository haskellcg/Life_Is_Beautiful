# Pro Git

## 1. 起步
  本地版本控制系统(RCS)
  
  集中化的版本控制系统(CVCS)(CVS, Subversion, Perforce)
  
  分布式版本控制(DVCS)
  
  Linux开源社区基于使用Bitkeeper时的检验教训，开发出自己的版本系统，他们对新的系统制订了若干目标:
  * 速度
  * 简单的设计
  * 对非线性开发模式的强力支持(允许成千上万个并行开发的分支)
  * 完全分布式
  * 有能力高效管理类似Linux内核一样的超大规模项目(速度和数据量)
  
  直接记录快照，而非差异比较
  
  近乎所有操作都是本地执行
  
  Git保证完整性，Git中所有数据在存储前都计算校验和，然后以校验和来引用。这意味着不可能在Git不知情时更改任何文件内容或目录内容。**_这个功能构建在Git底层，是构成Git哲学不可或缺的部分_**。Git用以计算校验和的机制叫做SHA-1散列。
  
  Git一般只添加数据
  
  三种状态:
  * Committed (已提交)，表示数据已经安全存放在本地数据库中
  * Modified (已修改)，表示已经修改了文件，但是还没保存到数据库中
  * Staged (已暂存)，表示对一个已经修改的文件的当前版本做了标记，使之包含在下次提交的快照中
  
  Git仓库目录是Git用来保存项目的元数据和对象数据库的地方，这是Git中最重要的部分，从其他计算机克隆仓库时，拷贝的就是这里的数据
  
  工作目录是对项目的某个版本独立提取出來的内容，放在磁盘上供你使用或修改
  
  暂存区域是一个文件，保存了下次将提交的文件列表信息，一般在Git仓库目录中，有时候也被称为"索引"
  
### 安装之后的配置
  Git自带一个git config的工具来帮助设置控制Git外观和行为的配置变量，这些变量存储在三个不同的位置：
  1. /etc/gitconfig文件: 包含系统上每一个用户以及他们仓库的通用配置。如果使用带有--system选项的git config时，它就会从此文件读写配置变量
  1. \~/.gitconfig或\~/.config/git/config文件: 只针对当前用户。可以传递--global选项让Git读取此文件
  1. 当前使用仓库的Git目录的config文件(就是.git/config): 针对该仓库
  
  ```
  用户信息
  git config --global user.name "John Doe"
  git config --global user.email johndoe@example.com
  
  文本编辑器
  git config --global core.editor emacs
  
  检查配置信息
  git config --list
  
  查询配置
  git config user.name
  
  获取帮助
  git help <verb>
  git <verb> --help
  man git-<verb>
  ```
  
  检查配置信息中重复信息，因为Git会从不同的文件中读取同一个配置，这种情况下，Git会使用它找到的每一个额变量的最后一个配置
  
## 2. Git基础  
  从现有目录中初始化仓库:
  ```
  git init
  
  git add *.c
  git add LICENSE
  git commit -m "initial project version"
  ```
  
  克隆现有的仓库: 请留心使用的命令"clone"而不是"checkout"
  ```
  git clone https://github.com/libgit2/libgit2
  
  自定义本地仓库的名字
  git clone https://github.com/libgit2/libgit2 mylibgit
  
  使用Git协议
  git clone user@server:path/to/repo.git
  ```
  
  检查当前文件状态
  ```
  git status
  
  状态简览
  git status -s
  git status --short
  ```
  
  状态简览中：
  
  标记|含义
  ---|----
  \?\?|新添加的未跟踪文件
  A|新添加到暂存区的文件
  M[Left]|修改过的文件并放入了缓存区
  M[Right]|修改过的文件且未放入缓存区    
  
  跟踪新文件
  ```
  git add README
  ```
    
  忽略文件: 我们可以创建名为.gitignore的文件，列出需要忽略的文件模式
  ```
  cat .gitignore
  *.[oa]
  *~
  ```
  
  文件.gitignore的格式规范如下：
  * 所有空行或者以#开头的行都会被Git忽略
  * 可以使用标准的glob模式[简化了的正则表达式]
  * 匹配模式可以以(/)开头防止递归
  * 匹配模式可以以(/)结尾指定目录
  * 要忽略指定模式以外的文件或目录，可以在模式前加上惊叹号(!)取反
  
  记号|含义
  ----|---
  \*.a|no .a files
  !lib.a|but do track lib.a
  /TODO|only ignore the TODO file in current directory
  build/|ignore all files in the build/ directory
  doc/\*.txt|ignore doc/notes.txt, but no doc/server/arch.txt
  doc/\*\*/\*.pdf|ignore all .pdf files in doc/ directory
  
  查看已暂存或未暂存的修改
  ```
  查看已修改还没暂存起来的内容,默认行为
  git diff
  
  查看已暂存的将要添加到下次提交里的内容
  git diff --staged
  git diff --cached
  
  设置图形界面
  git difftool
  ```
  
  提交更新
  ```
  git commit
  git commit -m msg
  ```
  
  跳过使用暂存区
  ```
  git commit -a
  git commit -a -m
  ```
  
  移除文件
  ```
  从跟踪文件清单中移除，并连带从工作目录中删除指定文件
  git rm
  
  如果删除之前修改过且放到暂存区
  git rm -f
  
  文件保留，但并不想Git跟踪
  git rm --cached README
  git rm log/\\*.log
  git rm \\*~
  ```
  
  移动文件
  ```
  git mv file_from file_to
  
  =>
  mv file_from file_to
  git rm file_from
  git add file_to
  ```
  
### 查看提交历史  
  ```
  git clone https://github.com/schacon/simplegit-progit
  
  git log  
  列出 每个提交的SHA-1校验和、作者的名字、电子邮件地址、提交时间、提交说明
  
  git log -p -2 --stat
  显示每次提交的内容差异，并只显示最近两次的提交，并显示统计信息
  
  git log --pretty=[oneline|short|full|fuller]
  使用不同默认的格式展示提交历史
  
  git log --pretty=format:"%h - %an, %ar : %s"
  ```
  
  git log常用选项
  
  选项|含义
  ---|---
  \-p|按补丁格式显示每个更新之间的差异
  \-\-stat|显示每次更新的文件修改统计信息
  \-\-shortstat|只显示\-\-stat中最后一行的行数修改添加移除统计
  \-\-name\-only|仅在提交信息后显示已修改的文件清单
  \-\-name\-status|显示新增、修改、删除的文件清单
  \-\-abbrev\-commit|仅显示SHA1的前几个字符，而非所有的40个字符
  \-\-relative\-date|使用较短的相对时间显示
  \-\-graph|显示ASCII图形表示的分至合并历史
  \-\-pretty|使用其它格式显示历史提交信息
  
  format选项|含义
  ----------|---
  %H|提交对象的完整哈希字串
  %h|提交对象的简短哈希字串
  %T|树对象的完整哈希字串
  %t|树对象的简短哈希字串
  %P|父对象的完整哈希字串
  %p|父对象的简短哈希字串
  %an|作者的名字
  %ae|作者的电子邮件
  %ad|作者修订日期
  %ar|作者修订日期，按多久以前的方式显示
  %cn|提交者的名字
  %ce|提交者的电子邮件
  %cd|提交日期
  %cr|提交日期，按多久以前的方式显示
  %s|提交说明
  
  限制输出长度:
  ```
  git until
  git log --since=2.weeks
  
  git log --author
  git log --grep
  git log --author --grep --all-match
  git log --author --grep
  
  列出那些添加或移除了某些字符串的提交
  git log -S
  
  指定路径
  git log ./python_project
  ```
  
  选项|含义
  ----|----
  \-(n)|仅显示最近的n条提交
  \-\-since, \-\-after|仅显示指定时间之后的提交
  \-\-until, \-\-before|仅显示指定时间之前的提交
  \-\-author|仅显示指定作者相关的提交
  \-\-committer|仅显示指定提交者相关的提交
  \-\-grep|仅显示含指定关键字的提交
  \-S|仅显示添加或移除了某个关键字的提交
  

## 3. Git Branch
  Nearly every VCS has some form of branching support. Branching means you diverge from the main line of development and continue to do work without messing with that main line. **_In many VCS tools, this is a somewhat expensive process, often requiring you to create a new copy of your source code directory, which can take a long time for large project_**.
  
  The way Git braches is incredibly lightweight, making branching operations nearly instantaneous, and swiching back and forth between branches generally just as fast.
  
### Branches in a Nutshell  
  As you may remember from Getting Started, Git doesn't store data as a series of changesets or differences, but instead as a series of snapshots.
  
  When you make a commit, Git stores a commit object that contains a pointer to the snapshot of the content you staged. This object also contains the author's name and email, the message that you typed, and the pointers to the commit or commits that directly came before this commit (its parent or parents): zero parents for the initial commit, one parent for a normal commit, and multiple parents for a commit that results from a merge of two or branches.
  
## 10. Git内部原理
  从根本上来说，Git是一个内容寻址(content-addressable)文件系统。
  
  当在一个新目录或已有目录执行git init时，Git会创建一个.git目录，这个目录包含了几乎所有Git存储和操作的对象。如若想备份或复制一个版本库，只需要这个目录拷贝到另一处即可。
  
  ```
  $ ls -F1
  HEAD
  config*
  description
  hooks/
  info/
  objects/
  refs/
  ```
  
  description文件仅供GitWeb程序使用
  
  config文件包含项目特有的配置选项
  
  info目录包含一个全局排除文件，用以放置那些不希望被记录在.gitignore文件中的忽略模式
  
  hooks目录包含客户端、服务器的钩子脚本
  
  objects目录存储所有数据内容
  
  refs目录存储指向数据(分支)的提交对象的指针
  
  HEAD文件指示目前被检出的分支
  
  index文件保存暂存区信息
  
### Git对象  
  
  
  
  
  
  
  
  
  
  
  
  
  

## My Reference
  * [Pro Git](https://git-scm.com/book/en/v2)
  * [Git Branch](https://git-scm.com/book/en/v2/Git-Branching-Branches-in-a-Nutshell)
  * [Git Vs BitKeeper](http://www.path8.net/tn/archives/6039)
  * [GitIgnore Project](https://github.com/github/gitignore)
