### Name: ratetable
### Title: Ratetable reference in formula
### Aliases: ratetable [.ratetable [.ratetable2 print.ratetable
###   is.na.ratetable summary.ratetable
### Keywords: survival

### ** Examples


fit <- survfit(Surv(time, status) ~ sex, pbc,subset=1:312)
if (require(date)){
tdata <- data.frame(agedays=pbc$age*365.24, sex=pbc$sex +1,
                    year= rep(mdy.date(1,1,1976), nrow(pbc)))
tdata<-tdata[1:312,] ## only the randomised people, with no missing data

efit <- survexp(~ sex+ratetable(sex=sex,age=agedays,year=year), data=tdata, ratetable=survexp.us, times=(0:24)*182)
}




