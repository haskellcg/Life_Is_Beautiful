## 1. 在目录查询某个字符串
  ```
  grep TODO ./*
  gre[ TODO ./ --directories=recurse
  ```

## 2. 字符计数
  ```
  // 查看自己写了多少代码
  cat * | wc -l
  cat * | wc
  ```
  
## 3. 修改文件的拥有者以及组
  ```
  chown -R haskell test.cpp
  chgrp -R haskell test.cpp    
  ```

## 4. 远程复制目录
  ```
  scp -r source_folder dest_folder
  scp -r /root/lk root@43.224.34.73:/home/lk/cpfile
  ```

## 5. 通过XShell向Windows传输Linux中的文件
  ```
  rz filepath
  sz filepath
  
  ubuntu install: sudo apt-get install lrzsz
  ```

## 6. 设置Linux终端状态为不回显
  ```
  stty -echo
  stty echo
  ```
  
## 7. 迭代的修改文件夹权限以及文件权限
  ```
  chmod -R 755 DstDir
  find DstDir -type d -exec chmod 755 {} \;
  find DstDir -type d -exec chmod 644 {} \;
  ```
