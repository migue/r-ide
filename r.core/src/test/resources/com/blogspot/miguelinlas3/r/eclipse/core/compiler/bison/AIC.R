### Name: AIC
### Title: Akaike's An Information Criterion
### Aliases: AIC
### Keywords: models

### ** Examples

lm1 <- lm(Fertility ~ . , data = swiss)
AIC(lm1)
stopifnot(all.equal(AIC(lm1),
                    AIC(logLik(lm1))))
## a version of BIC or Schwarz' BC :
AIC(lm1, k = log(nrow(swiss)))



