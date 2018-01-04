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
  \-\-decorate|显示各个分支当前所指的对象
  
### 撤销操作
  发现提交漏掉了几个文件，或者提交信息写错了，可以选择带有--amend选项的提交命令尝试重新提交
  ```
  git commit --amend
  
  example:
  git commit -m "initial commit"
  git add forgotten_file
  git commit --amend
  ```
  
  取消暂存的文件
  ```
  git reset HEAD CONTRIBUTE.md
  ```
  
  撤消对文件的修改
  ```
  git checkout -- CONTRIBUTE.md
  ```
  
### 远程仓库的使用
  查看远程仓库
  ```
  git remote
  git remote -v
  
  git remote show origin
  ```
  
  添加远程仓库
  ```
  git remote add <shortname> <url>
  ```
  
  从远程仓库抓去或拉取
  ```
  fetch命令会将数据拉取到你的仓库，它并不会自动合并或修改你当前的工作，当准备好时你必须手动将其合并入你的工作
  git fetch [remote-name]
  
  如果你有一个分支设置为跟踪一个远程分支
  git pull
  
  默认情况下，git clone命令会自动设置本地master分支跟踪克隆的远程仓库的master分支，
  运行git pull通常会从克隆的服务器上抓取数据并尝试合并到当前所在分支
  git branch --set-upstream-to=origin/master master
  git pull
  ```
  
  推送到远程仓库
  ```
  git push [remote-name] [branch-name]
  git push origin master
  ```
  
  远程仓库的移除与重命名
  ```
  git remote rename pd paul
  
  git remote rm paul
  ```
  
### 打标签
  像其他版本控制系统一样，Git可以给历史中的某一个提交打上标签，以示总要。比较有代表性的是人们会使用这个功能来标记发布节点。
  
  Git使用两种主要类型的标签: 轻量标签(lightweight) 和 附注标签(annoted)
  * 一个轻量标签很想一个不会改变的分支，它只是一个特定提交的引用
  * 附注标签则是存储在Git数据库中的一个完整对象，它可以被校验、其中包含打标签者的名字、电子邮件地址、日期时间，标签信息，并且可以使用GNU Privacy Guard (GPG)签名与验证。
  
  通常建议创建附注标签。
  
  默认情况下，git push命令并不会传送标签到远程仓库服务器上，在创建完标签后你必须显式地推动标签。
  
  在Git中你并不能真的检出一个标签，因为它们并不能向分支一样来回移动。如果你想要工作目录与仓库中特定的标签版本完全一样，可以使用git checkout -b [branchname] [tagname]
  
  列出标签
  ```
  git tag
  
  1.8.5系列
  git tag -l 'v1.8.5*'   
  ```
  
  创建附注标签
  ```
  git tag -a v1.4 -m "my version 1.4"
  
  git show v1.4
  ```
  
  创建轻量标签
  ```
  git tag v1.4-lw
  
  git show v1.4-lw
  ```
  
  后期打标签
  ```
  git tag -a v1.2 9fceb02
  ```
  
  共享标签
  ```
  git push origin v1.5
  
  推送全部的标签
  git push origin --tags
  ```
  
  检出标签
  ```
  git checkout -b version2 v2.0.0
  ```
  
### Git别名
  如果不想每次都输入完整的Git命令，可以通过git config文件来轻松地为每一个命令
  ```
  git config --global alias.co checkout
  git config --global alias.br branch
  git config --global alias.ci commit
  git config --global alias.st status
  
  git config --global alias.unstage 'reset HEAD --'
  
  git config --global alias.last 'log -1 HEAD'
  
  执行外部命令
  git config --global alias.visual '!gitk'
  ```  

## 3. Git Branch
  Nearly every VCS has some form of branching support. Branching means you diverge from the main line of development and continue to do work without messing with that main line. **_In many VCS tools, this is a somewhat expensive process, often requiring you to create a new copy of your source code directory, which can take a long time for large project_**.
  
  The way Git braches is incredibly lightweight, making branching operations nearly instantaneous, and swiching back and forth between branches generally just as fast.
  
