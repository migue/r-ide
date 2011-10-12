### Name: frailty
### Title: (Approximate) Frailty models
### Aliases: frailty frailty.gamma frailty.gaussian frailty.t frailty.brent
###   frailty.controlaic frailty.controldf frailty.controlgam
###   frailty.controlgauss frailty.gammacon
### Keywords: survival

### ** Examples

kfit <- coxph(Surv(time, status)~ age + sex + disease + frailty(id), kidney)
kfit0 <- coxph(Surv(time, status)~ age + sex + disease, kidney)
kfitm1 <- coxph(Surv(time,status) ~ age + sex + disease + 
                frailty(id, dist='gauss'), kidney)
coxph(Surv(time, status) ~ age + sex + frailty(id, dist='gauss', method='aic',caic=TRUE), kidney)
# uncorrected aic
coxph(Surv(time, status) ~ age + sex + frailty(id, method='aic', caic=FALSE), kidney)

rfit2a <- survreg(Surv(time, status) ~ rx +
                  frailty.gaussian(litter, df=13, sparse=FALSE), rats )
rfit2b <- survreg(Surv(time, status) ~ rx +
                  frailty.gaussian(litter, df=13, sparse=TRUE), rats )
rfit2a
rfit2b



