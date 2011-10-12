### Name: PP.test
### Title: Phillips-Perron Test for Unit Roots
### Aliases: PP.test
### Keywords: ts

### ** Examples

x <- rnorm(1000)
PP.test(x)
y <- cumsum(x) # has unit root
PP.test(y)



