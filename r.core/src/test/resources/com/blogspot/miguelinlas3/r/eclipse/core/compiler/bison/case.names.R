### Name: case/variable.names
### Title: Case and Variable Names of Fitted Models
### Aliases: case.names case.names.lm variable.names variable.names.lm
### Keywords: regression models

### ** Examples

x <- 1:20
y <-  x + (x/4 - 2)^3 + rnorm(20, sd=3)
names(y) <- paste("O",x,sep=".")
ww <- rep(1,20); ww[13] <- 0
summary(lmxy <- lm(y ~ x + I(x^2)+I(x^3) + I((x-10)^2),
                   weights = ww), cor = TRUE)
variable.names(lmxy)
variable.names(lmxy, full= TRUE)# includes the last
case.names(lmxy)
case.names(lmxy, full = TRUE)# includes the 0-weight case



