### Name: ts
### Title: Time-Series Objects
### Aliases: ts as.ts as.ts.default is.ts Ops.ts cbind.ts is.mts [.ts t.ts
### Keywords: ts

### ** Examples

require(graphics)

ts(1:10, frequency = 4, start = c(1959, 2)) # 2nd Quarter of 1959
print( ts(1:10, frequency = 7, start = c(12, 2)), calendar = TRUE)
# print.ts(.)
## Using July 1954 as start date:
gnp <- ts(cumsum(1 + round(rnorm(100), 2)),
          start = c(1954, 7), frequency = 12)
plot(gnp) # using 'plot.ts' for time-series plot

## Multivariate
z <- ts(matrix(rnorm(300), 100, 3), start=c(1961, 1), frequency=12)
class(z)
plot(z)
plot(z, plot.type="single", lty=1:3)

## A phase plot:
plot(nhtemp, c(nhtemp[-1], NA), cex = .8, col="blue",
     main = "Lag plot of New Haven temperatures")
## a clearer way to do this would be
## Not run: 
##D plot(nhtemp, lag(nhtemp, 1), cex = .8, col="blue",
##D      main = "Lag plot of New Haven temperatures")
## End(Not run)


