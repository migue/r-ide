### Name: findInterval
### Title: Find Interval Numbers or Indices
### Aliases: findInterval
### Keywords: arith utilities

### ** Examples

N <- 100
X <- sort(round(stats::rt(N, df=2), 2))
tt <- c(-100, seq(-2,2, len=201), +100)
it <- findInterval(tt, X)
tt[it < 1 | it >= N] # only first and last are outside range(X)



