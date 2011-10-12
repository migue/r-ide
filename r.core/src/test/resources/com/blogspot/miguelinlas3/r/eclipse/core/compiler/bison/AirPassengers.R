### Name: AirPassengers
### Title: Monthly Airline Passenger Numbers 1949-1960
### Aliases: AirPassengers
### Keywords: datasets

### ** Examples

## Not run: 
##D ## These are quite slow and so not run by example(AirPassengers)
##D 
##D ## The classic 'airline model', by full ML
##D (fit <- arima(log10(AirPassengers), c(0, 1, 1),
##D               seasonal = list(order=c(0, 1 ,1), period=12)))
##D update(fit, method = "CSS")
##D update(fit, x=window(log10(AirPassengers), start = 1954))
##D pred <- predict(fit, n.ahead = 24)
##D tl <- pred$pred - 1.96 * pred$se
##D tu <- pred$pred + 1.96 * pred$se
##D ts.plot(AirPassengers, 10^tl, 10^tu, log = "y", lty = c(1,2,2))
##D 
##D ## full ML fit is the same if the series is reversed, CSS fit is not
##D ap0 <- rev(log10(AirPassengers))
##D attributes(ap0) <- attributes(AirPassengers)
##D arima(ap0, c(0, 1, 1), seasonal = list(order=c(0, 1 ,1), period=12))
##D arima(ap0, c(0, 1, 1), seasonal = list(order=c(0, 1 ,1), period=12),
##D       method = "CSS")
##D 
##D ## Structural Time Series
##D ap <- log10(AirPassengers) - 2
##D (fit <- StructTS(ap, type= "BSM"))
##D par(mfrow=c(1,2))
##D plot(cbind(ap, fitted(fit)), plot.type = "single")
##D plot(cbind(ap, tsSmooth(fit)), plot.type = "single")
## End(Not run)


