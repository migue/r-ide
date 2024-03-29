### Name: effects
### Title: Effects from Fitted Model
### Aliases: effects effects.lm effects.glm
### Keywords: models regression

### ** Examples

y <- c(1:3,7,5)
x <- c(1:3,6:7)
( ee <- effects(lm(y ~ x)) )
c( round(ee - effects(lm(y+10 ~ I(x-3.8))), 3) )
# just the first is different



