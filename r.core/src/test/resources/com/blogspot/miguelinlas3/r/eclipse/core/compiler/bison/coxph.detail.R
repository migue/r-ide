### Name: coxph.detail
### Title: Details of a Cox Model Fit
### Aliases: coxph.detail
### Keywords: survival

### ** Examples

fit   <- coxph(Surv(futime,fustat) ~ age + rx + ecog.ps, ovarian, x=TRUE)
fitd  <- coxph.detail(fit)
events <- fit$y[,2]==1
etime  <- fit$y[events,1]   #the event times --- may have duplicates
indx   <- match(etime, fitd$time)
sresid <- fit$x[events,] - fitd$means[indx,]



