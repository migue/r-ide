### Name: anova.coxph
### Title: Analysis of Deviance for Cox model.
### Aliases: anova.coxph anova.coxphlist
### Keywords: models regression survival

### ** Examples

fit <- coxph(Surv(futime, fustat) ~ resid.ds *rx + ecog.ps, data = ovarian) 
anova(fit)
anova(fit,test="Chisq")
fit2 <- coxph(Surv(futime, fustat) ~ resid.ds +rx + ecog.ps, data
=ovarian)
anova(fit2,fit)
 


