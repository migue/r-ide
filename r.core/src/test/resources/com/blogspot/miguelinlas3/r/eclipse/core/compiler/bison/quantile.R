### Name: quantile
### Title: Sample Quantiles
### Aliases: quantile quantile.default
### Keywords: univar

### ** Examples

quantile(x <- rnorm(1001))# Extremes & Quartiles by default
quantile(x,  probs=c(.1,.5,1,2,5,10,50, NA)/100)

### Compare different types
p <- c(0.1,0.5,1,2,5,10,50)/100
res <- matrix(as.numeric(NA), 9, 7)
for(type in 1:9) res[type, ] <- y <- quantile(x,  p, type=type)
dimnames(res) <- list(1:9, names(y))
round(res, 3)



