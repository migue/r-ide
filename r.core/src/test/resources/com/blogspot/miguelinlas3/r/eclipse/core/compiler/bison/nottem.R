### Name: nottem
### Title: Average Monthly Temperatures at Nottingham, 1920-1939
### Aliases: nottem
### Keywords: datasets

### ** Examples

## Not run: 
##D require(stats); require(graphics)
##D nott <- window(nottem, end=c(1936,12))
##D fit <- arima(nott,order=c(1,0,0), list(order=c(2,1,0), period=12))
##D nott.fore <- predict(fit, n.ahead=36)
##D ts.plot(nott, nott.fore$pred, nott.fore$pred+2*nott.fore$se,
##D         nott.fore$pred-2*nott.fore$se, gpars=list(col=c(1,1,4,4)))
## End(Not run)


