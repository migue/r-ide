### Name: predict.survreg
### Title: Predicted Values for a `survreg' Object
### Aliases: predict.survreg predict.survreg.penal
### Keywords: survival

### ** Examples

# Draw figure 1 from Escobar and Meeker
fit <- survreg(Surv(time,status) ~ age + age^2, data=stanford2,
        dist='lognormal')
plot(stanford2$age, stanford2$time, xlab='Age', ylab='Days',
        xlim=c(0,65), ylim=c(.01, 10^6), log='y')
pred <- predict(fit, newdata=list(age=1:65), type='quantile',
                 p=c(.1, .5, .9))
matlines(1:65, pred, lty=c(2,1,2), col=1)



