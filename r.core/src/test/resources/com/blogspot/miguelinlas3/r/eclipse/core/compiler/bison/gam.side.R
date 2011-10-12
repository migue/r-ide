### Name: gam.side
### Title: Identifiability side conditions for a GAM
### Aliases: gam.side
### Keywords: models regression

### ** Examples

set.seed(7)
dat <- gamSim(n=400,scale=2) ## simulate data
## estimate model with redundant smooth interaction...
b<-gam(y~s(x0)+s(x1)+s(x0,x1)+s(x2),data=dat)
plot(b,pages=1)

## Simulate data with real interation...
dat <- gamSim(2,n=500,scale=.1)
old.par<-par(mfrow=c(2,2))
## a fully nested tensor product example
b<-gam(y~s(x,bs="cr",k=6)+s(z,bs="cr",k=6)+te(x,z,k=6),
       data=dat$data)
plot(b)

par(old.par)
rm(dat)



