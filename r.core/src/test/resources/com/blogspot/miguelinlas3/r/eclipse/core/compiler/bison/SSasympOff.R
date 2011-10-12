### Name: SSasympOff
### Title: Asymptotic Regression Model with an Offset
### Aliases: SSasympOff
### Keywords: models

### ** Examples

CO2.Qn1 <- CO2[CO2$Plant == "Qn1", ]
SSasympOff( CO2.Qn1$conc, 32, -4, 43 )  # response only
Asym <- 32; lrc <- -4; c0 <- 43
SSasympOff( CO2.Qn1$conc, Asym, lrc, c0 ) # response and gradient
getInitial(uptake ~ SSasympOff( conc, Asym, lrc, c0), data = CO2.Qn1)
## Initial values are in fact the converged values
fm1 <- nls(uptake ~ SSasympOff( conc, Asym, lrc, c0), data = CO2.Qn1)
summary(fm1)
## Don't show: 
require(graphics)

  xx <- seq(0.5, 5, len = 101)
  yy <- 5 * (1 -  exp(-(xx - 0.5)/(2*log(2))))
  par(mar = c(0, 0, 4.0, 0))
  plot(xx, yy, type = "l", axes = FALSE, ylim = c(0,6), xlim = c(-1, 5),
       xlab = "", ylab = "", lwd = 2,
       main = "Parameters in the SSasympOff model")
  usr <- par("usr")
  arrows(usr[1], 0, usr[2], 0, length = 0.1, angle = 25)
  arrows(0, usr[3], 0, usr[4], length = 0.1, angle = 25)
  text(usr[2] - 0.2, 0.1, "x", adj = c(1, 0))
  text(-0.1, usr[4], "y", adj = c(1, 1))
  abline(h = 5, lty = 2, lwd = 0)
  arrows(-0.8, 2.1, -0.8, 0, length = 0.1, angle = 25)
  arrows(-0.8, 2.9, -0.8, 5, length = 0.1, angle = 25)
  text(-0.8, 2.5, expression(phi[1]), adj = c(0.5, 0.5))
  segments(0.5, 0, 0.5, 3, lty = 2, lwd = 0.75)
  text(0.5, 3.1, expression(phi[3]), adj = c(0.5, 0))
  segments(1.5, 2.525, 1.5, 3, lty = 2, lwd = 0.75)
  arrows(0.7, 2.65, 0.5, 2.65, length = 0.08, angle = 25)
  arrows(1.3, 2.65, 1.5, 2.65, length = 0.08, angle = 25)
  text(1.0, 2.65, expression(t[0.5]), adj = c(0.5, 0.5))
## End Don't show



