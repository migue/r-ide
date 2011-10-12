### Name: gam
### Title: Generalized additive models with integrated smoothness
###   estimation
### Aliases: gam
### Keywords: models smooth regression

### ** Examples

library(mgcv)
set.seed(0) ## simulate some data... 
dat <- gamSim(1,n=400,dist="normal",scale=2)
b<-gam(y~s(x0)+s(x1)+s(x2)+s(x3),data=dat)
summary(b)
plot(b,pages=1,residuals=TRUE)
plot(b,pages=1,seWithMean=TRUE)
## same fit in two parts .....
G<-gam(y~s(x0)+s(x1)+s(x2)+s(x3),fit=FALSE,data=dat)
b<-gam(G=G)
print(b)

## set the smoothing parameter for the first term, estimate rest ...
bp<-gam(y~s(x0)+s(x1)+s(x2)+s(x3),sp=c(0.01,-1,-1,-1),data=dat)
plot(bp,pages=1)
## alternatively...
bp <- gam(y~s(x0,sp=.01)+s(x1)+s(x2)+s(x3),data=dat)

# set lower bounds on smoothing parameters ....
bp<-gam(y~s(x0)+s(x1)+s(x2)+s(x3),
        min.sp=c(0.001,0.01,0,10),data=dat) 
print(b);print(bp)

## now a GAM with 3df regression spline term & 2 penalized terms
b0<-gam(y~s(x0,k=4,fx=TRUE,bs="tp")+s(x1,k=12)+s(x2,k=15),data=dat)
plot(b0,pages=1)

## now fit a 2-d term to x0,x1
b1<-gam(y~s(x0,x1)+s(x2)+s(x3),data=dat)
par(mfrow=c(2,2))
plot(b1)


par(mfrow=c(1,1))
## now simulate poisson data...
dat <- gamSim(1,n=400,dist="poisson",scale=.25)

b2<-gam(y~s(x0)+s(x1)+s(x2)+s(x3),family=poisson,data=dat)
plot(b2,pages=1)

## repeat fit using performance iteration
gm <- gam.method(gam="perf")
b3<-gam(y~s(x0)+s(x1)+s(x2)+s(x3),family=poisson,
        data=dat,method=gm)
plot(b3,pages=1)

## repeat using GACV as in Wood 2008...

gm <- gam.method(gcv="GACV")
b4<-gam(y~s(x0)+s(x1)+s(x2)+s(x3),family=poisson,
        data=dat,method=gm,scale=-1)
plot(b4,pages=1)

 

## a binary example 
dat <- gamSim(1,n=400,dist="binary",scale=.33)

lr.fit <- gam(y~s(x0)+s(x1)+s(x2)+s(x3),family=binomial,data=dat)
## plot model components with truth overlaid in red
op <- par(mfrow=c(2,2))
fn <- c("f0","f1","f2","f3");xn <- c("x0","x1","x2","x3")
for (k in 1:4) {
  plot(lr.fit,residuals=TRUE,select=k)
  ff <- dat[[fn[k]]];xx <- dat[[xn[k]]]
  ind <- sort.int(xx,index.return=TRUE)$ix
  lines(xx[ind],(ff-mean(ff))[ind]*.33,col=2)
}
par(op)
anova(lr.fit)
lr.fit1 <- gam(y~s(x0)+s(x1)+s(x2),family=binomial,data=dat)
lr.fit2 <- gam(y~s(x1)+s(x2),family=binomial,data=dat)
AIC(lr.fit,lr.fit1,lr.fit2)

## now a 2D smoothing example...

eg <- gamSim(2,n=500,scale=.1)
attach(eg)

op <- par(mfrow=c(2,2),mar=c(4,4,1,1))

contour(truth$x,truth$z,truth$f) ## contour truth
b4 <- gam(y~s(x,z),data=data) ## fit model
fit1 <- matrix(predict.gam(b4,pr,se=FALSE),40,40)
contour(truth$x,truth$z,fit1)   ## contour fit
persp(truth$x,truth$z,truth$f)    ## persp truth
vis.gam(b4)                     ## persp fit
detach(eg)
par(op)

## very large dataset example with user defined knots
par(mfrow=c(1,1))
eg <- gamSim(2,n=10000,scale=.5)
attach(eg)

ind<-sample(1:10000,1000,replace=FALSE)
b5<-gam(y~s(x,z,k=50),data=data,knots=list(x=data$x[ind],z=data$z[ind]))
vis.gam(b5)

## and a pure "knot based" spline of the same data
b6<-gam(y~s(x,z,k=100),data=data,knots=list(x= rep((1:10-0.5)/10,10),
        z=rep((1:10-0.5)/10,rep(10,10))))
vis.gam(b6,color="heat")

## varying the default large dataset behaviour via `xt'
b7 <- gam(y~s(x,z,k=50,xt=list(max.knots=1000,seed=2)),data=data)
vis.gam(b7)
detach(eg)



