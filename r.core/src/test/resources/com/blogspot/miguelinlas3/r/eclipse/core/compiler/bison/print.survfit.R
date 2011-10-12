### Name: print.survfit
### Title: Print a Short Summary of a Survival Curve
### Aliases: print.survfit
### Keywords: survival

### ** Examples

##effect of print.n and show.rmean

a<-coxph(Surv(start,stop,event)~age+strata(transplant),data=heart)
b<-survfit(a)
print(b,print.n="none")
print(b,print.n="records")
print(b,print.n="start")
print(b,print.n="max")
print(b,show.rmean=TRUE)



