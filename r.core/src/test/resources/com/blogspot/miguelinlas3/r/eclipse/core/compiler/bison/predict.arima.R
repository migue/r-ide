### Name: predict.Arima
### Title: Forecast from ARIMA fits
### Aliases: predict.Arima
### Keywords: ts

### ** Examples

predict(arima(lh, order = c(3,0,0)), n.ahead = 12)

(fit <- arima(USAccDeaths, order = c(0,1,1),
              seasonal = list(order=c(0,1,1))))
predict(fit, n.ahead = 6)



