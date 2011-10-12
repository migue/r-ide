### Name: BIC
### Title: Bayesian Information Criterion
### Aliases: BIC BIC,ANY-method BIC,logLik-method
### Keywords: models

### ** Examples

lm1 <- lm(Fertility ~ . , data = swiss)
AIC(lm1)
BIC(lm1)

## Don't show:
## 2 equivalent ways of calculating the BIC:
stopifnot(all.equal(AIC(lm1, k=log(nrow(swiss))), BIC(lm1)))
## End Don't show



