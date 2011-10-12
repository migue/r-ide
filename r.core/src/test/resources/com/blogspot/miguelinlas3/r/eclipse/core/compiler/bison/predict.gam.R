### Name: predict.gam
### Title: Prediction from fitted GAM model
### Aliases: predict.gam
### Keywords: models smooth regression

### ** Examples

library(mgcv)
n<-200
sig <- 2
dat <- gamSim(1,n=n,scale=sig)

b<-gam(y~s(x0)+s(I(x1^2))+s(x2)+offset(x3),data=dat)

newd <- data.frame(x0=(0:30)/30,x1=(0:30)/30,x2=(0:30)/30,x3=(0:30)/30)
pred <- predict.gam(b,newd)

## difference between "terms" and "iterms"
nd2 <- data.frame(x0=c(.25,.5),x1=c(.25,.5),x2=c(.25,.5),x3=c(.25,.5))
predict(b,nd2,type="terms",se=TRUE)
predict(b,nd2,type="iterms",se=TRUE)

## now get variance of sum of predictions using lpmatrix

Xp <- predict(b,newd,type="lpmatrix") 

## Xp %*% coef(b) yields vector of predictions

a <- rep(1,31)
Xs <- t(a) %*% Xp ## Xs %*% coef(b) gives sum of predictions
var.sum <- Xs %*% b$Vp %*% t(Xs)

## Now get the variance of non-linear function of predictions
## by simulation from posterior distribution of the params

library(MASS)
br<-mvrnorm(1000,coef(b),b$Vp) ## 1000 replicate param. vectors
res <- rep(0,1000)
for (i in 1:1000)
{ pr <- Xp %*% br[i,] ## replicate predictions
  res[i] <- sum(log(abs(pr))) ## example non-linear function
}
mean(res);var(res)

## loop is replace-able by following .... 

res <- colSums(log(abs(Xp %*% t(br))))

## The following shows how to use use an "lpmatrix" as a lookup 
## table for approximate prediction. The idea is to create 
## approximate prediction matrix rows by appropriate linear 
## interpolation of an existing prediction matrix. The additivity 
## of a GAM makes this possible. 
## There is no reason to ever do this in R, but the following 
## code provides a useful template for predicting from a fitted 
## gam *outside* R: all that is needed is the coefficient vector 
## and the prediction matrix. Use larger `Xp'/ smaller `dx' and/or 
## higher order interpolation for higher accuracy.  

xn <- c(.341,.122,.476,.981) ## want prediction at these values
x0 <- 1         ## intercept column
dx <- 1/30      ## covariate spacing in `newd'
for (j in 0:2) { ## loop through smooth terms
  cols <- 1+j*9 +1:9      ## relevant cols of Xp
  i <- floor(xn[j+1]*30)  ## find relevant rows of Xp
  w1 <- (xn[j+1]-i*dx)/dx ## interpolation weights
  ## find approx. predict matrix row portion, by interpolation
  x0 <- c(x0,Xp[i+2,cols]*w1 + Xp[i+1,cols]*(1-w1))
}
dim(x0)<-c(1,28) 
fv <- x0%*%coef(b) + xn[4];fv    ## evaluate and add offset
se <- sqrt(x0%*%b$Vp%*%t(x0));se ## get standard error
## compare to normal prediction
predict(b,newdata=data.frame(x0=xn[1],x1=xn[2],
        x2=xn[3],x3=xn[4]),se=TRUE)




