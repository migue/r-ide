### Name: theta.md
### Title: Estimate theta of the Negative Binomial
### Aliases: theta.md theta.ml theta.mm
### Keywords: models

### ** Examples

quine.nb <- glm.nb(Days ~ .^2, data = quine)
theta.md(quine$Days, fitted(quine.nb), dfr = df.residual(quine.nb))
theta.ml(quine$Days, fitted(quine.nb))
theta.mm(quine$Days, fitted(quine.nb), dfr = df.residual(quine.nb))

## weighted example
yeast <- data.frame(cbind(numbers = 0:5, fr = c(213, 128, 37, 18, 3, 1)))
fit <- glm.nb(numbers ~ 1, weights = fr, data = yeast)
summary(fit)
attach(yeast)
mu <- fitted(fit)
theta.md(numbers, mu, dfr = 399, weights = fr)
theta.ml(numbers, mu, weights = fr)
theta.mm(numbers, mu, dfr = 399, weights = fr)
detach()



