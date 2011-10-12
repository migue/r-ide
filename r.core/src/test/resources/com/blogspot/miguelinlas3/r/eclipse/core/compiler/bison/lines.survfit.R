### Name: lines.survfit
### Title: Add Lines or Points to a Survival Plot
### Aliases: lines.survfit points.survfit
### Keywords: survival

### ** Examples

fit <- survfit(Surv(time, status) ~ sex, pbc,subset=1:312)
plot(fit, mark.time=FALSE, xscale=365.24,
        xlab='Years', ylab='Survival')
lines(fit[1], lwd=2, xscale=365.24)    #darken the first curve and add marks

# add expected survival curves for the two groups,
#   based on the US census data
tdata <- data.frame(age=pbc$age*365.24, sex=pbc$sex +1,
                    year= rep(mdy.date(1,1,1976), nrow(pbc)))
tdata<-tdata[1:312,] ## only the randomised people, with no missing data

efit <- survexp(~ sex+ratetable(sex=sex,age=age,year=year), data=tdata, ratetable=survexp.us, times=(0:24)*182)
temp <- lines(efit, lty=2, xscale=365.24, lwd=2:1)
text(temp, c("Male", "Female"), adj= -.1) #labels just past the ends
title(main="Primary Biliary Cirrhosis, Observed and Expected")



