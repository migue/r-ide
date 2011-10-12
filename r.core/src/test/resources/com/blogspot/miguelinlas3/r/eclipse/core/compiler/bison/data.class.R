### Name: data.class
### Title: Object Classes
### Aliases: data.class
### Keywords: classes methods

### ** Examples

x <- LETTERS
data.class(factor(x))                 # has a class attribute
data.class(matrix(x, ncol = 13))      # has a dim attribute
data.class(list(x))                   # the same as mode(x)
data.class(x)                         # the same as mode(x)

stopifnot(data.class(1:2) == "numeric")# compatibility "rule"



