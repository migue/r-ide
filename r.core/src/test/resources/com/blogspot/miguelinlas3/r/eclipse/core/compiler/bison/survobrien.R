### Name: survobrien
### Title: O'Brien's Test for Association of a Single Variable with
###   Survival
### Aliases: survobrien
### Keywords: survival

### ** Examples

xx <- survobrien(Surv(futime, fustat) ~ age + factor(rx) + I(ecog.ps),
                               data=ovarian)
coxph(Surv(start, stop, event) ~ age, data=xx)
coxph(Surv(start, stop, event) ~ age + rx + ecog.ps, data=xx)



