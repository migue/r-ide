### Name: mle
### Title: Maximum Likelihood Estimation
### Aliases: mle
### Keywords: models

### ** Examples

x <- 0:10
y <- c(26, 17, 13, 12, 20, 5, 9, 8, 5, 4, 8)
## This needs a constrained parameter space: most methods will accept NA
ll <- function(ymax=15, xhalf=6)
    if(ymax > 0 && xhalf > 0) -sum(stats::dpois(y, lambda=ymax/(1+x/xhalf), log=TRUE)) else NA
(fit <- mle(ll))
mle(ll, fixed=list(xhalf=6))
## alternative using bounds on optimization
ll2 <- function(ymax=15, xhalf=6)
    -sum(stats::dpois(y, lambda=ymax/(1+x/xhalf), log=TRUE))
mle(ll2, method="L-BFGS-B", lower=rep(0, 2))

summary(fit)
logLik(fit)
vcov(fit)
plot(profile(fit), absVal=FALSE)
confint(fit)

## use bounded optimization
## the lower bounds are really > 0, but we use >=0 to stress-test profiling
(fit1 <- mle(ll, method="L-BFGS-B", lower=c(0, 0)))
plot(profile(fit1), absVal=FALSE)

## a better parametrization:
ll2 <- function(lymax=log(15), lxhalf=log(6))
    -sum(stats::dpois(y, lambda=exp(lymax)/(1+x/exp(lxhalf)), log=TRUE))
(fit2 <- mle(ll2))
plot(profile(fit2), absVal=FALSE)
exp(confint(fit2))



