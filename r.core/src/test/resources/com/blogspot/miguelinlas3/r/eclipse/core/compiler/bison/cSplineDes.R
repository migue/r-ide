### Name: cSplineDes
### Title: Evaluate cyclic B spline basis
### Aliases: cSplineDes
### Keywords: models smooth regression

### ** Examples

 x <- 0:100/100;k<- 0:5/5
 X <- cSplineDes(x,k)
 plot(x,X[,1],type="l"); for (i in 2:5) lines(x,X[,i],col=i)



