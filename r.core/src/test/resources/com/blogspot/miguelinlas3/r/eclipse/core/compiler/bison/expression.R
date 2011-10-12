### Name: expression
### Title: Unevaluated Expressions
### Aliases: expression is.expression as.expression as.expression.default
### Keywords: programming dplot

### ** Examples

length(ex1 <- expression(1+ 0:9))# 1
ex1
eval(ex1)# 1:10

length(ex3 <- expression(u,v, 1+ 0:9))# 3
mode(ex3 [3]) # expression
mode(ex3[[3]])# call
rm(ex3)



