### Name: WWWusage
### Title: Internet Usage per Minute
### Aliases: WWWusage
### Keywords: datasets

### ** Examples

require(graphics)
work <- diff(WWWusage)
par(mfrow = c(2,1)); plot(WWWusage); plot(work)
## Not run: 
##D require(stats)
##D aics <- matrix(, 6, 6, dimnames=list(p=0:5, q=0:5))
##D for(q in 1:5) aics[1, 1+q] <- arima(WWWusage, c(0,1,q),
##D     optim.control = list(maxit = 500))$aic
##D for(p in 1:5)
##D    for(q in 0:5) aics[1+p, 1+q] <- arima(WWWusage, c(p,1,q),
##D        optim.control = list(maxit = 500))$aic
##D round(aics - min(aics, na.rm=TRUE), 2)
## End(Not run)


