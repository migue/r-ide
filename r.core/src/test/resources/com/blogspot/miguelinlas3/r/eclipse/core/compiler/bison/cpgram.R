### Name: cpgram
### Title: Plot Cumulative Periodogram
### Aliases: cpgram
### Keywords: ts hplot

### ** Examples

require(graphics)

par(pty = "s", mfrow = c(1,2))
cpgram(lh)
lh.ar <- ar(lh, order.max = 9)
cpgram(lh.ar$resid, main = "AR(3) fit to lh")

cpgram(ldeaths)



