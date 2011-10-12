### Name: plot.survfit
### Title: Plot Method for `survfit'
### Aliases: plot.survfit
### Keywords: survival hplot

### ** Examples

leukemia.surv <- survfit(Surv(time, status) ~ x, data = aml)
plot(leukemia.surv, lty = 2:3)
legend(100, .9, c("Maintenance", "No Maintenance"), lty = 2:3)
title("Kaplan-Meier Curves\nfor AML Maintenance Study")

lsurv2 <- survfit(Surv(time, status) ~ x, aml, type='fleming')
plot(lsurv2, lty=2:3, fun="cumhaz",
        xlab="Months", ylab="Cumulative Hazard")

plot(leukemia.surv,lty=1:2,legend.pos=0,col=c("Red","Blue"),legend.text=c("Maintenance",
"No Maintenance"))
if (interactive()){
cat("Click on the graphics device to place a legend\n")
plot(leukemia.surv,lty=2:3,legend.pos=locator(1),legend.text=c("Maintenance",
"No Maintenance"))
}



