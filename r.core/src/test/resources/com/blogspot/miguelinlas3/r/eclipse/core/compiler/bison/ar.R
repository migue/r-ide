### Name: ar
### Title: Fit Autoregressive Models to Time Series
### Aliases: ar ar.burg ar.burg.default ar.burg.mts ar.yw ar.yw.default
###   ar.yw.mts ar.mle print.ar predict.ar
### Keywords: ts

### ** Examples

ar(lh)
ar(lh, method="burg")
ar(lh, method="ols")
ar(lh, FALSE, 4) # fit ar(4)

(sunspot.ar <- ar(sunspot.year))
predict(sunspot.ar, n.ahead=25)
## try the other methods too

ar(ts.union(BJsales, BJsales.lead))
## Burg is quite different here, as is OLS (see ar.ols)
ar(ts.union(BJsales, BJsales.lead), method="burg")



