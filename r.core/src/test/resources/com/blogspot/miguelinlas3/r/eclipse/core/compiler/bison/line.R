### Name: line
### Title: Robust Line Fitting
### Aliases: line residuals.tukeyline
### Keywords: robust regression

### ** Examples

require(graphics)

plot(cars)
(z <- line(cars))
abline(coef(z))
## Tukey-Anscombe Plot :
plot(residuals(z) ~ fitted(z), main = deparse(z$call))



