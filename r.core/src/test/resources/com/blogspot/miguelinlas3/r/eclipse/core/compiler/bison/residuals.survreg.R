### Name: residuals.survreg
### Title: Compute Residuals for `survreg' Objects
### Aliases: residuals.survreg residuals.survreg.penal
### Keywords: survival

### ** Examples

fit <- survreg(Surv(time,status) ~x, aml)
rr  <- residuals(fit, type='matrix')



