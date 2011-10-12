### Name: nchar
### Title: Count the Number of Characters (or Bytes or Width)
### Aliases: nchar nzchar
### Keywords: character

### ** Examples

x <- c("asfef", "qwerty", "yuiop[", "b", "stuff.blah.yech")
nchar(x)
# 5  6  6  1 15

nchar(deparse(mean))
# 18 17



