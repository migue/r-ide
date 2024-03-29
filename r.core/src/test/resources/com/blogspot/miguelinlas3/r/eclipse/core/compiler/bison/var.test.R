### Name: var.test
### Title: F Test to Compare Two Variances
### Aliases: var.test var.test.default var.test.formula
### Keywords: htest

### ** Examples

x <- rnorm(50, mean = 0, sd = 2)
y <- rnorm(30, mean = 1, sd = 1)
var.test(x, y)                  # Do x and y have the same variance?
var.test(lm(x ~ 1), lm(y ~ 1))  # The same.



