### Name: predict.nlme
### Title: Predictions from an nlme Object
### Aliases: predict.nlme
### Keywords: models

### ** Examples

fm1 <- nlme(height ~ SSasymp(age, Asym, R0, lrc),
            data = Loblolly,
            fixed = Asym + R0 + lrc ~ 1,
            random = Asym ~ 1,
            start = c(Asym = 103, R0 = -8.5, lrc = -3.3))
newLoblolly <- data.frame(age = c(5,10,15,20,25,30),
                    Seed = rep(301,6))
predict(fm1, newLoblolly, level = 0:1)



