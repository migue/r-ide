### Name: lm.summaries
### Title: Accessing Linear Model Fits
### Aliases: family.lm formula.lm residuals.lm labels.lm weights
###   weights.default
### Keywords: regression models

### ** Examples

## Don't show: 
utils::example("lm", echo = FALSE)
## End Don't show
##-- Continuing the  lm(.) example:
coef(lm.D90)# the bare coefficients

## The 2 basic regression diagnostic plots [plot.lm(.) is preferred]
plot(resid(lm.D90), fitted(lm.D90))# Tukey-Anscombe's
abline(h=0, lty=2, col = 'gray')

qqnorm(residuals(lm.D90))



