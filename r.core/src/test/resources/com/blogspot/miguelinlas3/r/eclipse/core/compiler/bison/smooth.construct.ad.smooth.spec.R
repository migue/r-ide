### Name: smooth.construct.ad.smooth.spec
### Title: Adaptive smooths in GAMs
### Aliases: smooth.construct.ad.smooth.spec adaptive.smooth
### Keywords: models regression

### ** Examples

## Comparison using an example taken from AdaptFit
## library(AdaptFit)
set.seed(0)
x <- 1:1000/1000
mu <- exp(-400*(x-0.6)^2)+5*exp(-500*(x-0.75)^2)/3+2*exp(-500*(x-0.9)^2)
y <- mu+0.5*rnorm(1000)

##fit with default knots
## y.fit <- asp(y~f(x))

par(mfrow=c(2,2))
## plot(y.fit,main=round(cor(fitted(y.fit),mu),digits=4))
## lines(x,mu,col=2)

b <- gam(y~s(x,bs="ad",k=40,m=5)) ## adaptive
plot(b,shade=TRUE,main=round(cor(fitted(b),mu),digits=4))
lines(x,mu-mean(mu),col=2)
 
b <- gam(y~s(x,k=40))             ## non-adaptive
plot(b,shade=TRUE,main=round(cor(fitted(b),mu),digits=4))
lines(x,mu-mean(mu),col=2)

b <- gam(y~s(x,bs="ad",k=40,m=5,xt=list(bs="ps",bs="tp")))
plot(b,shade=TRUE,main=round(cor(fitted(b),mu),digits=4))
lines(x,mu-mean(mu),col=2)

## disappointing 2D example
par(mfrow=c(2,2),mar=c(1,1,1,1))
x <- seq(-.5, 1.5, length= 60)
z <- x
f3 <- function(x,z,k=15) {  r <- sqrt(x^2+z^2); f <- exp(-r^2*k);f}                          
f <- outer(x, z, f3)
op <- par(bg = "white")
persp(x, z, f, theta = 30, phi = 30, col = "lightblue",ticktype="detailed")

n <- 2000
x <- runif(n)*2-.5
z <- runif(n)*2-.5
f <- f3(x,z)
y <- f + rnorm(n)*.4

b0 <- gam(y~s(x,z,k=150))
vis.gam(b0,theta=30,phi=30,ticktype="detailed")
## slow, uncomment to use...
#b <- gam(y~s(x,z,bs="ad",k=15,m=3),gamma=1.4)
#vis.gam(b,theta=30,phi=30,ticktype="detailed")
#cor(fitted(b0),f);cor(fitted(b),f)




