# Git与GitHub的不同
  * Git 是代码版本控制工具
  * GitHub 是代码托管工具
  
# 工具集
GitHub提供了代码托管，使用邮箱注册、填写profile，相当方便。我最开始使用**GitHub Desktop**，基础的代码管理是挺方便的，但是不提供编辑功能以及markdown的预览，用来用去就感觉挺鸡肋的，我还不如直接用git呢，所以确定下来的使用工具集如下：
  * 代码托管、博客编辑阅读使用GitHub
  * 使用[Git SCM](https://git-for-windows.github.io/)作为版本控制，包括代码博客更新、上传、修改
  * 使用对应的代码编辑器对代码进行本地编辑，例如vim、vs2013
  
# Git与GitHub连接
使用**GitHub Desktop**不用关心这一步，它已经为你设置好，如果使用**Git SCM**需要设置，具体步骤：
  1. 在GitHub上创建库，这一步在连接账户并不是必须的，只是后面使用Git命令是方便测试  
     ![Git And GitHub_1]()
  1. 安装**Git SCM**，基本默认下一步就可以
  1. 右键打开Git Shell，生成SSH密钥：
     > ssh-keygen -t rsa -C "你的注册邮箱@163.com"  
     > 默认会在user/用户名/.ssh下生成两个文件 "id_rsa" "id_rsa.pub"，连接时使用pub文件  
  1. 打开GitHub->Settings->SSH and GPG Keys，如果你之前使用过**GitHub Desktop**，就会看到它给你添加的SSH Key，我们需要做的就是添加使用**Git SCM**生成的SSH Key
     > Title随便写，只要自己明白就可以，然后复制id_rsa.pub文件的全部内容到Key，点击Add SSH Key即可
  1. 最后在测试添加的情况
     > ssh -T git@github.com  
     > 提示yes/no， 写"yes"即可  
     > 提示Hi xxx! You've successfully authenticated, but GitHub does not provide shell access，成功
  1. 添加用户名和邮箱
     > git config --global user.name "你的用户名"  
     > git config --global user.email "你的注册邮箱@163.com"

# pull已经存在的库
  1. 右键打开Git Bash
  1. 假设需要pull的库名称为Test，命令如下:
     > mkdir Test  
     创建目录存储远端的库，目录名与库名相同
  1. > cd Test  
     > git init  
     > git remote add origin git@github.com:haskellcg/Test.git  
     移动到目录，初始化库，并添加与远程库Test的连接
  1. > git pull git@github.com:haskellcg/Test.git  
     > 或者 git pull origin master  
     从远程库下载所有内容到本地，有更新时也可以使用该命令update
     
# push本地的更新
  1. 修改或添加文件，假设文件名为Test.md
  1. > git add Test.md  
     将Test.md加入更新提交的的列表，否则git会提示Change not staged...
  1. > git commit -m "message for change"  
     > git push -u origin master  
     > 或者  
     > git push git@github.com:haskellcg/Test.git
     提交更新提示，并将更新提交到远程库
     
