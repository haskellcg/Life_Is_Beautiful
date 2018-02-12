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
