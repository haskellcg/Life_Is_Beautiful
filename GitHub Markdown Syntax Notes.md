# GitHub Markdown Syntax Notes

## Bold or Italic
  ```
  使用 '*' '_' 包围字符，例如  
  **bold** __bold__
  *italic* _italic_
  **_bold_**
  ```
  
## StrikeThrough
  ```
  使用'~'包围字符，例如
  ~~this is StrikeThrough~~
  ```

## List
  ```
  使用'*'表示无序列表，例如
  * item_1
    * item_11
    * item_12
  * item_2
    * item_21
    * item_22
    
  使用'1'表示有序列表，例如
  1. item_1
     1. item_11
     1. item_12
  1. item_2
     1. item_21
     1. item_22
     
  使用'[x]'创建任务列表，例如
  - [ ] finish this
  - [x] finish that
  - [ ] ready for run
  ```

## Headers
  ```
  使用'#'符号追加空格，例如  
  # h1 
  ## h2
  ```
  
## Links
  ```
  使用'[link_name](link_url)'，例如
  [GitHub](http://github.com)
  ```
  
## Image
  ```
  使用'![image_name](image_url)'，例如
  ![ChinaFlag](https://wiki.factorio.com/images/thumb/Flag_zh.png/25px-Flag_zh.png)
  ```
  
## Inline Code
  使用'```language_name ... ```'，例如
  
  ```c
  string hello()
  {
      return "hello world"
  }
  ```
  
  ```python
  import datetime
  print(datetime.datetime.now())
  ```

## Tables
  ```
  使用'|-'分割单元格，例如
  
  name|sex
  ----|----
  bob|male
  amy|female
  ```
  
## Quoting Text
  ```
  使用'>'，例如
  
  In the words of Abraham Lincoln:
  > Paron my French
  ```
  
## notice
  ```
  换行：空格 + 空格 + 换行  
  列表注意对齐
  ```
  
## 分隔符
  ```
  使用'---':
  ```

## 引用
  ```
  "![image_name][link_tag]" (对比与 "![image_name](link)")  
  "[link_name][link_tag]" (对比与 "[link_name](link)")  
  需要结合"[link_tag]: link", 具体使用参考下面的例子
  ```

## 项目状态
  ```
  加入项目状态: release - 1.02，我们希望友好的展示，可以使用下面的标签
  [![release-1.02][proj_image]][proj_link]
  
[proj_image]: https://img.shields.io/badge/release-1.02-brightgreen.svg  
[proj_link]: https://en.wikipedia.org/wiki/C++14
  ```
  
  推荐一个网站: [shieds.io](https://shields.io/)