### Branches in a Nutshell  
  As you may remember from Getting Started, Git doesn't store data as a series of changesets or differences, but instead as a series of snapshots.
  
  When you make a commit, Git stores a commit object that contains a pointer to the snapshot of the content you staged. This object also contains the author's name and email, the message that you typed, and the pointers to the commit or commits that directly came before this commit (its parent or parents): zero parents for the initial commit, one parent for a normal commit, and multiple parents for a commit that results from a merge of two or branches.
  
  暂存操作会为每一个文件计算校验和(SHA-1哈希算法)，然后会把当前版本的文件快照保存到Git仓库中(Git使用blob对象来保存它们)，最终将校验和加入到暂存区域等待提交：
  ```
  git add README test.rb LICENSE
  git commit -m "The initial commit of my project"
  ```
  
  当使用git commit进行提交操作时，Git会先计算每一个子目录的校验和，然后在Git仓库中这些校验和保存为树对象，随后，Git便会创建一个提交对象，它除了包含上面提到的那些信息外，还包含这个树对象的指针，如此一来，Git就可以在需要的时候重现此次保存的快照。
  
  现在Git仓库中5个对象：
  * 3个blob对象(保存文件快照)
  * 1个树对象(记录着目录结构和blob对象索引)
  * 1个提交对象(包含着指向前述树对象的指针和所有提交信息)
  
  Git的分支，其实本质上仅仅是指向提交对象的可变指针。Git的默认分支名字是master。在多次提交操作之后，你其实已经有一个指向最后那个提交对象的master分支。
  
  Git的master分支并不是特殊的分支，它跟其他分支没有区别，之所以每一个仓库都有一个master分支，是因为git init命令默认创建它，并且大多数人懒得去改。
  
  分支创建:
  ```
  git branch testing
  ```
  
  Git有一个名为HEAD的特殊指针，请注意它与许多其他版本控制系统(Subversion/CVS)中的HEAD概念不同，在Git中，它是一个指针，指向当前所在本地分支
  
  使用git log命令查看各个分支所指的对象
  ```
  git log --oneline --decorate
  ```
  
  分支切换: 将HEAD指向testing，并将工作目录恢复成master分支所指向的快照内容
  ```
  git checkout testing
  ```
  
### 分支的新建与合并  
  新建分支并同时切换到该分支
  ```
  git checkout -b isss53
  
  =>
  git branch iss53
  git checkout iss53
  ```
  
  发现基于master的分支有bug，需要切回到master分支，但是在你做之前，要留意你的工作目录和暂存区里那些还没有被提交的修改，它可能会和你即将检出的分支产生冲突从而阻止Git切换到该分支。最好的方法是，在你切换到分支之前，保持好一个干净的状态。
  
  有一个方法可以绕过这个问题(即，保存进度(stashing)和修补提交(commit amending))
  
  切换回到目前bug的分支
  ```
  git checkout master
  ```
  
  接下来你需要修复这个问题，我们建立一个针对该紧急问题的分支，在分支上工作直到解决问题
  ```
  git checkout -b hotfix
  ```
  
  修复完毕之后，需要将其合并到你的master分支来部署到线上，你可以使用git merge命令： 
  ```
  git checkout master
  git merge hotfix
  ```
  
  在合并时，由于当前master分支所指向的提交是你当前提交的直接上游，所以Git只是简单的将指针移动。换句话说，当你试图合并两个分支时，如果顺着一个分支走下去可能到达另一个分支，那么Git在合并两者的时候，只会简单的将指针向前推进，因为这种情况下的合并操作并没有需要解决的分歧，所以叫做"fast-forward"
  
  在紧急的问题的解决方案发布之后，你准备回到被打断之前时的工作中，然而，你应该先删除hotfix分支，因为你已经不需要它了
  ```
  git branch -d hotfix
  
  git checkout iss53
  ```
  
  分支的合并
  ```
  git checkout master
  
  git merge iss53
  ```
  
  这和你之前的合并hotfix分支的时候看起来不一样，你的开发历史从一个更早的地方开始分叉开来，因为，master分支所在的提交并不是iss53分支所在提交的直接祖先，在这种情况下，Git会使用这两个分支的末端所指的快照(C4,C5)以及这两个分支的工作祖先(C2)，做一个简单的三方合并。
  
  需要指出的是，Git会自行决定选取哪一个提交作为共同祖先，并以此作为合并的基础；这和更加古老的CVS或者Subversion不同，在这些古老的版本管理系统中，用户需要自己选择最佳的合并基础。
  
  ```
  git branch -d iss53
  ```
  
