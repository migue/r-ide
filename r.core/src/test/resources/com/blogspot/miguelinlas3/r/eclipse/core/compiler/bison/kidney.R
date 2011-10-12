### Name: kidney
### Title: Kidney data from survival5
### Aliases: kidney
### Keywords: survival

### ** Examples

kfit <- coxph(Surv(time, status)~ age + sex + disease + frailty(id), kidney)
kfit0 <- coxph(Surv(time, status)~ age + sex + disease, kidney)
kfitm1 <- coxph(Surv(time,status) ~ age + sex + disease + 
                frailty(id, dist='gauss'), kidney)




