### Name: SSlogis
### Title: Logistic Model
### Aliases: SSlogis
### Keywords: models

### ** Examples

Chick.1 <- ChickWeight[ChickWeight$Chick == 1, ]
SSlogis( Chick.1$Time, 368, 14, 6 )  # response only
Asym <- 368; xmid <- 14; scal <- 6
SSlogis( Chick.1$Time, Asym, xmid, scal ) # response and gradient
getInitial(weight ~ SSlogis(Time, Asym, xmid, scal), data = Chick.1)
## Initial values are in fact the converged values
fm1 <- nls(weight ~ SSlogis(Time, Asym, xmid, scal), data = Chick.1)
summary(fm1)
## Don't show: 
require(graphics)

  xx <- seq(-0.5, 5, len = 101)
  yy <- 5 / ( 1 + exp((2-xx)))
  par(mar = c(0, 0, 3.5, 0))
  plot(xx, yy, type = "l", axes = FALSE, ylim = c(0,6), xlim = c(-1, 5),
       xlab = "", ylab = "", lwd = 2,
       main = "Parameters in the SSlogis model")
  usr <- par("usr")
  arrows(usr[1], 0, usr[2], 0, length = 0.1, angle = 25)
  arrows(0, usr[3], 0, usr[4], length = 0.1, angle = 25)
  text(usr[2] - 0.2, 0.1, "x", adj = c(1, 0))
  text(-0.1, usr[4], "y", adj = c(1, 1))
  abline(h = 5, lty = 2, lwd = 0)
  arrows(-0.8, 2.1, -0.8, 0, length = 0.1, angle = 25)
  arrows(-0.8, 2.9, -0.8, 5, length = 0.1, angle = 25)
  text(-0.8, 2.5, expression(phi[1]), adj = c(0.5, 0.5))
  segments(2, 0, 2, 4.0, lty = 2, lwd = 0.75)
  text(2, 4.0, expression(phi[2]), adj = c(0.5, 0))
  segments(3, 5/(1+exp(-1)) + 0.025, 3, 4.0, lty = 2, lwd = 0.75)
  arrows(2.3, 3.8, 2.0, 3.8, length = 0.08, angle = 25)
  arrows(2.7, 3.8, 3.0, 3.8, length = 0.08, angle = 25)
  text(2.5, 3.8, expression(phi[3]), adj = c(0.5, 0.5))
## End Don't show



