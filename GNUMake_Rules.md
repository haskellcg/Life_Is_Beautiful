## [My Makefile](https://github.com/haskellcg/CPlusPlus_Algorithm_DemoFiles/blob/master/makefile)
## [Official Manual](https://www.gnu.org/software/make/manual/html_node/index.html#SEC_Contents)

## Automatic Variavles
  * $@: the file name of the target of the rule
  * $<: the file name of the first prerequisite
  * $^: the names of all the prerequisites

## Funtions
  * $(dir names...): extracts the directory-part of each file name in names
  ```
  $(dir src/foo.c hacks)        #'src/ ./'
  ```
  * $(notdir names...): extracts all but the directory-part of each file name in names
  * $(suffix names...): extracts the suffix of each file name in names
  * $(basename names...): extracts all but the suffix of each file in names
  ```
  $(basename src/foo.c src-1.0/bar hacks)   #'src/foo src-1.0/bar hacks'
  ```
  * $(addsuffix suffix, names...): the value of suffix is appended to the end of each individual name
  ```
  $(addsuffix .cpp, foo bar)    #'foo.cpp bar.cpp'
  ```
  * $(addprefix prefix, names...)

## Phony Target
  * .PHONY

## Parallel Execution
  * make -j
  * make -j4
  * make parallel default
  ```
  vim ~/.bashrc

  add following lines to the end of file:
  alias make='make -j4'

  save file

  source ~/.bashrc
  ```