### 遇到冲突的分支合并
  ```
  git merge iss53  
  > ... conflict ...
  
  git status
  > ... unmerged ...
  ```
  
  编辑冲突
  ```
  git mergetool
  ```
  
  或者手动编辑文件
  
### 分支管理  
  ```
  git branch
  
  git branch -v
  ```
  
  \-\-merged与\-\-no\-merged选项可以过滤这个列表中已经合并或尚未合并到当前分支的分支
  ```
  git branch --merged
  > iss53
  > * master    
  
  git branch --no-merged
  ```
  这个列表中分支名字前没有\*号的分支通常可以使用git branch -d删除
  
### 分支开发工作流 
#### 长期分支
  就算在一段时间内，反复把一个分支合并入另一个分支，也不是什么难事。
  
  很多使用Git的开发者都喜欢使用这种方式工作，比如只在master分支上保留完全稳定的代码--有可能仅仅是已经发布或即将发布的代码。他们还有一些名为develop或者next的平行分支，被用来做后续开发或者测试稳定性--这些分支不必保持稳定，但是一旦打到稳定状态，它们就可以被合入master分支了。这样，在确保这些已完成的特性分支能够完成所有测试，并且不会引入更多Bug之后，就可以合并入主分支，等待下一次的发布。
  
  渐进稳定分支的线形图
  
  渐进稳定分支的流水线图
  
  使用不同层次的稳定性
  
#### 特性分支  
  特性分支对任何规模的项目都适用，特性分支是一种短期分支，它被用来实现单一特性或相关工作。
  
### 远程分支  
  远程引用是对远程仓库的引用(指针)，包括分支、标签等等。查看远程引用信息
  ```
  git ls-remote
  
  git remote show
  ```
  
  远程跟踪分支是远程分支状态的引用。它们是你不能移动的本地引用，当你做任何网络通信操作时，它们会自动移动。远程跟踪分支像是你上次连接到远程仓库时，那些分支所处状态的书签。
  
  它们以(remote)/(branch)形式命名，例如你想看你最后一次与远程仓库origin通信时master分支的状态，你可以查看origin/master分支。
  
  你与同事合作解决了一个问题，并且他们推送了一个iss53分支，你可能有自己本地的iss53分支，但是服务器上的分支会指向origin/iss53分支
  
  假设你的网络中有一个Git服务器，如果你从这里克隆，Git的clone命令会为你自动将其命名为origin，拉取它的数据，创建一个指向它的master分支的指针，并且在本地将其命名为origin/master，Git也会给你一个与origin的master分支在指向同一个地方的master分支，这样你就有工作的基础。
  
  "master"是当你运行git init时默认的起始分支名字，原因在于它的广泛使用；"origin"是当你运行git clone时默认的远程仓库的名字，如果你运行
  ```
  git clone -o booyah
  ```
  那么你的默认远程分支名字将会是booyah/master
  
  如果你要同步你的工作，运行git fetch origin，从中抓取本地没有的数据，并且更新本地数据库，移动origin/master指针指向新的、更新后的位置。
  
