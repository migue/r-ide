### Name: survreg.distributions
### Title: Parametric Survival Distributions
### Aliases: survreg.distributions
### Keywords: survival

### ** Examples

## not a good fit, but a useful example
survreg(Surv(futime,fustat)~ecog.ps+rx,data=ovarian,dist='extreme')
## 
my.extreme<-survreg.distributions$extreme
my.extreme$name<-"Xtreme"
survreg(Surv(futime,fustat)~ecog.ps+rx,data=ovarian,dist=my.extreme)

## time transformation
survreg(Surv(futime,fustat)~ecog.ps+rx,data=ovarian,dist='weibull',scale=1)
my.weibull<-survreg.distributions$weibull
my.weibull$dist<-my.extreme
survreg(Surv(futime,fustat)~ecog.ps+rx,data=ovarian,dist=my.weibull,scale=1)

## change the transformation to work in years
## intercept changes by log(365), other coefficients stay the same
my.weibull$trans<-function(y) log(y/365)
my.weibull$itrans<-function(y) exp(365*y)
survreg(Surv(futime,fustat)~ecog.ps+rx,data=ovarian,dist=my.weibull,scale=1)

## Weibull parametrisation
y<-rweibull(1000, shape=2, scale=5)
survreg(Surv(y)~1, dist="weibull")
## survreg reports scale=1/2, intercept=log(5)



