### Name: predict.coxph
### Title: Predictions for Cox model
### Aliases: predict.coxph predict.coxph.penal
### Keywords: survival

### ** Examples

fit<-coxph(Surv(time,status)~x,data=aml)
predict(fit,type="lp")
predict(fit,type="risk")
predict(fit,type="expected")
predict(fit,type="terms")
predict(fit,type="lp",se.fit=TRUE)
predict(fit,type="risk",se.fit=TRUE)
predict(fit,type="expected",se.fit=TRUE)
predict(fit,type="terms",se.fit=TRUE)



