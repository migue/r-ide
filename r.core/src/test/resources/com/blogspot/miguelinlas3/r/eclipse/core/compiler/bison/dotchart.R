### Name: dotchart
### Title: Cleveland Dot Plots
### Aliases: dotchart
### Keywords: hplot

### ** Examples

dotchart(VADeaths, main = "Death Rates in Virginia - 1940")
op <- par(xaxs="i")# 0 -- 100%
dotchart(t(VADeaths), xlim = c(0,100),
         main = "Death Rates in Virginia - 1940")
par(op)



