### Name: negbin
### Title: GAM negative binomial family
### Aliases: negbin
### Keywords: models regression

### ** Examples

library(mgcv)
set.seed(3)
n<-400
dat <- gamSim(1,n=n)
g <- exp(dat$f/5)

# negative binomial data  
dat$y <- rnbinom(g,size=3,mu=g)
# known theta ...
b <- gam(y~s(x0)+s(x1)+s(x2)+s(x3),family=negbin(3),data=dat)
plot(b,pages=1)
print(b)

## unknown theta via performance iteration...
b1 <- gam(y~s(x0)+s(x1)+s(x2)+s(x3),family=negbin(c(1,10)),
          method=gam.method(gam="perf"),data=dat)
plot(b1,pages=1)
print(b1)

## unknown theta via outer iteration and AIC search...
b2<-gam(y~s(x0)+s(x1)+s(x2)+s(x3),family=negbin(c(1,10)),
        data=dat)
plot(b2,pages=1)
print(b2)

## how to retrieve Theta...
b2$family$getTheta()

## unknown theta via outer iteration and AIC search
## over a discrete set of values...
b3<-gam(y~s(x0)+s(x1)+s(x2)+s(x3),family=negbin(2:10/2),
        data=dat)
plot(b3,pages=1)
print(b3)

## another example...
set.seed(1)
f <- dat$f
f <- f - min(f);g <- f^2
dat$y <- rnbinom(g,size=3,mu=g)
b <- gam(y~s(x0)+s(x1)+s(x2)+s(x3),family=negbin(1:10,link="sqrt"),
         data=dat) 
plot(b,pages=1)
print(b)
rm(dat)



