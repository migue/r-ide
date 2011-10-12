### Name: bandwidth
### Title: Bandwidth Selectors for Kernel Density Estimation
### Aliases: bw.nrd0 bw.nrd bw.ucv bw.bcv bw.SJ
### Keywords: distribution smooth

### ** Examples

require(graphics)

plot(density(precip, n = 1000))
rug(precip)
lines(density(precip, bw="nrd"), col = 2)
lines(density(precip, bw="ucv"), col = 3)
lines(density(precip, bw="bcv"), col = 4)
lines(density(precip, bw="SJ-ste"), col = 5)
lines(density(precip, bw="SJ-dpi"), col = 6)
legend(55, 0.035,
       legend = c("nrd0", "nrd", "ucv", "bcv", "SJ-ste", "SJ-dpi"),
       col = 1:6, lty = 1)



