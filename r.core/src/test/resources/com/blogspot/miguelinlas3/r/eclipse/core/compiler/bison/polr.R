### Name: polr
### Title: Ordered Logistic or Probit Regression
### Aliases: polr
### Keywords: models

### ** Examples

options(contrasts = c("contr.treatment", "contr.poly"))
house.plr <- polr(Sat ~ Infl + Type + Cont, weights = Freq, data = housing)
house.plr
summary(house.plr)
## slightly worse fit from
summary(update(house.plr, method = "probit"))
## although it is not really appropriate, can fit
summary(update(house.plr, method = "cloglog"))

predict(house.plr, housing, type = "p")
addterm(house.plr, ~.^2, test = "Chisq")
house.plr2 <- stepAIC(house.plr, ~.^2)
house.plr2$anova
anova(house.plr, house.plr2)

house.plr <- update(house.plr, Hess=TRUE)
pr <- profile(house.plr)
confint(pr)
plot(pr)
pairs(pr)



