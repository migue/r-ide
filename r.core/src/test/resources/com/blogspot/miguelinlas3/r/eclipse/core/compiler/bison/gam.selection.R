### Name: gam.selection
### Title: Generalized Additive Model Selection
### Aliases: gam.selection
### Keywords: models regression

### ** Examples

## an example of GCV based model selection
library(mgcv)
set.seed(0);n<-400
dat <- gamSim(1,n=n,scale=2) ## simulate data
dat$x4 <- runif(n, 0, 1);dat$x5 <- runif(n, 0, 1) ## spurious
## Note the increased gamma parameter below to favour
## slightly smoother models (See Kim & Gu, 2004, JRSSB)...
b<-gam(y~s(x0,bs="ts")+s(x1,bs="ts")+s(x2,bs="ts")+
   s(x3,bs="ts")+s(x4,bs="ts")+s(x5,bs="ts"),gamma=1.4,data=dat)
summary(b)
plot(b,pages=1)



