### Name: arima0
### Title: ARIMA Modelling of Time Series - Preliminary Version
### Aliases: arima0 print.arima0 predict.arima0
### Keywords: ts

### ** Examples

## Not run: arima0(lh, order = c(1,0,0))
arima0(lh, order = c(3,0,0))
arima0(lh, order = c(1,0,1))
predict(arima0(lh, order = c(3,0,0)), n.ahead = 12)

arima0(lh, order = c(3,0,0), method = "CSS")

# for a model with as few years as this, we want full ML
(fit <- arima0(USAccDeaths, order = c(0,1,1),
               seasonal = list(order=c(0,1,1)), delta = -1))
predict(fit, n.ahead = 6)

arima0(LakeHuron, order = c(2,0,0), xreg = time(LakeHuron)-1920)
## Not run: 
##D ## presidents contains NAs
##D ## graphs in example(acf) suggest order 1 or 3
##D (fit1 <- arima0(presidents, c(1, 0, 0), delta = -1))  # avoid warning
##D tsdiag(fit1)
##D (fit3 <- arima0(presidents, c(3, 0, 0), delta = -1))  # smaller AIC
##D tsdiag(fit3)
## End(Not run)



