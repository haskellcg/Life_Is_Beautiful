# Pro Git

## Git Branch
  Nearly every VCS has some form of branching support. Branching means you diverge from the main line of development and continue to do work without messing with that main line. **_In many VCS tools, this is a somewhat expensive process, often requiring you to create a new copy of your source code directory, which can take a long time for large project_**.
  
  The way Git braches is incredibly lightweight, making branching operations nearly instantaneous, and swiching back and forth between branches generally just as fast.
  
### Branches in a Nutshell  
  As you may remember from Getting Started, Git doesn't store data as a series of changesets or differences, but instead as a series of snapshots.
  
  When you make a commit, Git stores a commit object that contains a pointer to the snapshot of the content you staged. This object also contains the author's name and email, the message that you typed, and the pointers to the commit or commits that directly came before this commit (its parent or parents): zero parents for the initial commit, one parent for a normal commit, and multiple parents for a commit that results from a merge of two or branches.

## My Reference
  * [Pro Git](https://git-scm.com/book/en/v2)
  * [Git Branch](https://git-scm.com/book/en/v2/Git-Branching-Branches-in-a-Nutshell)
