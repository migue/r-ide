### Name: summary.lm
### Title: Summarizing Linear Model Fits
### Aliases: summary.lm summary.mlm print.summary.lm
### Keywords: regression models

### ** Examples

## Don't show: 
utils::example("lm", echo = FALSE)
## End Don't show
##-- Continuing the  lm(.) example:
coef(lm.D90)# the bare coefficients
sld90 <- summary(lm.D90 <- lm(weight ~ group -1))# omitting intercept
sld90
coef(sld90)# much more



