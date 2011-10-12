### Name: mgcv
### Title: Multiple Smoothing Parameter Estimation by GCV or UBRE
### Aliases: mgcv
### Keywords: models smooth regression

### ** Examples

library(help="mgcv") # listing of all routines

set.seed(1);n<-400;sig2<-4
x0 <- runif(n, 0, 1);x1 <- runif(n, 0, 1)
x2 <- runif(n, 0, 1);x3 <- runif(n, 0, 1)
f <- 2 * sin(pi * x0)
f <- f + exp(2 * x1) - 3.75887
f <- f+0.2*x2^11*(10*(1-x2))^6+10*(10*x2)^3*(1-x2)^10-1.396
e <- rnorm(n, 0, sqrt(sig2))
y <- f + e
# set up additive model
G<-gam(y~s(x0)+s(x1)+s(x2)+s(x3),fit=FALSE)
# fit using mgcv
mgfit<-mgcv(G$y,G$X,G$sp,G$S,G$off,C=G$C)
 



