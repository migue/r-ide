### Name: cluster
### Title: Identify Clusters
### Aliases: cluster
### Keywords: survival

### ** Examples

frailty.model <- coxph(Surv(time, status)~ age + sex + disease + frailty(id), kidney)
marginal.model <- coxph(Surv(time, status)~ age + sex + disease+cluster(id), kidney)
summary(frailty.model)
summary(marginal.model)

frailty.model <- survreg(Surv(time, status) ~ rx +  frailty(litter), rats )
marginal.model <- survreg(Surv(time, status) ~ rx +  cluster(litter), rats )
summary(frailty.model)
summary(marginal.model)




