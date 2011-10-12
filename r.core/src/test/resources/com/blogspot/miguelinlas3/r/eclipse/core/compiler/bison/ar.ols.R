### Name: ar.ols
### Title: Fit Autoregressive Models to Time Series by OLS
### Aliases: ar.ols
### Keywords: ts

### ** Examples

ar(lh, method="burg")
ar.ols(lh)
ar.ols(lh, FALSE, 4) # fit ar(4)

ar.ols(ts.union(BJsales, BJsales.lead))

x <- diff(log(EuStockMarkets))
ar.ols(x, order.max=6, demean=FALSE, intercept=TRUE)



