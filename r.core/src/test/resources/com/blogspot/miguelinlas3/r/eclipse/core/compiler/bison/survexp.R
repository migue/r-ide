### Name: survexp
### Title: Compute Expected Survival
### Aliases: survexp survexp.cfit print.survexp
### Keywords: survival

### ** Examples

## compare survival to US population
cancer$year<-rep(as.date("1/1/1980"),nrow(cancer))
efit <- survexp( ~ ratetable(sex=sex, year=year, age=age*365), times=(1:4)*365,data=cancer)
plot(survfit(Surv(time, status) ~1,data=cancer))
lines(efit)

## compare data to Cox model 
## fit to randomised patients in Mayo PBC data
m<-coxph(Surv(time,status)~edtrt+log(bili)+log(protime)+age+platelet,data=pbc,
      subset=trt>0)
##compare Kaplan-Meier to fitted model for 2 edema groups in
##unrandomised patients
plot(survfit(Surv(time,status)~edtrt,data=pbc,subset=trt==-9))
lines(survexp(~edtrt+ratetable(edtrt=edtrt,bili=bili,platelet=platelet,age=age,
  protime=protime),data=pbc,subset=trt==-9,ratetable=m,cohort=TRUE),col="purple")



