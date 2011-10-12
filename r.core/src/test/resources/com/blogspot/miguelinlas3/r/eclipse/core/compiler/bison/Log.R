### Name: log
### Title: Logarithms and Exponentials
### Aliases: log logb log10 log2 log1p exp expm1
### Keywords: math

### ** Examples

log(exp(3))
log10(1e7)# = 7

x <- 10^-(1+2*1:9)
cbind(x, log(1+x), log1p(x), exp(x)-1, expm1(x))



