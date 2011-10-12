### Name: SSbiexp
### Title: Biexponential model
### Aliases: SSbiexp
### Keywords: models

### ** Examples

Indo.1 <- Indometh[Indometh$Subject == 1, ]
SSbiexp( Indo.1$time, 3, 1, 0.6, -1.3 )  # response only
A1 <- 3; lrc1 <- 1; A2 <- 0.6; lrc2 <- -1.3
SSbiexp( Indo.1$time, A1, lrc1, A2, lrc2 ) # response and gradient
getInitial(conc ~ SSbiexp(time, A1, lrc1, A2, lrc2), data = Indo.1)
## Initial values are in fact the converged values
fm1 <- nls(conc ~ SSbiexp(time, A1, lrc1, A2, lrc2), data = Indo.1)
summary(fm1)
## Don't show: 
  require(graphics)

  xx <- seq(0, 5, len = 101)
  y1 <- 3.5 * exp(-4*xx)
  y2 <- 1.5 * exp(-xx)
  yy <- y1 + y2
  par(mar = c(0, 0, 3.5, 0))
  plot(xx, yy, type = "n", axes = FALSE, ylim = c(-0.2,6), xlim = c(0, 5),
       xlab = "", ylab = "", main = "Components of the SSbiexp model")
  usr <- par("usr")
  lines(xx, y1, lty = 2, lwd = 0.75)
  lines(xx, y2, lty = 3, lwd = 0.75)
  lines(xx, yy, lwd = 2)
  segments(1:5, 0, 1:5, -0.15)
  segments(0, 1:5, -0.06, 1:5)
  text(-0.1, 1:5, 1:5, adj = c(1, 0.25), cex = 0.7)
  text(1:5, -0.15, 1:5, adj = c(0.5, 1), cex = 0.7)
  arrows(usr[1], 0, usr[2], 0, length = 0.1, angle = 25)
  arrows(0, usr[3], 0, usr[4], length = 0.1, angle = 25)
  text(usr[2] - 0.2, 0.1, "x", adj = c(1, 0))
  text(-0.1, usr[4], "y", adj = c(1, 1))
## End Don't show



