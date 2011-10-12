### Name: survfit
### Title: Compute a Survival Curve for Censored Data
### Aliases: survfit [.survfit survfit.km survfit.coxph.null survfit.coxph
###   basehaz
### Keywords: survival

### ** Examples

#fit a Kaplan-Meier and plot it
fit <- survfit(Surv(time, status) ~ x, data=aml)
plot(fit)
# plot only 1 of the 2 curves from above
plot(fit[1])
## the other line
lines(fit[2], col="blue")

#fit a cox proportional hazards model and plot the 
#predicted survival curve
fit <- coxph( Surv(futime,fustat)~resid.ds+rx+ecog.ps,data=ovarian)
plot( survfit( fit))