#### 推送
  当你想要公开分享一个分支时，需要将其推送到有写入权限的远程仓库上。本地的分支并不会自动与远程仓库同步--你必须显式地推送想要分享的分支。
  
  这样你就可以把不愿意分享的内容放在私人分支上，而将需要和别人协作的内容推送到公开分支。
  
  ```
  git push origin serverfix
  ```
  Git会自动将serverfix分支名字展开为refs/heads/serverfix:refs/heads/serverfix，那意味着，"推送本地的serverfix分支来更新远程仓库的serverfix分支"。如果不想让远程仓库上的分支叫做serverfix，可以运行
  ```
  git push origin serverfix:awesomebranch
  ```
  来将本地的serverfix分支推送到远程仓库上的awesomebranch分支，下次其他协作者从服务器上抓取数据时，他们会在本地生成一个远程分支origin/serverfix,指向服务器的serverfix分支
  
  ```
  将这些工作合并到当前所在分支
  git merge origin/serverfix
  
  git checkout -b serverfix origin/serverfix
  ```

#### 跟踪分支
  从一个远程分支检出一个本地分支会自动创建一个叫做"跟踪分支"(有时候也叫"上游分支")。跟踪分支是与远程分支有直接关系的本地分支，如果在一个跟踪分支上输入git pull，Git能够自动识别去哪个服务器上抓取、合并到哪个分支
  
  ```
  git checkout -b [branch] [remotename]/[branch]
  
  git checkout --track origin/serverfix
  
  将本地分支与远程分支设置为不同的名字，你可以轻松增加一个不同的名字
  git checkout -b sf origin/serverfix
  
  修改上游分支(-u/--set-upstream-to)
  git branch -u origin/serverfix
  
  查看所有跟踪分支
  git branch -vv
  ```
  
  需要重点注意的一点是这些数字的值来自于你从每一个服务器上最后一次抓取的数据，这个命令并没有链接到服务器，它只会告诉你关于本地缓存的服务器数据。如果要想统计最新的领先与落后的数字，需要在运行此命令之前抓取所有的远程仓库
  ```
  git fetch --all
  
  git branch -vv
  ```
  
#### 拉取
  当git fetch命令抓取那个服务器上抓取没有的数据时，它并不会修改工作目录中的内容。它只会获取数据后然你自己合并。
  
  有一个命令叫做git pull在大多数情况下它的含义是一个git fetch紧接着一个git merge命令。
  
  如果有一个像之前章节中演示的设置好的跟踪分支，不管是显式地设置，还是通过clone或checkout命令为你创建，git pull都会查找当前分支所跟踪的服务器分支，从服务器上抓取数据尝试合并入那个远程分支。
  
#### 删除远程分支
  如果你已经通过远程分支完成工作了，可以运行带有--delete选项的git push命令删除一个远程分支。
  ```
  git push origin --delete serverfix
  ```
  基本上这个命令做的只是从服务器上移除这个指针。Git服务器通常会保留数据一段时间知道垃圾回收运行，所以如果不小心删除掉了，通常时很容易恢复的。
  
### 变基
  Git整合来自不同分支的修改主要有两种方法:
  * merge
  * rebase
  
  你可以在C4中引入的补丁和修改，然后在C3上的基础上再应用一次。Git中，这种操作就叫做变基。你可以使用rebase命令将提交到某一分支上的所有修改都移至另一个分支上，就好像重新播放。
  
  ```
  git checkout experiment
  git rebase master
  
  git checkout master
  git merge experiment
  ```  
  
  这两种整合方法的最终结果没有区别，但是变基使得提交历史更加整洁。你在查看一个变基的历史记录时会发现，尽管实际的开发工作是并行的，但是它们看上去就像是先后串行的一样，提交历史时一条直线没有分叉。
  
  变基是将一系列提交按照原有次序一次应用到另一分支上，而合并把最终结果合并在一起。
  
  一般我们这样做的目的是为了确保在向远程分支推送时能保持提交历史的整洁--例如向别人维护的项目贡献代码。在这种情况下，你首先在自己的分支里进行开发，在开发完成后你需要先将你的代码变基到origin/master上，然后再向主项目提交修改。这样的话，该项目的维护者就不再需要进行整合工作，只需要快进合并即可。
  
  ```
  取出client分支，找出处于client分支和server分支的共同祖先之后的修改，然后把它们在master分支上重演一遍
  git rebase --onto master server
  
  快进master分支
  git checkout master
  git merge client
  
  git rebase [basebranch] [topicbranch]
  git rebase master server
  
  快进master分支
  git checkout master
  git merge server
  
  删除分支
  git branch -d client
  git branch -d server
  ```
  
