### Name: SSfpl
### Title: Four-parameter Logistic Model
### Aliases: SSfpl
### Keywords: models

### ** Examples

Chick.1 <- ChickWeight[ChickWeight$Chick == 1, ]
SSfpl( Chick.1$Time, 13, 368, 14, 6 )  # response only
A <- 13; B <- 368; xmid <- 14; scal <- 6
SSfpl( Chick.1$Time, A, B, xmid, scal ) # response and gradient
getInitial(weight ~ SSfpl(Time, A, B, xmid, scal), data = Chick.1)
## Initial values are in fact the converged values
fm1 <- nls(weight ~ SSfpl(Time, A, B, xmid, scal), data = Chick.1)
summary(fm1)
## Don't show: 
require(graphics)

  xx <- seq(-0.5, 5, len = 101)
  yy <- 1 + 4 / ( 1 + exp((2-xx)))
  par(mar = c(0, 0, 3.5, 0))
  plot(xx, yy, type = "l", axes = FALSE, ylim = c(0,6), xlim = c(-1, 5),
       xlab = "", ylab = "", lwd = 2,
       main = "Parameters in the SSfpl model")
  usr <- par("usr")
  arrows(usr[1], 0, usr[2], 0, length = 0.1, angle = 25)
  arrows(0, usr[3], 0, usr[4], length = 0.1, angle = 25)
  text(usr[2] - 0.2, 0.1, "x", adj = c(1, 0))
  text(-0.1, usr[4], "y", adj = c(1, 1))
  abline(h = 5, lty = 2, lwd = 0)
  arrows(-0.8, 2.1, -0.8, 0, length = 0.1, angle = 25)
  arrows(-0.8, 2.9, -0.8, 5, length = 0.1, angle = 25)
  text(-0.8, 2.5, expression(phi[1]), adj = c(0.5, 0.5))
  abline(h = 1, lty = 2, lwd = 0)
  arrows(-0.3, 0.25, -0.3, 0, length = 0.07, angle = 25)
  arrows(-0.3, 0.75, -0.3, 1, length = 0.07, angle = 25)
  text(-0.3, 0.5, expression(phi[2]), adj = c(0.5, 0.5))
  segments(2, 0, 2, 3.3, lty = 2, lwd = 0.75)
  text(2, 3.3, expression(phi[3]), adj = c(0.5, 0))
  segments(3, 1+4/(1+exp(-1)) - 0.025, 3, 2.5, lty = 2, lwd = 0.75)
  arrows(2.3, 2.7, 2.0, 2.7, length = 0.08, angle = 25)
  arrows(2.7, 2.7, 3.0, 2.7, length = 0.08, angle = 25)
  text(2.5, 2.7, expression(phi[4]), adj = c(0.5, 0.5))
## End Don't show



