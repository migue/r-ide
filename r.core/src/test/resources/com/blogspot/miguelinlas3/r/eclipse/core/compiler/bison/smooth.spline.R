### Name: smooth.spline
### Title: Fit a Smoothing Spline
### Aliases: smooth.spline
### Keywords: smooth

### ** Examples

require(graphics)

attach(cars)
plot(speed, dist, main = "data(cars)  &  smoothing splines")
cars.spl <- smooth.spline(speed, dist)
(cars.spl)
## This example has duplicate points, so avoid cv=TRUE
## Don't show: 
  stopifnot(cars.spl $ w == table(speed)) # weights = multiplicities
  utils::str(cars.spl, digits=5, vec.len=6)
  cars.spl$fit
## End Don't show
lines(cars.spl, col = "blue")
lines(smooth.spline(speed, dist, df=10), lty=2, col = "red")
legend(5,120,c(paste("default [C.V.] => df =",round(cars.spl$df,1)),
               "s( * , df = 10)"), col = c("blue","red"), lty = 1:2,
       bg='bisque')
detach()

## Residual (Tukey Anscombe) plot:
plot(residuals(cars.spl) ~ fitted(cars.spl))
abline(h = 0, col="gray")

## consistency check:
stopifnot(all.equal(cars$dist,
                    fitted(cars.spl) + residuals(cars.spl)))

##-- artificial example
y18 <- c(1:3,5,4,7:3,2*(2:5),rep(10,4))
xx  <- seq(1,length(y18), len=201)
(s2  <- smooth.spline(y18)) # GCV
(s02 <- smooth.spline(y18, spar = 0.2))
plot(y18, main=deparse(s2$call), col.main=2)
lines(s2, col = "gray"); lines(predict(s2, xx), col = 2)
lines(predict(s02, xx), col = 3); mtext(deparse(s02$call), col = 3)

## The following shows the problematic behavior of 'spar' searching:
(s2  <- smooth.spline(y18, control = list(trace=TRUE,tol=1e-6, low= -1.5)))
(s2m <- smooth.spline(y18, cv = TRUE,
                      control = list(trace=TRUE,tol=1e-6, low= -1.5)))
## both above do quite similarly (Df = 8.5 +- 0.2)

## Don't show: 
  s2. <- smooth.spline(y18, cv=TRUE,
                       control=list(trace=TRUE, tol=1e-6,low= -3,maxit=20))
  s2. ## Intel-Linux: Df ~= (even! > ) 18 : interpolating -- much smaller PRESS
     ## {others, e.g., may end quite differently!}
  lines(predict(s2., xx), col = 4)
  mtext(deparse(s2.$call,200), side= 1, line= -1, cex= 0.8, col= 4)

  sdf8 <- smooth.spline(y18, df = 8, control=list(trace=TRUE))
  sdf8 ; sdf8$df - 8

  try(smooth.spline(y18, spar = 50)) #>> error : spar 'way too large'
## End Don't show