#### 变基的风险  
  **_不要对你的仓库外有副本的分支执行变基_**。
  
  变基操作实质上时丢弃一些现有的提交，然后相应地新建一些内容一样但是实际上不同的提交。如果你已经将提交推送到某个仓库，而其他人已经从该仓库拉取提交并进行了后续工作，此时，由于你用git rebase命令重新整理了提交再次推送，你的同伴因此将不得不再次将他们手头的工作与你的提交整合，如果接下来你还要拉取并整合它们修改过的提交，事情会变得一团糟。
  
#### 用变基解决变基  
  如果团队中的某人强制推送并覆盖了一些你所基于的提交，你需要做的就是检查你做了那些修改，以及它们覆盖了那些修改。
  
  实际上，Git除了对整个提交计算SHA1校验之外，也对本次提交所引入的修改计算了校验和--"Patch ID"
  
  如果你拉取被覆盖过的更新并将你手头上的工作基于此进行变基的话，一般情况下Git能成功分辨出你的修改，并把它们应用到新分支上。
  
  ```
  git rebase teamone/master
  
  git pull --rebase
  
  git fetch
  git rebase teamone/master    
  ```
  
  只要你把变基命令当作是在推送前清理提交使之整洁的工具，并且只在从未推送至共用仓库的提交上执行变基，你就不会有事。
  
#### 变基 vs. 合并  
  原则是，只对尚未推送或分享给别人的本地修改执行变基操作清理历史，从不对已推送值别处的提交执行变基。
  
## 4. 服务器上的Git  
  
## 5. 分布式Git  
### 分布式工作流程  
  在Git中，每个开发者同时扮演着节点和集线器的角色。由此，Git的分布式协作可以为你的项目和团队衍生出种种不同的工作流程。  
  
  * 集中式工作流程:John完成了他的修改并推送到服务器。接着Jessica尝试提交自己的修改，却遭到服务器拒绝。她被告知她的修改正通过非快进式推送，只有将数据抓取下来并且合并方能推送
  
  * 集成管理者工作流:每个开发者拥有自己的仓库的写权限和其他所有人仓库的读权限，这种情况下通常会有一个代表"官方"项目的权威仓库。要为这个项目做贡献，你需要从该项目克隆出一个自己的公开仓库，然后把自己的修改推送上去。接着你可以请求官方仓库的维护者拉取更新并合并到主项目
  
  * 司令官与副官工作流:一般拥有数百位协作者的超大型项目才会用到这样的方式，例如著名的Linux内核项目。被称为副官(lieutenant)的各个集成管理者分别负责集成项目中特定的部分。所有这些副官头上还有一位成为司令官(dictator)的总集成管理者负责统筹。司令官维护的仓库作为参考仓库，为所有协作者提供他们需要拉取的项目代码。
  
