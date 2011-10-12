### Name: step
### Title: Choose a model by AIC in a Stepwise Algorithm
### Aliases: step
### Keywords: models

### ** Examples

utils::example(lm)
step(lm.D9)  

summary(lm1 <- lm(Fertility ~ ., data = swiss))
slm1 <- step(lm1)
summary(slm1)
slm1$anova



