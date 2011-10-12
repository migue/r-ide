### Name: lm.fit
### Title: Fitter Functions for Linear Models
### Aliases: lm.fit lm.wfit
### Keywords: regression array

### ** Examples

require(utils)
set.seed(129)
n <- 7 ; p <- 2
X <- matrix(rnorm(n * p), n,p) # no intercept!
y <- rnorm(n)
w <- rnorm(n)^2

str(lmw <- lm.wfit(x=X, y=y, w=w))

str(lm. <- lm.fit (x=X, y=y))




