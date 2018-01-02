# Pro Git

## Git Branch
  Nearly every VCS has some form of branching support. Branching means you diverge from the main line of development and continue to do work without messing with that main line. **_In many VCS tools, this is a somewhat expensive process, often requiring you to create a new copy of your source code directory, which can take a long time for large project_**.
  
  The way Git braches is incredibly lightweight, making branching operations nearly instantaneous, and swiching back and forth between branches generally just as fast.
  
### Branches in a Nutshell  
  As you may remember from Getting Started, Git doesn't store data as a series of changesets or differences, but instead as a series of snapshots.
  
  When you make a commit, Git stores a commit object that contains a pointer to the snapshot of the content you staged. This object also contains the author's name and email, the message that you typed, and the pointers to the commit or commits that directly came before this commit (its parent or parents): zero parents for the initial commit, one parent for a normal commit, and multiple parents for a commit that results from a merge of two or branches.
  
## Git内部原理
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
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  

## My Reference
  * [Pro Git](https://git-scm.com/book/en/v2)
  * [Git Branch](https://git-scm.com/book/en/v2/Git-Branching-Branches-in-a-Nutshell)
  * [Git Vs BitKeeper](http://www.path8.net/tn/archives/6039)
