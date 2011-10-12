### Name: survreg.old
### Title: Old (survival4) Regression for a parametric survival model
### Aliases: survreg.old
### Keywords: survival

### ** Examples

survreg.old(Surv(futime, fustat) ~ ecog.ps + rx, ovarian, dist='extreme',
                link='log', fixed=list(scale=1))   #Fit an exponential



