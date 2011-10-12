### Name: weighted.residuals
### Title: Compute Weighted Residuals
### Aliases: weighted.residuals
### Keywords: regression

### ** Examples

utils::example("lm")
all.equal(weighted.residuals(lm.D9),
          residuals(lm.D9))
x <- 1:10
w <- 0:9
y <- rnorm(x)
weighted.residuals(lmxy <- lm(y ~ x, weights = w))
weighted.residuals(lmxy, drop0 = FALSE)



