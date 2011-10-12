### Name: bs
### Title: B-Spline Basis for Polynomial Splines
### Aliases: bs
### Keywords: smooth

### ** Examples

require(stats); require(graphics)
bs(women$height, df = 5)
summary(fm1 <- lm(weight ~ bs(height, df = 5), data = women))

## example of safe prediction
plot(women, xlab = "Height (in)", ylab = "Weight (lb)")
ht <- seq(57, 73, length.out = 200)
lines(ht, predict(fm1, data.frame(height=ht)))
## Not run: 
##D ## Consistency:
##D x <- c(1:3,5:6)
##D stopifnot(identical(bs(x), bs(x, df = 3)),
##D           !is.null(kk <- attr(bs(x), "knots")),# not true till 1.5.1
##D           length(kk) == 0)
## End(Not run)


