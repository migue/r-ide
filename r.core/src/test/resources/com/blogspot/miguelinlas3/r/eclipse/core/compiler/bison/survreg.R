### Name: survreg
### Title: Regression for a Parametric Survival Model
### Aliases: survreg model.frame.survreg labels.survreg print.survreg.penal
###   print.summary.survreg survReg anova.survreg vcov.survreg
###   anova.survreglist censorReg
### Keywords: survival

### ** Examples

## These are all the same
survreg(Surv(futime, fustat) ~ ecog.ps + rx, ovarian, dist='weibull',scale=1)
survreg(Surv(futime, fustat) ~ ecog.ps + rx, ovarian,
dist="exponential")
survreg.old(Surv(futime, fustat) ~ ecog.ps + rx, ovarian, dist='extreme',fixed=list(scale=1),link="log")




