### Name: extendrange
### Title: Extend a Numerical Range by a Small Percentage
### Aliases: extendrange
### Keywords: dplot

### ** Examples

x <- 1:5
(r <- range(x))         # 1    5
extendrange(x)          # 0.8  5.2
extendrange(x, f= 0.01) # 0.96 5.04
## Use 'r' if you have it already:
stopifnot(identical(extendrange(r=r),
                    extendrange(x)))