### 向一个项目贡献  
  描述应该如何贡献并不是非常准确。影响因素包括：
  * 活跃贡献者数量
  * 选择的工作流程
  * 提交权限
  * 外部贡献方法
  
  提交准则:Git项目提供了一个文档，其中列举了关于创建提交到提交补丁的若干提示，可以在Git源代码中的Documentation/SubmittingPatches文件中阅读。尝试让每一个提交成为逻辑上的独立变更集。Git项目要求一个更详细的解释，包括改动的动机和它实现与之前行为的对比。
  ```
  检查空白错误
  git diff --check    
  ```
  
  私有小型团队：闭源，你和其他的开发者都有仓库的推送权限。尽管Subversion会对编辑不同文件在服务器上自动进行一次合并，但Git要强求你在本地合并提交。
  ```
  Jessica认为她的特性分支已经准备好了，但是她想知道必须合并什么进入她的工作才能推送，她运行git
  git log --no-merges issue54..origin/master
  
  git checkout master
  git merge issue54
  git merge origin/master
  git push origin master
  ```
  
  私有管理团队
  ```
  #Jessica's Machine
  git checkout -b featureA
  vim lib/simplegit.rb
  git commit -am "add limit to log function"
  
  git push -u origin featureA
  
  #Jessica's Machine
  git fetch origin
  git checkout -b featureB origin/master
  vim lib/simplegit.rb
  git commit -am "made" the ls-tree function recursive
  vim lib/simplegit.rb
  git committ -am "add ls-files"
  
  Josie已经推送了自己的分支featureBee
  git fetch origin
  git merge origin/feature
  
  Jassica需要将featureB分支上合并的工作推送到服务器上的featureBee分支
  git push -u origin featureB:featureBee
  
  John已经改动了featureA
  git fetech origin
  git log featureA..origin/featureA
  git checkout featureA
  git merge origin/featureA
  
  ...
  git commit -am "small tweak"
  ```
  
  派生的公开项目:向公开项目做贡献有点不同，因为没有权限直接更新项目分支，你必须用其他方法将工作给维护者(GitHub/BitBuket/GoogleCode/repo.or.cz)。
  ```
  git clone (url)
  cd project
  git checkout -b featureA
  ...work...
  git commit
  ...work...
  git commit
  
  当你的分支工作完成后准备将其贡献回维护者，去原始项目中点击"Fork"按钮，
  创建一份自己的可写的项目派生仓库，然后添加这个仓库url作为第二个远程仓库
  git remote add myfork (url)
  
  相对与合并到主分支再推上去，推送你的工作特性到仓库更简单，
  原因时如果工作不被接收或者被拣选的，就不必会退到你的master分支
  git push -u myfork featureA
  
  当工作已经被推送到你的派生后，你需要通知维护者，这通常被成为一个拉取请求(pull request)。
  git request-pull
  git request-pull origin/master myfork
  
  为维护者解决冲突，然后重新提交你的改动
  git checkout featureA
  git rebase origin/master
  git push -f myfork featureA
  ```
  
  通过邮件公开项目:许多项目建立了接收补丁的流程
  ```
  生成每一个提交序列的电子邮件版本然后邮寄它们到开发者邮件列表
  git checkout -b topicA
  ...work...
  git commit
  ...work...
  git commit
  
  使用git format-patch来生成可以邮寄到列表的mbox格式的文件
  它将每一个文件提交转换为一封电子邮件，提交信息的第一行作为主题
  剩余信息与提交引入的补丁作为正文
  git format-patch -M origin/master
  > xxx.patch
  > xxaa.patch
  
  为了将patch邮寄到邮件列表，你既可以将文件粘贴到电子邮件客户端，也可以通过命令行程序发送。
  粘贴文本经常会发生格式化问题
  Git提供了一个工具帮助你通过IMAP发送正确格式化补丁
  vim ~/.gitconfig
  """
  [imap]
      folder = "[Gmail]/Drafts"
      host = imaps://imap.gmail.com
      user = user@gmail.com
      pass = password
      port = 993
      sslverify = false
  """
  cat *.patch | git imap-send
  
  通过SMTP服务器发送补丁
  vim ~/.gitconfig
  """
  [sendemail]
      smtpencryption = tls
      smtpserver = smtp.gmail.com
      smtpuser = user@gmail.com
      smtpserverport = 587
  """
  git send-email *.patch
  ```
  
### 维护项目  
#### 在特性分支中工作  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
## 6. GitHub  

## 7. Git工具

## 8. 自定义Git

## 9. Git与其他系统
  
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

## 11. 其他环境中的Git

## 12. 将Git嵌入到你的应用

## 13. Git命令

## My Reference
  * [Pro Git](https://git-scm.com/book/en/v2)
  * [Git Branch](https://git-scm.com/book/en/v2/Git-Branching-Branches-in-a-Nutshell)
  * [Git Vs BitKeeper](http://www.path8.net/tn/archives/6039)
  * [GitIgnore Project](https://github.com/github/gitignore)
