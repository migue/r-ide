### Name: SSasympOrig
### Title: Asymptotic Regression Model through the Origin
### Aliases: SSasympOrig
### Keywords: models

### ** Examples

Lob.329 <- Loblolly[ Loblolly$Seed == "329", ]
SSasympOrig( Lob.329$age, 100, -3.2 )  # response only
Asym <- 100; lrc <- -3.2
SSasympOrig( Lob.329$age, Asym, lrc ) # response and gradient
getInitial(height ~ SSasympOrig(age, Asym, lrc), data = Lob.329)
## Initial values are in fact the converged values
fm1 <- nls(height ~ SSasympOrig( age, Asym, lrc), data = Lob.329)
summary(fm1)
## Don't show: 
require(graphics)

  xx <- seq(0, 5, len = 101)
  yy <- 5 * (1- exp(-xx/(2*log(2))))
  par(mar = c(0, 0, 3.5, 0))
  plot(xx, yy, type = "l", axes = FALSE, ylim = c(0,6), xlim = c(-1, 5),
       xlab = "", ylab = "", lwd = 2,
       main = "Parameters in the SSasympOrig model")
  usr <- par("usr")
  arrows(usr[1], 0, usr[2], 0, length = 0.1, angle = 25)
  arrows(0, usr[3], 0, usr[4], length = 0.1, angle = 25)
  text(usr[2] - 0.2, 0.1, "x", adj = c(1, 0))
  text(-0.1, usr[4], "y", adj = c(1, 1))
  abline(h = 5, lty = 2, lwd = 0)
  arrows(-0.8, 2.1, -0.8, 0, length = 0.1, angle = 25)
  arrows(-0.8, 2.9, -0.8, 5, length = 0.1, angle = 25)
  text(-0.8, 2.5, expression(phi[1]), adj = c(0.5, 0.5))
  segments(1, 2.525, 1, 3.5, lty = 2, lwd = 0.75)
  arrows(0.2, 3.0, 0, 3.0, length = 0.08, angle = 25)
  arrows(0.8, 3.0, 1, 3.0, length = 0.08, angle = 25)
  text(0.5, 3.0, expression(t[0.5]), adj = c(0.5, 0.5))
## End Don't show



