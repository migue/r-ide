### Name: strata
### Title: Identify Stratum Variables
### Aliases: strata
### Keywords: survival

### ** Examples

a<-factor(rep(1:3,4))
b<-factor(rep(1:4,3))
levels(strata(a))
levels(strata(a,b,shortlabel=TRUE))

coxph(Surv(futime, fustat) ~ age + strata(rx), data=ovarian)



