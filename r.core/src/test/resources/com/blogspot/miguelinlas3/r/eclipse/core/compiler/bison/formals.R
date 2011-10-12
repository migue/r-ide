### Name: formals
### Title: Access to and Manipulation of the Formal Arguments
### Aliases: formals formals<-
### Keywords: programming

### ** Examples

require(stats); require(graphics)
length(formals(lm))      # the number of formal arguments
names(formals(boxplot))  # formal arguments names

f <- function(x) a+b
formals(f) <- alist(a=,b=3) # function(a,b=3)a+b
f(2) # result = 5



